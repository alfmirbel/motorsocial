import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pruebamotorsocial/motorsocial/navigation/navigation.dart';
import 'package:pruebamotorsocial/core/app_shell.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MotorSocialApp()));
}

class MotorSocialApp extends ConsumerWidget {
  const MotorSocialApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'MotorSocial',
      themeMode: ThemeMode.system,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF415AA9)),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF415AA9), brightness: Brightness.dark),
        useMaterial3: true,
      ),
      initialRoute: '/catalog',
      routes: {
        '/catalog': (_) => const SocialScaffold(body: CatalogPage()),
        '/home': (_) => const SocialScaffold(body: HomePage()),
        '/feed': (_) => const SocialScaffold(body: FeedPage()),
        '/chat': (_) => const SocialScaffold(body: ChatPage()),
        '/account': (_) => const SocialScaffold(body: AccountPage()),
        '/profile': (_) => const SocialScaffold(body: ProfilePage()),
        '/login': (_) => const LoginPage(),
      },
      onGenerateRoute: AppRouter.routeFor,
    );
  }
}
