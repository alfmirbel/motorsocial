import 'package:flutter_riverpod/flutter_riverpod.dart';

final platformProvider = NotifierProvider<PlatformNotifier, String>(PlatformNotifier.new);

class PlatformNotifier extends Notifier<String> {
  @override
  String build() => 'unknown';
}
