import 'package:flutter_riverpod/flutter_riverpod.dart';


abstract class ConnectivityRepository {
  Future<bool> isConnected();
}

class StubConnectivityRepository implements ConnectivityRepository {
  @override Future<bool> isConnected() async => true;
}

final connectivityRepositoryProvider = Provider<ConnectivityRepository>((ref) => StubConnectivityRepository());
