// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social_invitation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SocialInvitation _$SocialInvitationFromJson(Map<String, dynamic> json) =>
    _SocialInvitation(
      id: json['id'] as String,
      senderId: json['senderId'] as String,
      recipientId: json['recipientId'] as String,
      status: json['status'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$SocialInvitationToJson(_SocialInvitation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'senderId': instance.senderId,
      'recipientId': instance.recipientId,
      'status': instance.status,
      'createdAt': instance.createdAt.toIso8601String(),
    };
