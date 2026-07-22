import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppConfig {
  final String appName;
  const AppConfig({required this.appName});
}

final appConfigProvider = Provider<AppConfig>((_) {
  return const AppConfig(appName: 'MotorSocial');
});
