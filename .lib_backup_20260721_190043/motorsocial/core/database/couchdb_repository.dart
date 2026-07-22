import 'dart:convert';
import 'package:http/http.dart' as http;

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

class CouchDbRepository {
  final CouchDbConfig config;
  final http.Client client;

  CouchDbRepository({required this.config, http.Client? client})
      : client = client ?? http.Client();

  Uri _uri(String db, [String? docId]) {
    final base = '${config.url.trim().replaceAll(RegExp(r'/+$'), '')}/$db';
    return docId == null ? Uri.parse(base) : Uri.parse('$base/$docId');
  }

  Future<bool> ping() async {
    final res = await client.get(
      _uri(''),
      headers: _headers(),
    );
    return res.statusCode == 200;
  }

  Future<bool> createDatabase(String db) async {
    final res = await client.put(
      _uri(db),
      headers: _headers(),
    );
    return res.statusCode == 201 || res.statusCode == 412;
  }

  Future<bool> ensureDatabase(String db) async {
    final exists = await ping();
    if (exists) return true;
    return createDatabase(db);
  }

  Future<Map<String, dynamic>?> get(String db, String id) async {
    final res = await client.get(
      _uri(db, id),
      headers: _headers(),
    );
    if (res.statusCode == 200) {
      return jsonDecode(res.body) as Map<String, dynamic>;
    }
    return null;
  }

  Future<String> put(String db, Map<String, dynamic> doc) async {
    final existingId = doc['_id'] as String?;
    final method = existingId == null ? httpMethodPost : httpMethodPut;
    final uri = existingId == null ? _uri(db) : _uri(db, existingId);
    final res = await (method == httpMethodPost
        ? client.post(uri, headers: _headers(), body: jsonEncode(doc))
        : client.put(uri, headers: _headers(), body: jsonEncode(doc)));

    if (res.statusCode == 201 || res.statusCode == 200) {
      final map = jsonDecode(res.body) as Map<String, dynamic>;
      return (map['id'] ?? existingId ?? '') as String;
    }
    throw CouchDbException('PUT failed: ${res.statusCode} ${res.body}');
  }

  Future<void> delete(String db, String id, String rev) async {
    final res = await client.delete(
      _uri(db, '$id?rev=$rev'),
      headers: _headers(),
    );
    if (res.statusCode != 200) {
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
    final params = <String, String>{
      'include_docs': 'true',
      if (key != null) 'key': key,
      if (startKey != null) 'startKey': startKey,
      if (endKey != null) 'endKey': endKey,
      'descending': descending ? 'true' : 'false',
      if (limit != null) 'limit': '$limit',
    };

    final res = await client.get(
      _uri(db, '_design/$design/_view/$view').replace(queryParameters: params),
      headers: _headers(),
    );
    if (res.statusCode == 200) {
      return jsonDecode(res.body) as Map<String, dynamic>;
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

  void close() => client.close();
}

class CouchDbException implements Exception {
  final String message;
  const CouchDbException(this.message);

  @override
  String toString() => 'CouchDbException: $message';
}

const httpMethodPost = 'POST';
const httpMethodPut = 'PUT';
