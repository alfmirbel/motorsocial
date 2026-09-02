// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social_activity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SocialActivity _$SocialActivityFromJson(Map<String, dynamic> json) =>
    _SocialActivity(
      id: json['id'] as String,
      actorId: json['actorId'] as String,
      actorName: json['actorName'] as String,
      verb: json['verb'] as String,
      objectType: json['objectType'] as String,
      objectId: json['objectId'] as String,
      payload:
          json['payload'] as Map<String, dynamic>? ?? const <String, dynamic>{},
      createdAt: (json['createdAt'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$SocialActivityToJson(_SocialActivity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'actorId': instance.actorId,
      'actorName': instance.actorName,
      'verb': instance.verb,
      'objectType': instance.objectType,
      'objectId': instance.objectId,
      'payload': instance.payload,
      'createdAt': instance.createdAt,
    };
