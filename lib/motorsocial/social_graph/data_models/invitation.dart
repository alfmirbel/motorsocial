import 'package:freezed_annotation/freezed_annotation.dart';

part 'invitation.freezed.dart';
part 'invitation.g.dart';

/// Invitación de usuario a usuario. Persistida en `motorsocial_invitations`.
///
/// Doc CouchDB con prefijo `invitation:<uuid>`.
@freezed
abstract class Invitation with _$Invitation {
  const factory Invitation({
    required String id,
    required String senderId,
    required String recipientId,
    @Default('pending') String status,
    required DateTime createdAt,
  }) = _Invitation;

  factory Invitation.fromJson(Map<String, dynamic> json) =>
      _$InvitationFromJson(json);
}