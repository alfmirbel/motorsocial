import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/media_library_notifier.dart';

class MediaLibraryPage extends ConsumerWidget {
  const MediaLibraryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ids = ref.watch(mediaLibraryProvider).mediaIds;
    return Scaffold(
      appBar: AppBar(title: const Text('Biblioteca')),
      body: ListView.builder(itemCount: ids.length, itemBuilder: (context, index) => ListTile(title: Text(ids[index]))),
    );
  }
}
