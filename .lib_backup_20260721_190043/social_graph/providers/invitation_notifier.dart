import 'package:flutter_riverpod/flutter_riverpod.dart';

class InvitationNotifier extends Notifier<void> {
  @override
  void build() {}
}

final invitationNotifierProvider = NotifierProvider<InvitationNotifier, void>(InvitationNotifier.new);
