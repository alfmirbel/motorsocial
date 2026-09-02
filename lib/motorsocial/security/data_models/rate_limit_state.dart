import 'package:freezed_annotation/freezed_annotation.dart';

part 'rate_limit_state.freezed.dart';
part 'rate_limit_state.g.dart';

/// Estado de límite de tasa (rate limit) tras una solicitud HTTP.
@freezed
abstract class RateLimitState with _$RateLimitState {
  const factory RateLimitState({
    @Default(-1) int remaining,
    DateTime? resetAt,
  }) = _RateLimitState;

  factory RateLimitState.fromJson(Map<String, dynamic> json) =>
      _$RateLimitStateFromJson(json);
}