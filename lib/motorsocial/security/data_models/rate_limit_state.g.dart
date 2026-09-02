// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rate_limit_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RateLimitState _$RateLimitStateFromJson(Map<String, dynamic> json) =>
    _RateLimitState(
      remaining: (json['remaining'] as num?)?.toInt() ?? -1,
      resetAt: json['resetAt'] == null
          ? null
          : DateTime.parse(json['resetAt'] as String),
    );

Map<String, dynamic> _$RateLimitStateToJson(_RateLimitState instance) =>
    <String, dynamic>{
      'remaining': instance.remaining,
      'resetAt': instance.resetAt?.toIso8601String(),
    };
