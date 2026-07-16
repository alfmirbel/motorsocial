import 'package:flutter_riverpod/flutter_riverpod.dart';

final connectionProvider = NotifierProvider<ConnectionNotifier, bool>(ConnectionNotifier.new);

class ConnectionNotifier extends Notifier<bool> {
  @override
  bool build() => false;
}
