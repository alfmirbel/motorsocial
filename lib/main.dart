import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/config/social_app_config.dart';
import 'core/providers/app_providers.dart';
import 'identity/pages/login_page.dart';
import 'navigation/shell/social_scaffold.dart';
import 'home/pages/home_page.dart';
import 'catalog/pages/catalog_page.dart';
import 'feed/pages/feed_page.dart';
import 'chat/pages/chat_page.dart';
import 'account/pages/account_page.dart';
import 'profile/pages/profile_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MotorSocialApp()));
}

class MotorSocialApp extends ConsumerWidget {
  const MotorSocialApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final config = SocialAppConfig.defaults();
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

class _BootstrapPlaceholder extends ConsumerWidget {
  const _BootstrapPlaceholder({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(sessionProvider);
    final userId = session['userId'];
    if (userId == null || userId.isEmpty) {
      return const LoginPage();
    }

    return const SocialScaffold(
      body: _Pages(),
    );
  }
}

class _Pages extends StatelessWidget {
  const _Pages();

  @override
  Widget build(BuildContext context) {
    return const IndexedStack(
      index: 0,
      children: [
        HomePage(),
        CatalogPage(),
        FeedPage(),
        ChatPage(),
        AccountPage(),
        ProfilePage(),
      ],
    );
  }
}
