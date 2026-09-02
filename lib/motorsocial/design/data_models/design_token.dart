import 'package:freezed_annotation/freezed_annotation.dart';

part 'design_token.freezed.dart';
part 'design_token.g.dart';

/// Token individual de diseño (clave, categoría, valor).
@freezed
abstract class DesignToken with _$DesignToken {
  const factory DesignToken({
    required String key,
    required String category,
    required String value,
  }) = _DesignToken;

  factory DesignToken.fromJson(Map<String, dynamic> json) =>
      _$DesignTokenFromJson(json);
}