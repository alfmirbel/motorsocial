import 'package:flutter/material.dart';
import '../data_models/activity_contract.dart';

class SocialActivityTile extends StatelessWidget {
  final SocialActivity activity;
  final String Function(SocialActivity)? verbLabelBuilder;
  final Widget Function(SocialActivity)? contentBuilder;

  const SocialActivityTile({super.key, required this.activity, this.verbLabelBuilder, this.contentBuilder});

  @override
  Widget build(BuildContext context) {
    final label = (verbLabelBuilder?.call(activity) ?? 'Evento').toUpperCase();
    return ListTile(title: Text(label), subtitle: Text(activity.actorName), trailing: Text('#${activity.objectId ?? '-'}'), onTap: () {});
  }
}
