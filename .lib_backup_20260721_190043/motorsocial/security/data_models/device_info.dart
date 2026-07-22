class DeviceInfo {
  final String id;
  final String? model;
  final String? osVersion;

  const DeviceInfo({required this.id, this.model, this.osVersion});

  factory DeviceInfo.fromJson(Map<String, dynamic> json) => DeviceInfo(
        id: json['id'] as String? ?? '',
        model: json['model'] as String?,
        osVersion: json['osVersion'] as String?,
      );
}

class RateLimitState {
  final int remaining;
  final DateTime? resetAt;

  const RateLimitState({this.remaining = 0, this.resetAt});

  bool get isLimited => resetAt != null && DateTime.now().isBefore(resetAt!);
}

class SecurityEvent {
  final String id;
  final String type;
  final String? actorId;
  final Map<String, dynamic> payload;
  final DateTime createdAt;

  const SecurityEvent({
    required this.id,
    required this.type,
    this.actorId,
    this.payload = const <String, dynamic>{},
    required this.createdAt,
  });

  factory SecurityEvent.fromJson(Map<String, dynamic> json) => SecurityEvent(
        id: json['id'] as String? ?? json['_id'] as String? ?? '',
        type: json['type'] as String? ?? 'unknown',
        actorId: json['actorId'] as String?,
        payload: Map<String, dynamic>.from(json['payload'] is Map<String, dynamic> ? json['payload'] as Map<String, dynamic> : <String, dynamic>{}),
        createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt'] as String) : DateTime.now(),
      );
}

class ValidationResult {
  final bool isValid;
  final String? message;

  const ValidationResult({this.isValid = true, this.message});
}
