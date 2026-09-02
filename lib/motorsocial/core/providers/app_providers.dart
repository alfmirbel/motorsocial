import 'package:flutter_riverpod/flutter_riverpod.dart';

class SessionNotifier extends Notifier<Map<String, String?>> {
  @override
  Map<String, String?> build() => <String, String?>{};

  void setSession(Map<String, String?> value) {
    state = value;
  }
}

final sessionProvider = NotifierProvider<SessionNotifier, Map<String, String?>>(
  SessionNotifier.new,
);
