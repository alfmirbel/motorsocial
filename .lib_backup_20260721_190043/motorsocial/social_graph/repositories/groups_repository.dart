import '../data_models/social_group.dart';

abstract class GroupsRepository {
  Future<List<SocialGroup>> discoverable({bool? visibility, bool? joinable});
}

class InMemoryGroupsRepository implements GroupsRepository {
  @override Future<List<SocialGroup>> discoverable({bool? visibility, bool? joinable}) async => const <SocialGroup>[];
}
