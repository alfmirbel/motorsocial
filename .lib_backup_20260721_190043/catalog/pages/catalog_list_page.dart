import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/catalog_notifier.dart';

class CatalogListPage extends ConsumerWidget {
  const CatalogListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(catalogProvider);
    final page = state.page.value;
    if (state.isLoading || page == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    return Scaffold(
      appBar: AppBar(title: const Text('Catálogo')),
      body: page.items.isEmpty
          ? const Center(child: Text('Sin resultados'))
          : ListView.builder(
              itemCount: page.items.length,
              itemBuilder: (context, index) {
                final item = page.items[index];
                return ListTile(title: Text(item.title ?? item.type), subtitle: Text(item.id));
              },
            ),
    );
  }
}

class ObjectDetailPage extends ConsumerWidget {
  final String objectId;
  final String objectType;

  const ObjectDetailPage({super.key, required this.objectId, required this.objectType});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detalle')),
      body: Center(child: Text('$objectType: $objectId')),
    );
  }
}
