import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data_models/auth_state.dart';

abstract class SessionRepository {
  Future<AuthState?> read();
  Future<void> write(AuthState session);
  Future<void> clear();
}

class StubSessionRepository implements SessionRepository {
  final Map<String, dynamic> _session = {};

  @override
  Future<AuthState?> read() async {
    if (_session.isEmpty) return null;
    return AuthState(
      isAuthenticated: true,
      userId: _session['userId'] as String,
      accessToken: _session['accessToken'] as String?,
    );
  }

  @override
  Future<void> write(AuthState session) async {
    _session
      ..['userId'] = session.userId
      ..['accessToken'] = session.accessToken;
  }

  @override
  Future<void> clear() async => _session.clear();
}

final sessionRepositoryProvider = Provider<SessionRepository>((ref) => StubSessionRepository());
