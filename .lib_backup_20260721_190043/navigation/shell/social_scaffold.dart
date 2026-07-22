import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/tab_menu_notifier.dart';
import '../data_models/menu_item.dart';

class SocialScaffold extends ConsumerWidget {
  final Widget body;
  final List<SocialMenuItem>? tabs;
  final int initialIndex;

  const SocialScaffold({
    super.key,
    required this.body,
    this.tabs,
    this.initialIndex = 0,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = tabs ?? const <SocialMenuItem>[];
    final index = ref.watch(bottomIndexProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('MotorSocial')),
      body: body,
      bottomNavigationBar: items.isEmpty
          ? null
          : BottomNavigationBar(
              currentIndex: index,
              onTap: (i) {
                if (i < 0 || i >= items.length) return;
                ref.read(bottomIndexProvider.notifier).state = i;
                final route = items[i].route;
                if (route.isNotEmpty) {
                  Navigator.of(context).pushReplacementNamed(route);
                }
              },
              items: items
                  .map((item) => BottomNavigationBarItem(
                        icon: const Icon(Icons.circle),
                        label: item.title,
                      ))
                  .toList(),
            ),
    );
  }
}
