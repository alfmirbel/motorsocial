import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data_models/auth_state.dart';

class AuthStateNotifier extends StateNotifier<AuthState> {
  AuthStateNotifier() : super(const AuthState());
}

final authStateProvider = StateProvider<AuthState>((ref) => const AuthState());
