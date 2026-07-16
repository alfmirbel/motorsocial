import '../repositories/activity_repository.dart';
import '../data_models/activity_contract.dart';

final class InMemoryActivitiesRepository implements ActivityRepository {
  InMemoryActivitiesRepository({List<SocialActivity>? seed}) : _items = List<SocialActivity>.from(seed ?? const <SocialActivity>[]);

  final List<SocialActivity> _items;

  @override
  Future<SocialActivity> create(SocialActivity activity) {
    _items.insert(0, activity);
    return Future.value(activity);
  }

  @override
  Future<void> delete(String id) {
    _items.removeWhere((SocialActivity item) => item.id == id);
    return Future<void>.value();
  }

  @override
  Future<SocialActivity?> getById(String id) {
    try {
      return Future.value(_items.firstWhere((SocialActivity item) => item.id == id));
    } on StateError {
      return Future<SocialActivity?>.value(null);
    }
  }

  @override
  Future<List<SocialActivity>> recentFeed(ActivityQuery query) {
    final List<SocialActivity> list = query.actorId == null
        ? List<SocialActivity>.from(_items)
        : _items.where((SocialActivity item) => item.actorId == query.actorId).toList();
    final int limit = query.limit > 0 ? query.limit : list.length;
    list.sort((SocialActivity a, SocialActivity b) => b.createdAt.compareTo(a.createdAt));
    return Future.value(list.take(limit).toList());
  }
}
