import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../repositories/catalog_repository.dart';

class CatalogEngine {
  final CatalogRepository catalogRepository;
  const CatalogEngine(this.catalogRepository);

  void initializeProviders(WidgetRef ref) {}
}
