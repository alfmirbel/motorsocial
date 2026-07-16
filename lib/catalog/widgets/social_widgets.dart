import 'package:flutter/material.dart';

import 'package:motorsocial/activity/data_models/activity_contract.dart';

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
