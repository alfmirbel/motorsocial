import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../social_graph/social_graph.dart';

class ChatPage extends ConsumerWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(groupProvider);
    final groups = state.groups;

    return Scaffold(
      appBar: AppBar(title: const Text('Chat / Grupos')),
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : state.error != null
              ? Center(child: Text('Error: ${state.error}'))
              : groups.isEmpty
                  ? const Center(child: Text('Sin grupos.'))
                  : ListView.builder(
                      itemCount: groups.length,
                      itemBuilder: (context, index) {
                        final group = groups[index];
                        return ListTile(
                          title: Text(group.name),
                          subtitle:
                              Text(group.isPublic ? 'Público' : 'Privado'),
                        );
                      },
                    ),
    );
  }
}
