import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data_models/menu_item.dart';

class TabMenuState {
  final List<SocialMenuItem> items;
  final int selectedIndex;
  const TabMenuState({required this.items, required this.selectedIndex});

  TabMenuState copyWith({List<SocialMenuItem>? items, int? selectedIndex}) {
    return TabMenuState(items: items ?? this.items, selectedIndex: selectedIndex ?? this.selectedIndex);
  }
}

class TabMenuNotifier extends StateNotifier<TabMenuState> {
  TabMenuNotifier({required List<SocialMenuItem> items, int initialIndex = 0})
      : super(TabMenuState(items: items, selectedIndex: initialIndex));

  void selectItem(int index) {
    if (index < 0 || index >= state.items.length) return;
    state = state.copyWith(selectedIndex: index);
  }

  void setEnabled(int index, bool enabled) {
    if (index < 0 || index >= state.items.length) return;
    final old = state.items[index];
    final items = List<SocialMenuItem>.from(state.items);
    items[index] = SocialMenuItem(title: old.title, route: old.route, enabled: enabled);
    state = state.copyWith(items: items);
  }

  SocialMenuItem selected() => state.items[state.selectedIndex];
  List<SocialMenuItem> get enabledItems => state.items.where((item) => item.enabled).toList();
}

final activeRouteProvider = StateProvider<String>((_) => '/');
final drawerIndexProvider = StateProvider<int>((_) => 0);
final bottomIndexProvider = StateProvider<int>((_) => 0);
