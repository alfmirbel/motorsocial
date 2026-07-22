import '../data_models/catalog_query.dart';

abstract class CatalogRepository {
  Future<List<SocialObjectQuery>> search(String query, {int limit = 20});
}

class InMemoryCatalogRepository implements CatalogRepository {
  @override Future<List<SocialObjectQuery>> search(String query, {int limit = 20}) async => const <SocialObjectQuery>[];
}
