import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/foundation.dart';
import 'auth_state.dart';

@immutable
class SocialIdentityContract {
  final AuthState authState;
  const SocialIdentityContract({required this.authState});
}

final socialIdentityContractProvider = Provider<SocialIdentityContract>((_) {
  return SocialIdentityContract(authState: const AuthState());
});
