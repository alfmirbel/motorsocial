import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data_models/social_group.dart';

class GroupState {
  final List<SocialGroup> groups;
  final bool isLoading;
  final String? error;
  const GroupState({this.groups = const <SocialGroup>[], this.isLoading = false, this.error});

  GroupState copyWith({List<SocialGroup>? groups, bool? isLoading, String? error}) {
    return GroupState(groups: groups ?? this.groups, isLoading: isLoading ?? this.isLoading, error: error ?? this.error);
  }
}

class GroupNotifier extends Notifier<GroupState> {
  @override
  GroupState build() => const GroupState();
}

final groupProvider = NotifierProvider<GroupNotifier, GroupState>(GroupNotifier.new);
