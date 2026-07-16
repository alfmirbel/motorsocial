import 'package:flutter_riverpod/flutter_riverpod.dart';

class MediaLibraryState {
  final List<String> mediaIds;
  const MediaLibraryState({this.mediaIds = const <String>[]});

  MediaLibraryState copyWith({List<String>? mediaIds}) => MediaLibraryState(mediaIds: mediaIds ?? this.mediaIds);
}

class MediaLibraryNotifier extends Notifier<MediaLibraryState> {
  @override
  MediaLibraryState build() => const MediaLibraryState();
}

final mediaLibraryProvider = NotifierProvider<MediaLibraryNotifier, MediaLibraryState>(MediaLibraryNotifier.new);
