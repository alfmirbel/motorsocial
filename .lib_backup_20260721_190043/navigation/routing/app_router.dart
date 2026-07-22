import 'package:flutter/material.dart';

class AppRouter {
  static const String home = '/';
  static const String login = '/login';
  static const String catalog = '/catalog';
  static const String feed = '/feed';
  static const String profile = '/profile';

  static Route<dynamic> routeFor(String name) {
    switch (name) {
      case home:
        return MaterialPageRoute(builder: (_) => const _PlaceholderPage(title: 'Home', routeName: home));
      case login:
        return MaterialPageRoute(builder: (_) => const _PlaceholderPage(title: 'Login', routeName: login));
      case catalog:
        return MaterialPageRoute(builder: (_) => const _PlaceholderPage(title: 'Catálogo', routeName: catalog));
      case feed:
        return MaterialPageRoute(builder: (_) => const _PlaceholderPage(title: 'Feed', routeName: feed));
      case profile:
        return MaterialPageRoute(builder: (_) => const _PlaceholderPage(title: 'Perfil', routeName: profile));
      default:
        return MaterialPageRoute(builder: (_) => _NotFoundPage(routeName: name));
    }
  }

  static List<Route<dynamic>> routes() => [AppRouter.routeFor(home)];
}

class _PlaceholderPage extends StatelessWidget {
  final String title;
  final String routeName;
  const _PlaceholderPage({required this.title, required this.routeName});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text(title)),
        body: Center(child: Text(routeName)),
      );
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
