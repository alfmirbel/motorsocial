import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../activity/activity.dart';

class FeedPage extends ConsumerWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activities = ref.watch(activityRepositoryProvider).recentFeed(
          const ActivityQuery(limit: 10),
        );

    return Scaffold(
      appBar: AppBar(title: const Text('Actividad')),
      body: FutureBuilder<List<SocialActivity>>(
        future: activities,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          final data = snapshot.data ?? const <SocialActivity>[];
          if (data.isEmpty) {
            return const Center(child: Text('Sin actividad.'));
          }
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              final item = data[index];
              return ListTile(
                title: Text(item.actorName),
                subtitle: Text('${item.verb} -> ${item.objectId}'),
              );
            },
          );
        },
      ),
    );
  }
}
