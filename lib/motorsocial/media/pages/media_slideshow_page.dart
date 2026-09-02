import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MediaSlideshowPage extends ConsumerStatefulWidget {
  final String assetId;

  const MediaSlideshowPage({super.key, required this.assetId});

  @override
  ConsumerState<MediaSlideshowPage> createState() => _MediaSlideshowPageState();
}

class _MediaSlideshowPageState extends ConsumerState<MediaSlideshowPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Slideshow')),
      body: Center(child: Text('Slideshow ${widget.assetId}')),
    );
  }
}
