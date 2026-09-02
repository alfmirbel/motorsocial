import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class SyncRepository {
  Future<void> enqueue(Map<String, dynamic> payload);
  Future<int> pendingCount();
  Future<void> run();
}

/// Cola de sincronización en memoria.
///
/// `_queue` es mutable (no `const`) para que `enqueue()` realmente persista
/// los payloads pendientes hasta `run()`. Cumple P2-19 del plan.
class InMemorySyncRepository implements SyncRepository {
  final List<Map<String, dynamic>> _queue = <Map<String, dynamic>>[];

  @override
  Future<void> enqueue(Map<String, dynamic> payload) async {
    _queue.add(Map<String, dynamic>.from(payload));
  }

  @override
  Future<int> pendingCount() async => _queue.length;

  @override
  Future<void> run() async {
    // Procesa la cola en orden FIFO. En el backend real, cada payload se
    // enviaría vía Dio; aquí simplemente se vacía.
    _queue.clear();
  }

  /// Acceso de solo lectura para tests / observabilidad.
  List<Map<String, dynamic>> get queue =>
      List<Map<String, dynamic>>.unmodifiable(_queue);
}

final syncRepositoryProvider =
    Provider<SyncRepository>((ref) => InMemorySyncRepository());
