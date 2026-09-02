import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data_models/social_activity.dart';
import '../data_models/activity_query.dart';

abstract class ActivityRepository {
  Future<List<SocialActivity>> recentFeed(ActivityQuery query);
  Future<SocialActivity?> getById(String id);
  Future<SocialActivity> create(SocialActivity activity);
  Future<void> delete(String id);
}

/// Repositorio en memoria con una pequeña semilla de actividades.
///
/// Útil para arrancar la UI sin backend. El seed es determinista para que
/// tests de widget /snapshot/ sean estables.
class InMemoryActivitiesRepository implements ActivityRepository {
  InMemoryActivitiesRepository({List<SocialActivity>? seed})
      : _items = List<SocialActivity>.from(seed ?? _defaultSeed);

  final List<SocialActivity> _items;

  @override
  Future<List<SocialActivity>> recentFeed(ActivityQuery query) async {
    var list = query.actorId == null
        ? List<SocialActivity>.from(_items)
        : _items
            .where((SocialActivity item) => item.actorId == query.actorId)
            .toList();
    final limit = query.limit > 0 ? query.limit : list.length;
    list.sort((SocialActivity a, SocialActivity b) =>
        b.createdAt.compareTo(a.createdAt));
    list = list.take(limit).toList();
    return list;
  }

  @override
  Future<SocialActivity?> getById(String id) async {
    try {
      return _items.firstWhere((SocialActivity item) => item.id == id);
    } on StateError {
      return null;
    }
  }

  @override
  Future<SocialActivity> create(SocialActivity activity) async {
    _items.insert(0, activity);
    return activity;
  }

  @override
  Future<void> delete(String id) async {
    _items.removeWhere((SocialActivity item) => item.id == id);
  }

  /// Semilla por defecto — dos actividades de ejemplo estables.
  static final List<SocialActivity> _defaultSeed = <SocialActivity>[
    const SocialActivity(
      id: 'seed:welcome',
      actorId: 'system',
      actorName: 'MotorSocial',
      verb: 'announced',
      objectType: 'system',
      objectId: 'welcome',
      createdAt: 0,
    ),
    const SocialActivity(
      id: 'seed:onboarding',
      actorId: 'system',
      actorName: 'MotorSocial',
      verb: 'shared',
      objectType: 'guide',
      objectId: 'onboarding',
      createdAt: 1,
    ),
  ];
}

final activityRepositoryProvider =
    Provider<ActivityRepository>((ref) => InMemoryActivitiesRepository());
