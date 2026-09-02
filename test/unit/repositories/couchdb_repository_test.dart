import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

import 'package:motorsocial/motorsocial/core/database/couchdb_repository.dart';

void main() {
  group('CouchDbRepository (http_mock_adapter)', () {
    late Dio dio;
    late DioHttpClientAdapter mockAdapter;

    setUp(() {
      dio = Dio(BaseOptions(
        baseUrl: 'http://localhost:5984',
        connectTimeout: const Duration(seconds: 5),
      ));
      mockAdapter = DioHttpClientAdapter();
      dio.httpClientAdapter = mockAdapter;
    });

    tearDown(() {
      dio.close();
    });

    test('ping retorna true cuando GET / responde 200', () async {
      mockAdapter.onGet(
          '/', (server) => server.reply(200, {'version': '2.3.1'}));
      final repo = CouchDbRepository(
        config: const CouchDbConfig(
          url: 'http://localhost:5984',
          username: 'admin',
          password: 'pass',
        ),
        dio: dio,
      );
      expect(await repo.ping(), isTrue);
    });

    test('createDatabase retorna true en 201', () async {
      mockAdapter.onPut('/testdb', (server) => server.reply(201, {}));
      final repo = CouchDbRepository(
        config: const CouchDbConfig(
          url: 'http://localhost:5984',
          username: 'admin',
          password: 'pass',
        ),
        dio: dio,
      );
      expect(await repo.createDatabase('testdb'), isTrue);
    });

    test('createDatabase retorna true en 412 (already exists)', () async {
      mockAdapter.onPut('/existing', (server) => server.reply(412, {}));
      final repo = CouchDbRepository(
        config: const CouchDbConfig(
          url: 'http://localhost:5984',
          username: 'admin',
          password: 'pass',
        ),
        dio: dio,
      );
      expect(await repo.createDatabase('existing'), isTrue);
    });

    test('get retorna null en 404', () async {
      mockAdapter.onGet('/db/doc1', (server) => server.reply(404, null));
      final repo = CouchDbRepository(
        config: const CouchDbConfig(
          url: 'http://localhost:5984',
          username: 'admin',
          password: 'pass',
        ),
        dio: dio,
      );
      expect(await repo.get('db', 'doc1'), isNull);
    });

    test('get retorna mapa en 200', () async {
      mockAdapter.onGet('/db/doc1',
          (server) => server.reply(200, {'_id': 'doc1', 'title': 'Hola'}));
      final repo = CouchDbRepository(
        config: const CouchDbConfig(
          url: 'http://localhost:5984',
          username: 'admin',
          password: 'pass',
        ),
        dio: dio,
      );
      final result = await repo.get('db', 'doc1');
      expect(result, isNotNull);
      expect(result!['_id'], 'doc1');
      expect(result['title'], 'Hola');
    });

    test('put sin _id usa POST y retorna id del response', () async {
      mockAdapter.onPost('/db',
          (server) => server.reply(201, {'id': 'generated-id', 'ok': true}));
      final repo = CouchDbRepository(
        config: const CouchDbConfig(
          url: 'http://localhost:5984',
          username: 'admin',
          password: 'pass',
        ),
        dio: dio,
      );
      expect(await repo.put('db', <String, dynamic>{'title': 'Hola'}),
          'generated-id');
    });

    test('put con _id existente usa PUT y retorna id', () async {
      mockAdapter.onPut(
          '/db/doc1',
          (server) =>
              server.reply(200, {'id': 'doc1', 'rev': '1-abc', 'ok': true}));
      final repo = CouchDbRepository(
        config: const CouchDbConfig(
          url: 'http://localhost:5984',
          username: 'admin',
          password: 'pass',
        ),
        dio: dio,
      );
      expect(
        await repo.put('db', <String, dynamic>{'_id': 'doc1', 'title': 'x'}),
        'doc1',
      );
    });

    test('delete lanza CouchDbException si status no es 200', () async {
      mockAdapter.onDelete(
          '/db/doc1?rev=1', (server) => server.reply(409, null));
      final repo = CouchDbRepository(
        config: const CouchDbConfig(
          url: 'http://localhost:5984',
          username: 'admin',
          password: 'pass',
        ),
        dio: dio,
      );
      expect(
        () => repo.delete('db', 'doc1', '1'),
        throwsA(isA<CouchDbException>()),
      );
    });

    test('queryView retorna mapa en 200', () async {
      mockAdapter.onGet('/db/_design/ddoc/_view/view1',
          (server) => server.reply(200, {'rows': <dynamic>[]}));
      final repo = CouchDbRepository(
        config: const CouchDbConfig(
          url: 'http://localhost:5984',
          username: 'admin',
          password: 'pass',
        ),
        dio: dio,
      );
      final result = await repo.queryView('db', 'ddoc', 'view1');
      expect(result, isNotNull);
      expect(result!['rows'], isEmpty);
    });
  });
}
