import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data_models/security_event.dart';

abstract class SecurityRepository {
  Future<List<SecurityEvent>> byUser(String userId, {DateTime? since});
}

class InMemorySecurityRepository implements SecurityRepository {
  const InMemorySecurityRepository();

  @override
  Future<List<SecurityEvent>> byUser(String userId, {DateTime? since}) async =>
      const <SecurityEvent>[];
}

final securityRepositoryProvider =
    Provider<SecurityRepository>((ref) => const InMemorySecurityRepository());