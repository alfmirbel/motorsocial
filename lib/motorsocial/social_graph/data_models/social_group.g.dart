// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SocialGroup _$SocialGroupFromJson(Map<String, dynamic> json) => _SocialGroup(
      id: json['id'] as String,
      name: json['name'] as String,
      memberIds: (json['memberIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      isPublic: json['isPublic'] as bool? ?? true,
    );

Map<String, dynamic> _$SocialGroupToJson(_SocialGroup instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'memberIds': instance.memberIds,
      'isPublic': instance.isPublic,
    };
