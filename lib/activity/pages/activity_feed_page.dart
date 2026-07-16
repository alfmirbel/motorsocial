import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data_models/activity_contract.dart';

class ActivityFeedPage extends ConsumerWidget {
  const ActivityFeedPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(body: Center(child: Text('Feed')));
  }
}
