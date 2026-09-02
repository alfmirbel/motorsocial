import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/providers/app_providers.dart';
import '../../../navigation/routing/app_router.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _identifierController = TextEditingController();
  final _secretController = TextEditingController();
  bool _loading = false;
  String? _error;

  Future<void> _login() async {
    setState(() {
      _loading = true;
      _error = null;
    });

    await Future<void>.delayed(const Duration(milliseconds: 600));

    final userId = _identifierController.text.trim();
    final token = userId.isNotEmpty ? 'token_local' : null;

    if (token == null) {
      if (mounted) setState(() => _error = 'Credenciales inválidas');
    } else {
      ref.read(sessionProvider.notifier).setSession(<String, String?>{
        'userId': userId,
        'token': token,
      });
      if (mounted) {
        Navigator.of(context).pushReplacementNamed(AppRouter.home);
      }
    }

    if (mounted) setState(() => _loading = false);
  }

  @override
  void dispose() {
    _identifierController.dispose();
    _secretController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Iniciar sesión')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _identifierController,
              decoration: const InputDecoration(labelText: 'Usuario o email'),
            ),
            TextField(
              controller: _secretController,
              decoration: const InputDecoration(labelText: 'Contraseña'),
              obscureText: true,
            ),
            const SizedBox(height: 16),
            if (_error != null)
              Text(_error!, style: TextStyle(color: scheme.error)),
            FilledButton(
              onPressed: _loading ? null : _login,
              child: _loading
                  ? const CircularProgressIndicator()
                  : const Text('Entrar'),
            ),
          ],
        ),
      ),
    );
  }
}
