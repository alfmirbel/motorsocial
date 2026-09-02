import 'package:freezed_annotation/freezed_annotation.dart';

part 'session_data.freezed.dart';
part 'session_data.g.dart';

/// Datos de sesión persistidos en secure storage (móvil) / shared_preferences (web).
@freezed
abstract class SessionData with _$SessionData {
  const factory SessionData({
    required String key,
    required String token,
    required DateTime expiresAt,
    @Default(<String, dynamic>{}) Map<String, dynamic> payload,
  }) = _SessionData;

  factory SessionData.fromJson(Map<String, dynamic> json) =>
      _$SessionDataFromJson(json);
}

/// Métodos derivados de [SessionData].
extension SessionDataX on SessionData {
  /// Indica si la sesión ya expiró respecto al momento actual.
  bool get isExpired => DateTime.now().isAfter(expiresAt);
}