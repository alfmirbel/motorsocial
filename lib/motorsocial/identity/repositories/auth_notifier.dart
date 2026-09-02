import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data_models/auth_state.dart';

/// Notifier de estado de autenticación (Riverpod 3.x).
///
/// Reemplaza al antiguo `StateNotifier<AuthState>`/`StateProvider<AuthState>`
/// de Riverpod 2.x, eliminados en 3.x.
class AuthStateNotifier extends Notifier<AuthState> {
  @override
  AuthState build() => const AuthState();

  void update(AuthState next) => state = next;
  void logout() => state = const AuthState();
}

final authStateProvider =
    NotifierProvider<AuthStateNotifier, AuthState>(AuthStateNotifier.new);
