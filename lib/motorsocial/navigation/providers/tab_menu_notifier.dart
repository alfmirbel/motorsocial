import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data_models/menu_item.dart';

class TabMenuState {
  final List<SocialMenuItem> items;
  final int selectedIndex;
  const TabMenuState({required this.items, required this.selectedIndex});

  TabMenuState copyWith({List<SocialMenuItem>? items, int? selectedIndex}) {
    return TabMenuState(
        items: items ?? this.items,
        selectedIndex: selectedIndex ?? this.selectedIndex);
  }
}

/// TabMenuNotifier — Riverpod 3.x (reemplaza StateNotifier<TabMenuState>).
class TabMenuNotifier extends Notifier<TabMenuState> {
  @override
  TabMenuState build() =>
      const TabMenuState(items: <SocialMenuItem>[], selectedIndex: 0);

  /// Inicializa o reinicia el menú. Útil cuando el scaffold provee `tabs`.
  void configure({required List<SocialMenuItem> items, int initialIndex = 0}) {
    state = TabMenuState(items: items, selectedIndex: initialIndex);
  }

  void selectItem(int index) {
    if (index < 0 || index >= state.items.length) return;
    state = state.copyWith(selectedIndex: index);
  }

  void setEnabled(int index, bool enabled) {
    if (index < 0 || index >= state.items.length) return;
    final old = state.items[index];
    final items = List<SocialMenuItem>.from(state.items);
    items[index] =
        SocialMenuItem(title: old.title, route: old.route, enabled: enabled);
    state = state.copyWith(items: items);
  }

  SocialMenuItem selected() => state.items[state.selectedIndex];
  List<SocialMenuItem> get enabledItems =>
      state.items.where((item) => item.enabled).toList();
}

final tabMenuProvider =
    NotifierProvider<TabMenuNotifier, TabMenuState>(TabMenuNotifier.new);

/// Notifier simple para la ruta activa (reemplaza StateProvider<String>).
class ActiveRouteNotifier extends Notifier<String> {
  @override
  String build() => '/';

  void set(String route) => state = route;
}

final activeRouteProvider =
    NotifierProvider<ActiveRouteNotifier, String>(ActiveRouteNotifier.new);

/// Notifier para índice del drawer (reemplaza StateProvider<int>).
class DrawerIndexNotifier extends Notifier<int> {
  @override
  int build() => 0;

  void set(int index) => state = index;
}

final drawerIndexProvider =
    NotifierProvider<DrawerIndexNotifier, int>(DrawerIndexNotifier.new);

/// Notifier para índice del bottom nav (reemplaza StateProvider<int>).
class BottomIndexNotifier extends Notifier<int> {
  @override
  int build() => 0;

  void set(int index) => state = index;
}

final bottomIndexProvider =
    NotifierProvider<BottomIndexNotifier, int>(BottomIndexNotifier.new);
