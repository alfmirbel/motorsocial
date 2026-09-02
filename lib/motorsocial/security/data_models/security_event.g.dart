// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'security_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SecurityEvent _$SecurityEventFromJson(Map<String, dynamic> json) =>
    _SecurityEvent(
      id: json['id'] as String,
      type: json['eventType'] as String,
      actorId: json['actorId'] as String?,
      payload:
          json['payload'] as Map<String, dynamic>? ?? const <String, dynamic>{},
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$SecurityEventToJson(_SecurityEvent instance) =>
    <String, dynamic>{
      'id': instance.id,
      'eventType': instance.type,
      'actorId': instance.actorId,
      'payload': instance.payload,
      'createdAt': instance.createdAt.toIso8601String(),
    };
