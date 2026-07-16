import 'package:flutter_riverpod/flutter_riverpod.dart';

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

abstract class SecurityRepository {
  Future<List<SecurityEvent>> byUser(String userId, {DateTime? since});
}

class InMemorySecurityRepository implements SecurityRepository {
  const InMemorySecurityRepository();

  @override
  Future<List<SecurityEvent>> byUser(String userId, {DateTime? since}) async => const <SecurityEvent>[];
}

final securityRepositoryProvider = Provider<SecurityRepository>((ref) => const InMemorySecurityRepository());
