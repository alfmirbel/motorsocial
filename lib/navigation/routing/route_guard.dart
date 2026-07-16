import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/tab_menu_notifier.dart';
import 'app_router.dart';

class RouteGuard {
  static Future<bool> canAccess(BuildContext context, String route) async {
    final publicRoutes = <String>{AppRouter.login};
    if (publicRoutes.contains(route)) return true;

    final isLoggedIn = await _isLoggedIn();
    if (!isLoggedIn) {
      if (context.mounted) {
        Navigator.of(context).pushReplacementNamed(AppRouter.login);
      }
      return false;
    }
    return true;
  }

  static Future<bool> _isLoggedIn() async {
    // TODO: read session repository here after wiring.
    return true;
  }
}
