class SessionData {
  final String key;
  final String token;
  final DateTime expiresAt;
  final Map<String, dynamic> payload;

  const SessionData({
    required this.key,
    required this.token,
    required this.expiresAt,
    this.payload = const <String, dynamic>{},
  });

  factory SessionData.fromJson(Map<String, dynamic> json) => SessionData(
        key: json['key'] as String? ?? json['sessionKey'] ?? '',
        token: json['token'] as String? ?? json['accessToken'] ?? '',
        expiresAt: json['expiresAt'] is String
            ? DateTime.tryParse(json['expiresAt'] as String) ??
                DateTime.now().add(const Duration(hours: 1))
            : DateTime.now().add(const Duration(hours: 1)),
        payload: Map<String, dynamic>.from(
          json['payload'] is Map<String, dynamic>
              ? json['payload'] as Map<String, dynamic>
              : <String, dynamic>{},
        ),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'key': key,
        'token': token,
        'expiresAt': expiresAt.toIso8601String(),
        'payload': payload,
      };

  bool get isExpired => DateTime.now().isAfter(expiresAt);
}
