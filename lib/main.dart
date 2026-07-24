import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/config/social_app_config.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final config = SocialAppConfig.defaults();
  runApp(
    ProviderScope(
      child: MotorSocialApp(config: config),
    ),
  );
}

class MotorSocialApp extends ConsumerWidget {
  const MotorSocialApp({super.key, required this.config});
  final SocialAppConfig config;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uiMode =
        config.themeId.contains('dark') ? ThemeMode.dark : ThemeMode.system;
    const seed = Color(0xFF415AA9);
    return MaterialApp(
      title: config.appName,
      themeMode: uiMode,
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: seed, brightness: Brightness.light),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: seed, brightness: Brightness.dark),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: Center(
          child: Text(config.appName),
        ),
      ),
    );
  }
}
