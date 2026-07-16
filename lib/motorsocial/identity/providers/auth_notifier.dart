import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthNotifier extends Notifier<void> {
  @override
  void build() {}
}

final authNotifierProvider = NotifierProvider<AuthNotifier, void>(AuthNotifier.new);
