import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../repositories/auth_repository.dart';

class PasswordRecoveryPage extends ConsumerWidget {
  const PasswordRecoveryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = TextEditingController();
    final isSaving = ValueNotifier<bool>(false);

    return Scaffold(
      appBar: AppBar(title: const Text('Recuperar contraseña')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: emailController, decoration: const InputDecoration(labelText: 'Email')),
            const SizedBox(height: 16),
            ValueListenableBuilder<bool>(
              valueListenable: isSaving,
              builder: (context, saving, _) {
                return ElevatedButton(
                  onPressed: saving
                      ? null
                      : () async {
                          isSaving.value = true;
                          final repo = ref.read(authRepositoryProvider);
                          await repo.recoverPassword(emailController.text);
                          if (context.mounted) {
                            isSaving.value = false;
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Si el email existe, recibirás instrucciones.')),
                            );
                          }
                        },
                  child: Text(saving ? 'Enviando...' : 'Enviar enlace'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
