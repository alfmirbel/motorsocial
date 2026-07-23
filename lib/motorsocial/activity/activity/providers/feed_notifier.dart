import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data_models/activity_contract.dart';

class FeedState {
  final AsyncValue<List<SocialActivity>> activities;
  final ActivityQuery query;
  final bool isLoading;
  final bool hasMore;

  const FeedState({
    this.activities = const AsyncValue.data(<SocialActivity>[]),
    this.query = const ActivityQuery(),
    this.isLoading = false,
    this.hasMore = false,
  });

  FeedState copyWith({
    AsyncValue<List<SocialActivity>>? activities,
    ActivityQuery? query,
    bool? isLoading,
    bool? hasMore,
  }) {
    return FeedState(
      activities: activities ?? this.activities,
      query: query ?? this.query,
      isLoading: isLoading ?? this.isLoading,
      hasMore: hasMore ?? this.hasMore,
    );
  }
}

class FeedNotifier extends Notifier<FeedState> {
  @override
  FeedState build() => const FeedState();

  Future<void> load(ActivityQuery query) async {
    state = state.copyWith(query: query, isLoading: true, hasMore: false);
  }

  void nextPage() {
    final q = state.query;
    load(ActivityQuery(actorId: q.actorId, limit: q.limit));
  }

  void reset() {
    state = const FeedState();
  }
}

final feedProvider = NotifierProvider<FeedNotifier, FeedState>(FeedNotifier.new);
