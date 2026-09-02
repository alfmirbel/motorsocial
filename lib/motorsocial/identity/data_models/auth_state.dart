import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';
part 'auth_state.g.dart';

/// Estado de sesión y autenticación en memoria.
@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState({
    @Default(false) bool isUserDataLoaded,
    @Default(null) String? errorCode,
    @Default(null) String? errorMessage,
    @Default(false) bool isAuthenticated,
    @Default(null) String? userId,
    @Default(null) String? accessToken,
  }) = _AuthState;

  factory AuthState.fromJson(Map<String, dynamic> json) =>
      _$AuthStateFromJson(json);
}