class SecurityEvent {
  final String id;
  final String type;
  final DateTime createdAt;
  final Map<String, dynamic> payload;

  const SecurityEvent({
    required this.id,
    required this.type,
    required this.createdAt,
    this.payload = const <String, dynamic>{},
  });
}
