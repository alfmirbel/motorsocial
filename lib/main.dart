import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/app_shell.dart';
import 'core/config/social_app_config.dart';
import 'core/motorsocial_bridge/bridge.dart';
import 'core/database/database_module.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final config = SocialAppConfig.defaults();
  final databaseModule = DatabaseModule.local();
  runApp(
    ProviderScope(
      overrides: [
        motorSocialBridgeProvider.overrideWithValue(createMotorSocialBridge(
            config: config, databaseModule: databaseModule)),
      ],
      child: const SocialAppRoot(),
    ),
  );
}

class SocialAppRoot extends ConsumerWidget {
  const SocialAppRoot({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bridge = ref.read(motorSocialBridgeProvider);
    final config = bridge.config;
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
      home: const _BootstrapPlaceholder(),
    );
  }
}

class _BootstrapPlaceholder extends StatelessWidget {
  const _BootstrapPlaceholder();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MainShell(),
    );
  }
}
