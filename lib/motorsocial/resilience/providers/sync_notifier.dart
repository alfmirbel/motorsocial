import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repositories/sync_repository.dart';
import '../data_models/connection_status.dart' show SyncState;

/// `SyncNotifier` v2 — refleja el estado de la cola de sincronización.
///
/// Estado: [SyncState] (`isSyncing`, `lastSyncedAt`, `error`) + contador
/// de pendientes accesible vía `pendingCount`.
final syncProvider =
    NotifierProvider<SyncNotifier, SyncState>(SyncNotifier.new);

class SyncNotifier extends Notifier<SyncState> {
  @override
  SyncState build() => const SyncState();

  /// Encola un payload y refresca el conteo pendiente.
  Future<void> enqueue(Map<String, dynamic> payload) async {
    final repo = ref.read(syncRepositoryProvider);
    await repo.enqueue(payload);
    ref.notifyListeners();
  }

  /// Ejecuta la cola. Marca `isSyncing` durante el proceso.
  Future<void> run() async {
    state = state.copyWith(isSyncing: true, error: null);
    try {
      final repo = ref.read(syncRepositoryProvider);
      await repo.run();
      state = state.copyWith(
        isSyncing: false,
        lastSyncedAt: DateTime.now(),
      );
    } catch (e) {
      state = state.copyWith(isSyncing: false, error: e.toString());
    }
    ref.notifyListeners();
  }

  /// Cuenta de elementos pendientes en la cola.
  Future<int> pendingCount() async =>
      ref.read(syncRepositoryProvider).pendingCount();
}
