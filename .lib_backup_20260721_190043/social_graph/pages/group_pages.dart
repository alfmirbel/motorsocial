
import 'package:flutter/material.dart';


class GroupViews {
  static const String contacts = 'contactos';
  static const String groups = 'grupos';
  static const String invitations = 'invitations';
}

class InvitationsPage extends StatelessWidget {
  const InvitationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Invitaciones')),
      body: const Center(child: Text('Invitaciones')),
    );
  }
}

class GroupPages {
  static Widget buildContacts() => const Center(child: Text('Contactos'));
  static Widget buildGroups() => const Center(child: Text('Grupos'));
  static Widget buildInvitations() => const InvitationsPage();
}
