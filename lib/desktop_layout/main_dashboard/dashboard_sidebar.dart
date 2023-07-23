import 'package:flutter/material.dart';

import '../../services/auth_service.dart';

class AdminDashboardSidebar extends StatelessWidget {
  final Function(String) onItemSelected;

  AdminDashboardSidebar({required this.onItemSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250.0,
      color: Theme.of(context).colorScheme.primary,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.account_circle, color: Colors.white),
            title: const Text('Your Profile', style: TextStyle(color: Colors.white)),
            onTap: () {
              onItemSelected('Your Profile');
            },
          ),
          ListTile(
            leading: const Icon(Icons.add, color: Colors.white),
            title: const Text('Donations', style: TextStyle(color: Colors.white)),
            onTap: () {
              onItemSelected('Donors');
            },
          ),
          ListTile(
            leading: const Icon(Icons.history_outlined, color: Colors.white),
            title: const Text("Donation Requests", style: TextStyle(color: Colors.white)),
            onTap: () {
              onItemSelected('Donation Requests');
            },
          ),
          ListTile(
            leading: const Icon(Icons.history_outlined, color: Colors.white),
            title: const Text('Reports', style: TextStyle(color: Colors.white)),
            onTap: () {
              onItemSelected('Reports');
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.white),
            title: const Text('Logout', style: TextStyle(color: Colors.white)),
            onTap: () {
              AuthService().signOut();
            },
          ),
// Add any other relevant sidebar items here
        ],
      ),
    );
  }
}
