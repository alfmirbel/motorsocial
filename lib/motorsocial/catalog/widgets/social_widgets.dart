import 'package:flutter/material.dart';

import '../../activity/data_models/social_activity.dart';

class SocialWidgets {
  final SocialActivity activity;

  const SocialWidgets(this.activity);

  Widget buildActivityTile() {
    return ListTile(
      title: Text(activity.verb.toUpperCase()),
      subtitle: Text(activity.actorName),
    );
  }
}
