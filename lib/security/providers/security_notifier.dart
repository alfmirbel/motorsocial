import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:motorsocial/security/repositories/security_repository.dart';

class SecurityNotifier extends Notifier<void> {
  SecurityNotifier(this.securityRepository);
  final SecurityRepository securityRepository;

  @override
  void build() {}
}

final securityNotifierProvider = Provider<SecurityNotifier>((ref) => SecurityNotifier(ref.read(securityRepositoryProvider)));
