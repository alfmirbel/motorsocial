import 'package:freezed_annotation/freezed_annotation.dart';

part 'social_invitation.freezed.dart';
part 'social_invitation.g.dart';

/// Alias de compatibilidad para compatibilidad con código legacy.
///
/// `SocialInvitation` se unifica con `Invitation` usando `recipientId`.
/// Se mantiene como tipo separado hasta completar la migración de importers.
@freezed
abstract class SocialInvitation with _$SocialInvitation {
  const factory SocialInvitation({
    required String id,
    required String senderId,
    required String recipientId,
    required String status,
    required DateTime createdAt,
  }) = _SocialInvitation;

  factory SocialInvitation.fromJson(Map<String, dynamic> json) =>
      _$SocialInvitationFromJson(json);
}