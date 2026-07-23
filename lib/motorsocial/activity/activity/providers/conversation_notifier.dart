import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data_models/activity_contract.dart';

class ConversationState {
  final AsyncValue<List<SocialActivity>> messages;
  final bool isSending;
  final String? lastError;
  const ConversationState({this.messages = const AsyncValue.data(<SocialActivity>[]), this.isSending = false, this.lastError});

  ConversationState copyWith({AsyncValue<List<SocialActivity>>? messages, bool? isSending, String? lastError}) {
    return ConversationState(messages: messages ?? this.messages, isSending: isSending ?? this.isSending, lastError: lastError ?? this.lastError);
  }
}

class ConversationNotifier extends Notifier<ConversationState> {
  @override
  ConversationState build() => const ConversationState();
}

final conversationProvider = NotifierProvider<ConversationNotifier, ConversationState>(ConversationNotifier.new);
