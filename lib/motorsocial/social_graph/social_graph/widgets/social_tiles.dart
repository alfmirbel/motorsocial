import 'package:flutter/material.dart';

import '../data_models/invitation.dart';
import '../data_models/social_group.dart';
import '../data_models/social_relationship.dart';

class SocialRelationshipTile extends StatelessWidget {
  final SocialRelationship relationship;
  const SocialRelationshipTile({super.key, required this.relationship});

  @override
  Widget build(BuildContext context) {
    return ListTile(title: Text('Relación ${relationship.type}'), subtitle: Text(relationship.targetId));
  }
}

class SocialGroupTile extends StatelessWidget {
  final SocialGroup group;
  const SocialGroupTile({super.key, required this.group});

  @override
  Widget build(BuildContext context) {
    return ListTile(title: Text(group.name), subtitle: Text('${group.memberIds.length} miembros'));
  }
}

class InvitationTile extends StatelessWidget {
  final Invitation invitation;
  const InvitationTile({super.key, required this.invitation});

  @override
  Widget build(BuildContext context) {
    return ListTile(title: Text('Invitación ${invitation.status}'), subtitle: Text(invitation.senderId));
  }
}
