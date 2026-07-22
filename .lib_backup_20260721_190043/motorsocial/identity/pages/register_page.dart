import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../repositories/auth_repository.dart';
import '../../navigation/routing/app_router.dart';

class RegisterPage extends ConsumerWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final identifierController = TextEditingController();
    final secretController = TextEditingController();
    final displayNameController = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: const Text('Registro')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: identifierController, decoration: const InputDecoration(labelText: 'Email')),
            TextField(controller: secretController, decoration: const InputDecoration(labelText: 'Password'), obscureText: true),
            TextField(controller: displayNameController, decoration: const InputDecoration(labelText: 'Nombre')),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                final repo = ref.read(authRepositoryProvider);
                final state = await repo.register(identifierController.text, secretController.text, displayNameController.text);
                if (state.isAuthenticated && context.mounted) {
                  Navigator.of(context).pushReplacementNamed(AppRouter.home);
                }
              },
              child: const Text('Crear cuenta'),
            ),
          ],
        ),
      ),
    );
  }
}
