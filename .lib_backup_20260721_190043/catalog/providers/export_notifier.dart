import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../repositories/catalog_repository.dart';

final catalogRepositoryProvider = Provider<CatalogRepository>((_) => InMemoryCatalogRepository());
