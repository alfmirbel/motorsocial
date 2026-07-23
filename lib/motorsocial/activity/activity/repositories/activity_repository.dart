import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data_models/activity_contract.dart';

abstract class ActivityRepository {
  Future<List<SocialActivity>> recentFeed(ActivityQuery query);
  Future<SocialActivity?> getById(String id);
  Future<SocialActivity> create(SocialActivity activity);
  Future<void> delete(String id);
}

class InMemoryActivitiesRepository implements ActivityRepository {
  @override Future<List<SocialActivity>> recentFeed(ActivityQuery query) async => const <SocialActivity>[];
  @override Future<SocialActivity?> getById(String id) async => null;
  @override Future<SocialActivity> create(SocialActivity activity) async => activity;
  @override Future<void> delete(String id) async {}
}

final activityRepositoryProvider = Provider<ActivityRepository>((ref) => InMemoryActivitiesRepository());
