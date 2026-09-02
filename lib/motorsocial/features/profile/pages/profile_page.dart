import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/providers/app_providers.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(sessionProvider);
    final userId = session['userId'] ?? 'desconocido';

    return Scaffold(
      appBar: AppBar(title: const Text('Perfil')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ListTile(
            leading: const Icon(Icons.person),
            title: Text(userId),
            subtitle: const Text('Usuario activo en sesión'),
          ),
          const SizedBox(height: 8),
          const ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Conectado a SocialIdentityContract.'),
            subtitle: Text('Contenido mínimo conectado a la sesión local.'),
          ),
        ],
      ),
    );
  }
}
