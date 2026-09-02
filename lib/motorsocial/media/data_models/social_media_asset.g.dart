// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social_media_asset.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SocialMediaAsset _$SocialMediaAssetFromJson(Map<String, dynamic> json) =>
    _SocialMediaAsset(
      id: json['id'] as String,
      ownerId: json['ownerId'] as String,
      assetType: json['assetType'] as String? ?? 'image',
      url: json['url'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$SocialMediaAssetToJson(_SocialMediaAsset instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ownerId': instance.ownerId,
      'assetType': instance.assetType,
      'url': instance.url,
      'createdAt': instance.createdAt.toIso8601String(),
    };
