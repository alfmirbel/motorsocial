import 'package:flutter/material.dart';

import '../data_models/social_object.dart';

class ObjectWidgets {
  final SocialObject object;

  const ObjectWidgets(this.object);

  Widget buildCard() {
    return Card(
      child: ListTile(
        title: Text(object.title ?? object.type),
        subtitle: Text(object.id),
      ),
    );
  }
}
