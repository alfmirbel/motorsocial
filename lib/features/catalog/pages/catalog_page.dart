import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../catalog/catalog.dart';

class CatalogPage extends ConsumerWidget {
  const CatalogPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repo = ref.watch(catalogRepositoryProvider);
    final items = repo.search('motor', limit: 10);

    return Scaffold(
      appBar: AppBar(title: const Text('Propiedades')),
      body: Column(
        children: [
          const ListTile(
            title: Text('Catálogo social integrado'),
            subtitle: Text('Caso de uso aislado: catálogo en modo staging.'),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('Caso de uso aislado: catálogo en modo staging.'),
          ),
          Expanded(
            child: FutureBuilder<List<SocialObjectQuery>>(
              future: items,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }
                final data = snapshot.data ?? const <SocialObjectQuery>[];
                if (data.isEmpty) {
                  return const Center(child: Text('Sin resultados.'));
                }
                return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('Objeto ${index + 1}'),
                      subtitle: Text(
                        data[index].preferredType ?? 'tipo sin definir',
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
