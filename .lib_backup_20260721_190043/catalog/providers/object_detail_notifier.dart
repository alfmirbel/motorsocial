import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data_models/social_object.dart';

class ObjectDetailNotifier extends Notifier<AsyncValue<SocialObject?>> {
  @override
  AsyncValue<SocialObject?> build() => const AsyncValue.data(null);
}

final objectDetailProvider = NotifierProvider<ObjectDetailNotifier, AsyncValue<SocialObject?>>(ObjectDetailNotifier.new);
