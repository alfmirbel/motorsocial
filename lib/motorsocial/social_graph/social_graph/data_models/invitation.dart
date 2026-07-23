
class Invitation {
  final String id;
  final String senderId;
  final String recipientId;
  final String status;
  final DateTime createdAt;

  const Invitation({
    required this.id,
    required this.senderId,
    required this.recipientId,
    this.status = 'pending',
    required this.createdAt,
  });

  factory Invitation.fromJson(Map<String, dynamic> json) => Invitation(
        id: json['id'] as String? ?? json['_id'] as String? ?? '',
        senderId: json['senderId'] as String? ?? '',
        recipientId: json['recipientId'] as String? ?? '',
        status: json['status'] as String? ?? 'pending',
        createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt'] as String) : DateTime.now(),
      );
}
