class SocialInvitation {
  final String id;
  final String senderId;
  final String receiverId;
  final String status;
  final DateTime createdAt;
  const SocialInvitation({
    required this.id,
    required this.senderId,
    required this.receiverId,
    required this.status,
    required this.createdAt,
  });
}
