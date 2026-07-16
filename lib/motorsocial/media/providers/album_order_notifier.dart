import 'package:flutter_riverpod/flutter_riverpod.dart';

class AlbumOrderState {
  final int order;
  const AlbumOrderState({this.order = 0});

  AlbumOrderState copyWith({int? order}) => AlbumOrderState(order: order ?? this.order);
}

class AlbumOrderNotifier extends Notifier<AlbumOrderState> {
  @override
  AlbumOrderState build() => const AlbumOrderState();
}

final albumOrderProvider = NotifierProvider<AlbumOrderNotifier, AlbumOrderState>(AlbumOrderNotifier.new);
