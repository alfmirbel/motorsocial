import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme_state.freezed.dart';
part 'theme_state.g.dart';

/// Estado de selección de tema en la aplicación.
@freezed
abstract class ThemeState with _$ThemeState {
  const factory ThemeState({
    @Default('light_default') String themeId,
    @Default(false) bool isLoading,
    String? error,
  }) = _ThemeState;

  factory ThemeState.fromJson(Map<String, dynamic> json) =>
      _$ThemeStateFromJson(json);
}