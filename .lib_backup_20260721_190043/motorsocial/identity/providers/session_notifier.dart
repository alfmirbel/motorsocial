import 'package:flutter_riverpod/flutter_riverpod.dart';

class SessionNotifier extends Notifier<void> {
  @override
  void build() {}
}

final sessionNotifierProvider = NotifierProvider<SessionNotifier, void>(SessionNotifier.new);
