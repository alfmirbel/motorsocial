class SocialRelationship {
  final String id;
  final String actorId;
  final String targetId;
  final String type;
  final DateTime createdAt;

  const SocialRelationship({
    required this.id,
    required this.actorId,
    required this.targetId,
    required this.type,
    required this.createdAt,
  });

  factory SocialRelationship.fromJson(Map<String, dynamic> json) => SocialRelationship(
        id: json['id'] as String? ?? json['_id'] as String? ?? '',
        actorId: json['actorId'] as String? ?? '',
        targetId: json['targetId'] as String? ?? '',
        type: json['type'] as String? ?? 'contact',
        createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt'] as String) : DateTime.now(),
      );
}
