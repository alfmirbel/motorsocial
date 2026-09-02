import 'package:flutter/material.dart';

import '../../catalog/pages/catalog_list_page.dart';
import '../../features/account/pages/account_page.dart';
import '../../features/auth/pages/login_page.dart';
import '../../features/feed/pages/feed_page.dart';
import '../../features/home/pages/home_page.dart';
import '../../features/profile/pages/profile_page.dart';
import '../../identity/pages/register_page.dart';

/// Centraliza rutas nombradas de MotorSocial.
///
/// Uso en `MaterialApp(onGenerateRoute: AppRouter.routeGenerate)`
/// y navegación por nombre (`Navigator.pushReplacementNamed`).
class AppRouter {
  static const String home = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String catalog = '/catalog';
  static const String feed = '/feed';
  static const String profile = '/profile';
  static const String account = '/account';

  /// `onGenerateRoute` estándar. Recibe `RouteSettings` y retorna la `Route`
  /// correspondiente al nombre. Usar como:
  /// ```dart
  /// MaterialApp(onGenerateRoute: AppRouter.routeGenerate, initialRoute: AppRouter.home)
  /// ```
  static Route<dynamic> routeGenerate(RouteSettings settings) {
    final name = settings.name;
    switch (name) {
      case home:
        return _material(const HomePage(), settings: settings);
      case login:
        return _material(const LoginPage(), settings: settings);
      case register:
        return _material(const RegisterPage(), settings: settings);
      case catalog:
        return _material(const CatalogListPage(), settings: settings);
      case feed:
        return _material(const FeedPage(), settings: settings);
      case profile:
        return _material(const ProfilePage(), settings: settings);
      case account:
        return _material(const AccountPage(), settings: settings);
      default:
        return _material(_NotFoundPage(routeName: name ?? ''),
            settings: settings);
    }
  }

  /// Compatibilidad hacia atrás con `routeFor(String)`.
  static Route<dynamic> routeFor(String name) =>
      routeGenerate(RouteSettings(name: name));

  static List<Route<dynamic>> routes() => [routeFor(home)];

  static MaterialPageRoute<dynamic> _material(Widget child,
          {required RouteSettings settings}) =>
      MaterialPageRoute<dynamic>(builder: (_) => child, settings: settings);
}

class _NotFoundPage extends StatelessWidget {
  final String routeName;
  const _NotFoundPage({required this.routeName});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('No encontrado')),
        body: Center(child: Text('Ruta desconocida: $routeName')),
      );
}
