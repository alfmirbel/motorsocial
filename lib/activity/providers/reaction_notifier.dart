import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data_models/activity_contract.dart';

class ReactionState {
  final AsyncValue<List<SocialActivity>> reactions;
  final bool isToggling;
  final String? lastError;
  const ReactionState({this.reactions = const AsyncValue.data(<SocialActivity>[]), this.isToggling = false, this.lastError});

  ReactionState copyWith({AsyncValue<List<SocialActivity>>? reactions, bool? isToggling, String? lastError}) {
    return ReactionState(reactions: reactions ?? this.reactions, isToggling: isToggling ?? this.isToggling, lastError: lastError ?? this.lastError);
  }
}

class ReactionNotifier extends Notifier<ReactionState> {
  @override
  ReactionState build() => const ReactionState();
}

final reactionProvider = NotifierProvider<ReactionNotifier, ReactionState>(ReactionNotifier.new);
