import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class PlatformRepository {
  Future<String> current();
}

class StubPlatformRepository implements PlatformRepository {
  @override Future<String> current() async => 'unknown';
}

final platformRepositoryProvider = Provider<PlatformRepository>((ref) => StubPlatformRepository());
