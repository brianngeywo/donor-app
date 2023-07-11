import 'package:donor_app/auth_service.dart';
import 'package:flutter/material.dart';

class DashboardSidebar extends StatelessWidget {
  final Function(String) onItemSelected;

  DashboardSidebar({required this.onItemSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250.0,
      color: Theme.of(context).colorScheme.primary,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.add, color: Colors.white),
            title: const Text('Make Donation',
                style: TextStyle(color: Colors.white)),
            onTap: () {
              onItemSelected('Make Donation');
            },
          ),
          ListTile(
            leading: const Icon(Icons.history_outlined, color: Colors.white),
            title: const Text("My Donations",
                style: TextStyle(color: Colors.white)),
            onTap: () {
              onItemSelected('My Donations');
            },
          ),
          ListTile(
            leading: const Icon(Icons.history_outlined, color: Colors.white),
            title: const Text('Previous Donations',
                style: TextStyle(color: Colors.white)),
            onTap: () {
              onItemSelected('Previous Donations');
            },
          ),
          ListTile(
            leading: const Icon(Icons.event, color: Colors.white),
            title: const Text('Organization Donation Events',
                style: TextStyle(color: Colors.white)),
            onTap: () {
              onItemSelected('Organization Donation Events');
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
