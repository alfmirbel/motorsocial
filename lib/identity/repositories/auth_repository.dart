import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data_models/auth_state.dart';

abstract class AuthRepository {
  Future<AuthState> signIn(String email, String password);
  Future<AuthState> register(String email, String password, String displayName);
  Future<AuthState> recoverPassword(String email);
}

class StubAuthRepository implements AuthRepository {
  @override
  Future<AuthState> signIn(String email, String password) async =>
      AuthState(isAuthenticated: true, userId: 'stub-user', isUserDataLoaded: true);

  @override
  Future<AuthState> register(String email, String password, String displayName) async =>
      AuthState(isAuthenticated: true, userId: 'stub-user', isUserDataLoaded: true);

  @override
  Future<AuthState> recoverPassword(String email) async =>
      const AuthState(isAuthenticated: false, isUserDataLoaded: false);
}

final authRepositoryProvider = Provider<AuthRepository>((ref) => StubAuthRepository());
