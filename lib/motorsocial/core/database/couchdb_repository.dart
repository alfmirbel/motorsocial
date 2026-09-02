import 'dart:convert';

import 'package:dio/dio.dart';

class CouchDbConfig {
  final String url;
  final String username;
  final String password;

  const CouchDbConfig({
    required this.url,
    required this.username,
    required this.password,
  });
}

/// Repositorio CouchDB sobre Dio.
///
/// Conserva la superficie pública anterior (`ping`, `ensureDatabase`, `get`,
/// `put`, `delete`, `queryView`) de modo que los consumidores no cambian.
/// Internamente usa [Dio] en lugar de `package:http`, heredando así el
/// `JwtInterceptor` y los reintentos inteligentes cuando se inyecta la
/// instancia compartida de `dioProvider`.
class CouchDbRepository {
  final CouchDbConfig config;
  final Dio _dio;

  CouchDbRepository({required this.config, Dio? dio}) : _dio = dio ?? Dio() {
    // Base sin trailing slash; el resto de rutas son relativas al baseUrl.
    _dio.options
      ..baseUrl = config.url.trim().replaceAll(RegExp(r'/+$'), '')
      ..headers = _headers()
      ..validateStatus =
          (status) => status != null; // no lanzar: evaluamos statusCode.
  }

  String _path(String db, [String? docId]) =>
      docId == null ? '/$db' : '/$db/$docId';

  Future<bool> ping() async {
    try {
      final res = await _dio.get<dynamic>('/');
      return res.statusCode == 200;
    } on DioException {
      return false;
    }
  }

  Future<bool> createDatabase(String db) async {
    try {
      final res = await _dio.put<dynamic>(_path(db));
      return res.statusCode == 201 || res.statusCode == 412;
    } on DioException catch (e) {
      final code = e.response?.statusCode ?? 0;
      return code == 201 || code == 412;
    }
  }

  Future<bool> ensureDatabase(String db) async {
    final exists = await ping();
    if (exists) return true;
    return createDatabase(db);
  }

  Future<Map<String, dynamic>?> get(String db, String id) async {
    try {
      final res = await _dio.get<dynamic>(_path(db, id));
      if (res.statusCode == 200) {
        return _decodeMap(res.data);
      }
      return null;
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) return null;
      rethrow;
    }
  }

  Future<String> put(String db, Map<String, dynamic> doc) async {
    final existingId = doc['_id'] as String?;
    final body = jsonEncode(doc);
    Response<dynamic> res;
    if (existingId == null) {
      res = await _dio.post<dynamic>(_path(db), data: body);
    } else {
      res = await _dio.put<dynamic>(_path(db, existingId), data: body);
    }

    final code = res.statusCode ?? 0;
    if (code == 201 || code == 200) {
      final map = _decodeMap(res.data) ?? <String, dynamic>{};
      return (map['id'] ?? existingId ?? '') as String;
    }
    throw CouchDbException('PUT failed: $code ${res.data?.toString() ?? ''}');
  }

  Future<void> delete(String db, String id, String rev) async {
    final res = await _dio.delete<dynamic>(_path(db, '$id?rev=$rev'));
    if ((res.statusCode ?? 0) != 200) {
      throw CouchDbException('DELETE failed: ${res.statusCode}');
    }
  }

  Future<Map<String, dynamic>> queryView(
    String db,
    String design,
    String view, {
    String? key,
    String? startKey,
    String? endKey,
    bool descending = false,
    int? limit,
  }) async {
    final query = <String, String>{
      'include_docs': 'true',
      if (key != null) 'key': key,
      if (startKey != null) 'startKey': startKey,
      if (endKey != null) 'endKey': endKey,
      'descending': descending ? 'true' : 'false',
      if (limit != null) 'limit': '$limit',
    };

    final res = await _dio.get<dynamic>(
      _path(db, '_design/$design/_view/$view'),
      queryParameters: query,
    );
    if ((res.statusCode ?? 0) == 200) {
      return _decodeMap(res.data) ?? <String, dynamic>{};
    }
    throw CouchDbException('queryView failed: ${res.statusCode}');
  }

  Map<String, String> _headers() {
    final basic =
        base64Encode('${config.username}:${config.password}'.codeUnits);
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Basic $basic',
    };
  }

  Map<String, dynamic>? _decodeMap(dynamic body) {
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
    if (body is Map) return Map<String, dynamic>.from(body);
    return null;
  }

  void close() => _dio.close();
}

class CouchDbException implements Exception {
  final String message;
  const CouchDbException(this.message);

  @override
  String toString() => 'CouchDbException: $message';
}
