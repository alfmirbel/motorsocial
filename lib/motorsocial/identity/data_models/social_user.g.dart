// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SocialUser _$SocialUserFromJson(Map<String, dynamic> json) => _SocialUser(
      id: json['id'] as String,
      email: json['email'] as String?,
      displayName: json['displayName'] as String,
      photoUrl: json['photoUrl'] as String?,
      passwordHash: json['passwordHash'] as String?,
      roleKey: json['roleKey'] as String?,
      createdAt: (json['createdAt'] as num?)?.toInt() ?? 0,
      updatedAt: (json['updatedAt'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$SocialUserToJson(_SocialUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'displayName': instance.displayName,
      'photoUrl': instance.photoUrl,
      'passwordHash': instance.passwordHash,
      'roleKey': instance.roleKey,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
