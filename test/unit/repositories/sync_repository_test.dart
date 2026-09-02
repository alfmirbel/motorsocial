import 'package:flutter_test/flutter_test.dart';
import 'package:motorsocial/motorsocial/resilience/repositories/sync_repository.dart';

void main() {
  group('InMemorySyncRepository', () {
    late InMemorySyncRepository repo;

    setUp(() {
      repo = InMemorySyncRepository();
    });

    test('cola vacia inicialmente', () async {
      expect(await repo.pendingCount(), 0);
      expect(repo.queue, isEmpty);
    });

    test('enqueue agrega payload a la cola', () async {
      await repo.enqueue(<String, dynamic>{'op': 'create', 'id': 'p1'});
      expect(await repo.pendingCount(), 1);
      expect(repo.queue.first, <String, dynamic>{'op': 'create', 'id': 'p1'});
    });

    test('enqueue preserva snapshot — no comparte referencia externa',
        () async {
      final payload = <String, dynamic>{'op': 'update'};
      await repo.enqueue(payload);
      payload['op'] = 'delete'; // mutar original no afecta la cola
      expect(repo.queue.first['op'], 'update');
    });

    test('run vacia la cola', () async {
      await repo.enqueue(<String, dynamic>{'op': 'a'});
      await repo.enqueue(<String, dynamic>{'op': 'b'});
      expect(await repo.pendingCount(), 2);

      await repo.run();
      expect(await repo.pendingCount(), 0);
      expect(repo.queue, isEmpty);
    });

    test('multiple enqueues mantienen orden FIFO', () async {
      for (var i = 0; i < 3; i++) {
        await repo.enqueue(<String, dynamic>{'i': i});
      }
      expect(repo.queue.map((e) => e['i']), [0, 1, 2]);
    });
  });
}
