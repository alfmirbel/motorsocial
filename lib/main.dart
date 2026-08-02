import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MotorSocialApp());
}

class MotorSocialApp extends StatelessWidget {
  const MotorSocialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MotorSocial',
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () {},
            child: const Text('MotorSocial'),
          ),
        ),
      ),
    );
  }
}
