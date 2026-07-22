import 'package:flutter_riverpod/flutter_riverpod.dart';

final syncProvider = NotifierProvider<SyncNotifier, int>(SyncNotifier.new);

class SyncNotifier extends Notifier<int> {
  @override
  int build() => 0;
}
