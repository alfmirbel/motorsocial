// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social_relationship.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SocialRelationship _$SocialRelationshipFromJson(Map<String, dynamic> json) =>
    _SocialRelationship(
      id: json['id'] as String,
      actorId: json['actorId'] as String,
      targetId: json['targetId'] as String,
      type: json['type'] as String? ?? 'contact',
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$SocialRelationshipToJson(_SocialRelationship instance) =>
    <String, dynamic>{
      'id': instance.id,
      'actorId': instance.actorId,
      'targetId': instance.targetId,
      'type': instance.type,
      'createdAt': instance.createdAt.toIso8601String(),
    };
