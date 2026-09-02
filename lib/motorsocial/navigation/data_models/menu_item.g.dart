// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SocialMenuItem _$SocialMenuItemFromJson(Map<String, dynamic> json) =>
    _SocialMenuItem(
      title: json['title'] as String,
      route: json['route'] as String,
      enabled: json['enabled'] as bool? ?? true,
    );

Map<String, dynamic> _$SocialMenuItemToJson(_SocialMenuItem instance) =>
    <String, dynamic>{
      'title': instance.title,
      'route': instance.route,
      'enabled': instance.enabled,
    };
