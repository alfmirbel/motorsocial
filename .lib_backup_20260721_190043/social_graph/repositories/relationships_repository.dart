import '../data_models/social_relationship.dart';

abstract class RelationshipsRepository {
  Future<List<SocialRelationship>> byActor(String actorId, {String? status});
  Future<List<SocialRelationship>> byOther(String otherId, {String? status});
}

class InMemoryRelationshipsRepository implements RelationshipsRepository {
  @override Future<List<SocialRelationship>> byActor(String actorId, {String? status}) async => const <SocialRelationship>[];
  @override Future<List<SocialRelationship>> byOther(String otherId, {String? status}) async => const <SocialRelationship>[];
}
