import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class SyncRepository {
  Future<void> enqueue(Map<String, dynamic> payload);
  Future<int> pendingCount();
  Future<void> run();
}

class InMemorySyncRepository implements SyncRepository {
  final List<Map<String, dynamic>> _queue = const <Map<String, dynamic>>[];

  @override Future<void> enqueue(Map<String, dynamic> payload) async {}
  @override Future<int> pendingCount() async => _queue.length;
  @override Future<void> run() async {}
}

final syncRepositoryProvider = Provider<SyncRepository>((ref) => InMemorySyncRepository());
