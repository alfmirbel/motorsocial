import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../database/dio_client.dart';

/// SharedPreferences instance (inicializada en `main` antes de runApp).
/// Se reescribe vía `override` en tests.
final sharedPreferencesProvider =
    FutureProvider<SharedPreferences>((ref) async {
  return SharedPreferences.getInstance();
});

/// Almacenamiento del JWT según plataforma:
/// - iOS/Android → FlutterSecureStorage
/// - Web/Windows → SharedPreferences (fallback)
final tokenStorageProvider = FutureProvider<TokenStorage>((ref) async {
  final prefs = await ref.watch(sharedPreferencesProvider.future);
  return defaultTokenStorage(prefs);
});

/// Cliente Dio configurado con interceptores (logging, JWT, retry).
/// Se construye una vez el `tokenStorage` está disponible.
final dioClientProvider = FutureProvider<DioClient>((ref) async {
  final tokenStorage = await ref.watch(tokenStorageProvider.future);
  return DioClient(tokenStorage: tokenStorage);
});

/// Provider directo de `Dio` consumido por los repositorios.
///
/// Uso típico en un repositorio:
/// ```dart
/// final dio = await ref.watch(dioProvider.future);
/// final response = await dio.post('/login', data: credentials);
/// ```
final dioProvider = FutureProvider<Dio>((ref) async {
  final client = await ref.watch(dioClientProvider.future);
  return client.dio;
});
