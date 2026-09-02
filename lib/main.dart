import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

import 'motorsocial/core/theme/app_theme.dart';
import 'motorsocial/navigation/routing/app_router.dart';

Future<void> main() async {
  // URLs limpias (sin #) en Web; no-op en otras plataformas.
  usePathUrlStrategy();

  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MotorSocialApp()));
}

class MotorSocialApp extends StatelessWidget {
  const MotorSocialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MotorSocial',
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      darkTheme: appDarkTheme,
      initialRoute: AppRouter.home,
      onGenerateRoute: AppRouter.routeGenerate,
    );
  }
}
