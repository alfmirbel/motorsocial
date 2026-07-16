import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data_models/connection_status.dart';

abstract class ConnectivityRepository {
  Future<bool> isConnected();
}

class StubConnectivityRepository implements ConnectivityRepository {
  @override Future<bool> isConnected() async => true;
}

final connectivityRepositoryProvider = Provider<ConnectivityRepository>((ref) => StubConnectivityRepository());
