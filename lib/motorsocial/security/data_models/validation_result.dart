import 'package:freezed_annotation/freezed_annotation.dart';

part 'validation_result.freezed.dart';
part 'validation_result.g.dart';

/// Resultado de una validación (credenciales, formulario, etc.).
@freezed
abstract class ValidationResult with _$ValidationResult {
  const factory ValidationResult({
    @Default(true) bool isValid,
    String? message,
  }) = _ValidationResult;

  factory ValidationResult.fromJson(Map<String, dynamic> json) =>
      _$ValidationResultFromJson(json);
}