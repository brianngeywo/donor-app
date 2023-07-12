import 'package:flutter/material.dart';

import '../services/auth_service.dart';

class BeneficiaryDashboardSidebar extends StatelessWidget {
  final Function(String) onItemSelected;

  BeneficiaryDashboardSidebar({required this.onItemSelected});

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
            title: const Text('Your Profile',
                style: TextStyle(color: Colors.white)),
            onTap: () {
              onItemSelected('Your Profile');
            },
          ),
          ListTile(
            leading: const Icon(Icons.send_outlined, color: Colors.white),
            title: const Text("Request Donation",
                style: TextStyle(color: Colors.white)),
            onTap: () {
              onItemSelected('Request Donation');
            },
          ),
          ListTile(
            leading: const Icon(Icons.check_circle, color: Colors.white),
            title: const Text('Approved Donations',
                style: TextStyle(color: Colors.white)),
            onTap: () {
              onItemSelected('Approved Donations');
            },
          ),
          ListTile(
            leading: const Icon(Icons.pending, color: Colors.white),
            title: const Text('Pending Donations',
                style: TextStyle(color: Colors.white)),
            onTap: () {
              onItemSelected('Pending Donations');
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
