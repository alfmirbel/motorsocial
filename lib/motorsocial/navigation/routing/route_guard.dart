import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/providers/app_providers.dart';
import 'app_router.dart';

/// Comprueba acceso a rutas privadas.
///
/// Una ruta es pública si está en [_publicRoutes]; el resto requiere sesión
/// con un `token` válido en `sessionProvider` (cableado tras login/registro).
class RouteGuard {
  static const Set<String> _publicRoutes = <String>{
    AppRouter.login,
    AppRouter.register,
  };

  static Future<bool> canAccess(BuildContext context, String route) async {
    if (_publicRoutes.contains(route)) return true;

    final isLoggedIn = _isLoggedIn(context);
    if (!isLoggedIn) {
      if (context.mounted) {
        Navigator.of(context).pushReplacementNamed(AppRouter.login);
      }
      return false;
    }
    return true;
  }

  /// Lee `sessionProvider` desde el `ProviderScope` más cercano.
  /// Retorna `true` si existe un token no vacío en la sesión.
  static bool _isLoggedIn(BuildContext context) {
    final container = ProviderScope.containerOf(context, listen: false);
    final session = container.read(sessionProvider);
    final token = session['token'];
    return token != null && token.isNotEmpty;
  }
}
