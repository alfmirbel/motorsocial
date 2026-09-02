// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SocialObject _$SocialObjectFromJson(Map<String, dynamic> json) =>
    _SocialObject(
      id: json['id'] as String,
      type: json['type'] as String? ?? 'generic',
      title: json['title'] as String?,
      attributes: json['attributes'] as Map<String, dynamic>? ??
          const <String, dynamic>{},
      ownerId: json['ownerId'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$SocialObjectToJson(_SocialObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'title': instance.title,
      'attributes': instance.attributes,
      'ownerId': instance.ownerId,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

_SocialObjectPage _$SocialObjectPageFromJson(Map<String, dynamic> json) =>
    _SocialObjectPage(
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => SocialObject.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <SocialObject>[],
      total: (json['total'] as num?)?.toInt() ?? 0,
      offset: (json['offset'] as num?)?.toInt() ?? 0,
      hasMore: json['hasMore'] as bool? ?? false,
    );

Map<String, dynamic> _$SocialObjectPageToJson(_SocialObjectPage instance) =>
    <String, dynamic>{
      'items': instance.items.map((e) => e.toJson()).toList(),
      'total': instance.total,
      'offset': instance.offset,
      'hasMore': instance.hasMore,
    };
