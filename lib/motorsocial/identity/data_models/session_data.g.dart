// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SessionData _$SessionDataFromJson(Map<String, dynamic> json) => _SessionData(
      key: json['key'] as String,
      token: json['token'] as String,
      expiresAt: DateTime.parse(json['expiresAt'] as String),
      payload:
          json['payload'] as Map<String, dynamic>? ?? const <String, dynamic>{},
    );

Map<String, dynamic> _$SessionDataToJson(_SessionData instance) =>
    <String, dynamic>{
      'key': instance.key,
      'token': instance.token,
      'expiresAt': instance.expiresAt.toIso8601String(),
      'payload': instance.payload,
    };
