import '../data_models/social_media_asset.dart';

abstract class MediaRepository {
  Future<List<SocialMediaAsset>> byOwner(String ownerId);
  Future<SocialMediaAsset> upload(SocialMediaAsset asset);
  Future<void> delete(String id);
}

class InMemoryMediaRepository implements MediaRepository {
  @override Future<List<SocialMediaAsset>> byOwner(String ownerId) async => const <SocialMediaAsset>[];
  @override Future<SocialMediaAsset> upload(SocialMediaAsset asset) async => asset;
  @override Future<void> delete(String id) async {}
}
