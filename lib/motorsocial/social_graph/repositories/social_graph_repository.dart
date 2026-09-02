import '../data_models/social_invitation.dart';

abstract class SocialGraphRepository {
  Future<List<SocialInvitation>> invitations(String userId);
}
