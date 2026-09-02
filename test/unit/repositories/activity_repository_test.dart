import 'package:flutter_test/flutter_test.dart';
import 'package:motorsocial/motorsocial/activity/activity.dart';

void main() {
  group('InMemoryActivitiesRepository', () {
    late InMemoryActivitiesRepository repo;
    const seed = <SocialActivity>[
      SocialActivity(
        id: 'a1',
        actorId: 'u1',
        actorName: 'User 1',
        verb: 'shared',
        objectType: 'post',
        objectId: 'p1',
        createdAt: 100,
      ),
      SocialActivity(
        id: 'a2',
        actorId: 'u2',
        actorName: 'User 2',
        verb: 'liked',
        objectType: 'post',
        objectId: 'p1',
        createdAt: 200,
      ),
    ];

    setUp(() {
      repo = InMemoryActivitiesRepository(seed: seed);
    });

    test(
        'recentFeed devuelve todas las actividades ordenadas por createdAt desc',
        () async {
      final feed = await repo.recentFeed(const ActivityQuery(limit: 0));
      expect(feed.length, 2);
      expect(feed.first.id, 'a2'); // createdAt 200 antes que 100
      expect(feed.last.id, 'a1');
    });

    test('recentFeed filtra por actorId', () async {
      final feed =
          await repo.recentFeed(const ActivityQuery(actorId: 'u1', limit: 0));
      expect(feed.length, 1);
      expect(feed.single.actorId, 'u1');
    });

    test('recentFeed respeta el limite', () async {
      final feed = await repo.recentFeed(const ActivityQuery(limit: 1));
      expect(feed.length, 1);
      expect(feed.single.id, 'a2');
    });

    test('getById encuentra la actividad', () async {
      final a1 = await repo.getById('a1');
      expect(a1, isNotNull);
      expect(a1!.actorName, 'User 1');
    });

    test('getById retorna null si no existe', () async {
      final missing = await repo.getById('nope');
      expect(missing, isNull);
    });

    test('create inserta al inicio de la cola', () async {
      const newActivity = SocialActivity(
        id: 'a3',
        actorId: 'u3',
        actorName: 'User 3',
        verb: 'shared',
        objectType: 'post',
        objectId: 'p3',
        createdAt: 300,
      );
      await repo.create(newActivity);
      final all = await repo.recentFeed(const ActivityQuery(limit: 0));
      expect(all.length, 3);
      // La mas reciente (createdAt 300) debe aparecer primero.
      expect(all.first.id, 'a3');
    });

    test('delete elimina la actividad por id', () async {
      await repo.delete('a1');
      final all = await repo.recentFeed(const ActivityQuery(limit: 0));
      expect(all.length, 1);
      expect(all.single.id, 'a2');
    });
  });
}
