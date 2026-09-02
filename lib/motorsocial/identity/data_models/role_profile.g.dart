// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'role_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RoleProfile _$RoleProfileFromJson(Map<String, dynamic> json) => _RoleProfile(
      key: json['key'] as String,
      name: json['name'] as String,
      permissions: (json['permissions'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
    );

Map<String, dynamic> _$RoleProfileToJson(_RoleProfile instance) =>
    <String, dynamic>{
      'key': instance.key,
      'name': instance.name,
      'permissions': instance.permissions,
    };
