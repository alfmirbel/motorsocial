import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data_models/social_object.dart';

class CatalogState {
  final AsyncValue<SocialObjectPage?> page;
  final bool isLoading;
  final String? error;
  const CatalogState({this.page = const AsyncValue.data(null), this.isLoading = false, this.error});

  CatalogState copyWith({AsyncValue<SocialObjectPage?>? page, bool? isLoading, String? error}) {
    return CatalogState(page: page ?? this.page, isLoading: isLoading ?? this.isLoading, error: error ?? this.error);
  }
}

class CatalogNotifier extends Notifier<CatalogState> {
  @override
  CatalogState build() => const CatalogState();
}

final catalogProvider = NotifierProvider<CatalogNotifier, CatalogState>(CatalogNotifier.new);
