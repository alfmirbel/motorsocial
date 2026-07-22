import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data_models/auth_state.dart';

class LocalSessionRepository {
  const LocalSessionRepository();

  Future<AuthState?> read() async => null;
  Future<void> write(AuthState session) async {}
  Future<void> clear() async {}
}

final localSessionRepositoryProvider = Provider<LocalSessionRepository>((ref) => const LocalSessionRepository());
