import '../data_models/social_invitation.dart';

abstract class InvitationsRepository {
  Future<List<SocialInvitation>> pendingFor(String receiverId);
  Future<void> send(SocialInvitation invitation);
}

class InMemoryInvitationsRepository implements InvitationsRepository {
  @override Future<List<SocialInvitation>> pendingFor(String receiverId) async => const <SocialInvitation>[];
  @override Future<void> send(SocialInvitation invitation) async {}
}
