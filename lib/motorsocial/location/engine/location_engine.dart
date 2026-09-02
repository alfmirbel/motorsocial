import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/location_notifier.dart';

class LocationEngine {
  const LocationEngine();

  void initializeProviders(WidgetRef ref) {
    ref.read(locationProvider.notifier);
  }
}
