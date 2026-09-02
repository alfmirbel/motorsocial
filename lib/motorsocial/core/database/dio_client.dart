import 'dart:convert';
import 'dart:io' show Platform;

import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:flutter/foundation.dart' show kIsWeb, kDebugMode, debugPrint;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Contrato de almacenamiento del JWT de sesión.
///
/// Por defecto se usa [FlutterSecureStorage] en iOS/Android y
/// [SharedPreferences] (fallback) en Web/Windows, tal como exige AGENTS.md:
/// > JWT storage: `flutter_secure_storage` on iOS/Android,
/// >   `shared_preferences` on Web/Windows.
abstract class TokenStorage {
  Future<String?> readToken();
  Future<void> writeToken(String? token);
  Future<void> deleteToken();
}

/// Implementación con `FlutterSecureStorage` (iOS/Android).
class SecureTokenStorage implements TokenStorage {
  final FlutterSecureStorage _storage;
  SecureTokenStorage({FlutterSecureStorage? storage})
      : _storage = storage ?? const FlutterSecureStorage();

  static const String _key = 'jwt_token';

  @override
  Future<String?> readToken() => _storage.read(key: _key);

  @override
  Future<void> writeToken(String? token) async {
    if (token == null || token.isEmpty) {
      await _storage.delete(key: _key);
    } else {
      await _storage.write(key: _key, value: token);
    }
  }

  @override
  Future<void> deleteToken() => _storage.delete(key: _key);
}

/// Implementación con `SharedPreferences` (Web/Windows). Fallback no criptográfico.
class PreferencesTokenStorage implements TokenStorage {
  final SharedPreferences _prefs;
  PreferencesTokenStorage(this._prefs);

  static const String _key = 'jwt_token';

  @override
  Future<String?> readToken() async => _prefs.getString(_key);

  @override
  Future<void> writeToken(String? token) async {
    if (token == null || token.isEmpty) {
      await _prefs.remove(_key);
    } else {
      await _prefs.setString(_key, token);
    }
  }

  @override
  Future<void> deleteToken() => _prefs.remove(_key);
}

/// Selecciona el almacenamiento según plataforma:
/// - iOS/Android → [SecureTokenStorage]
/// - Web/Windows → [PreferencesTokenStorage]
TokenStorage defaultTokenStorage(SharedPreferences prefs) {
  if (kIsWeb || Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    return PreferencesTokenStorage(prefs);
  }
  return SecureTokenStorage();
}

/// Interceptor JWT: adjunta `Authorization: Bearer <token>` a cada petición.
///
/// En 401 no lanza: limpia el token (sesión caducada) y propaga el error para
/// que los consumidores (repositorios / `authStateProvider`) reaccionen sin
/// crash. Cumple la mitigación de riesgo del plan:
/// > Manejar 401 devolviendo `null`/estado vacío, no crash.
class JwtInterceptor extends Interceptor {
  final TokenStorage _tokenStorage;
  JwtInterceptor(this._tokenStorage);

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // No adjuntar token si la petición ya lo incluye (p.ej. login/refresh).
    if (!options.headers.containsKey('Authorization')) {
      final token = await _tokenStorage.readToken();
      if (token != null && token.isNotEmpty) {
        options.headers['Authorization'] = 'Bearer $token';
      }
    }
    handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode == 401) {
      // Sesión caducada / inválida: limpiar token y dejar que el flujo
      // de UI gestione el estado vacío.
      await _tokenStorage.deleteToken();
    }
    handler.next(err);
  }
}

/// Interceptores y configuración por defecto del cliente HTTP Dio.
///
/// `baseUrl` se configura en runtime vía [DioClient.configure] con la URL
/// de `CouchDbConfig.url` (o equivalente del backend Node/Express).
class DioClient {
  final Dio dio;
  final TokenStorage tokenStorage;

  DioClient({Dio? dio, required this.tokenStorage}) : dio = dio ?? Dio() {
    _configure();
  }

  void _configure() {
    dio.options
      ..connectTimeout = const Duration(seconds: 15)
      ..receiveTimeout = const Duration(seconds: 20)
      ..sendTimeout = const Duration(seconds: 20)
      ..validateStatus =
          (status) => status != null && status >= 200 && status < 400;

    // Logging solo en debug; silencioso en release.
    if (kDebugMode) {
      dio.interceptors.add(
        LogInterceptor(
          requestHeader: false,
          responseHeader: false,
          error: true,
          logPrint: (m) => debugPrint('[dio] $m'),
        ),
      );
    }

    // JWT: añadir token a cada petición y reaccionar a 401.
    dio.interceptors.add(JwtInterceptor(tokenStorage));

    // Reintentos inteligentes en fallos transitorios (red/conexión).
    dio.interceptors.add(
      RetryInterceptor(
        dio: dio,
        retries: 3,
        retryDelays: const [
          Duration(seconds: 1),
          Duration(seconds: 2),
          Duration(seconds: 4),
        ],
      ),
    );
  }

  /// Define o redefine el `baseUrl` (p.ej. al cargar `SocialAppConfig`).
  void configure({required String baseUrl, Map<String, String>? headers}) {
    dio.options.baseUrl = baseUrl;
    if (headers != null) {
      dio.options.headers.addAll(headers);
    }
  }

  /// Headers JSON por defecto para todos los endpoints del backend.
  void applyJsonDefaults() {
    dio.options.headers
      ..['Accept'] = 'application/json'
      ..['Content-Type'] = 'application/json';
  }

  void close() => dio.close();
}

/// Decodificación tolerante de un body Dio (String, List<int> o JSON ya parsed).
Map<String, dynamic>? decodeJsonObject(dynamic body) {
  if (body == null) return null;
  if (body is Map<String, dynamic>) return body;
  if (body is String) {
    try {
      final decoded = jsonDecode(body);
      return decoded is Map<String, dynamic> ? decoded : null;
    } catch (_) {
      return null;
    }
  }
  if (body is List<int>) {
    try {
      return jsonDecode(String.fromCharCodes(body)) as Map<String, dynamic>?;
    } catch (_) {
      return null;
    }
  }
  return null;
}
