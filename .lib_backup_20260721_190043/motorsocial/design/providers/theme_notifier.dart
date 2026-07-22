import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeNotifier extends Notifier<void> {
  @override
  void build() {}
}

final themeNotifierProvider = NotifierProvider<ThemeNotifier, void>(ThemeNotifier.new);
