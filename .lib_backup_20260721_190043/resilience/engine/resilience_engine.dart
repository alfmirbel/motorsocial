import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/connection_notifier.dart';

class ResilienceEngine {
  const ResilienceEngine();

  void initializeProviders(WidgetRef ref) {
    ref.read(connectionProvider.notifier);
  }
}
