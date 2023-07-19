import 'package:flutter/material.dart';

import '../../services/auth_service.dart';

class MobileDonorDashboardDrawer extends StatelessWidget {
  final Function(String) onItemSelected;

  MobileDonorDashboardDrawer({required this.onItemSelected});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.primary,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Text(
              'Donor Dashboard',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.account_circle, color: Colors.white),
            title: const Text('Your Profile',
                style: TextStyle(color: Colors.white)),
            onTap: () {
              onItemSelected('Your Profile');
              Navigator.of(context).pop(); // Close the drawer
            },
          ),
          ListTile(
            leading: const Icon(Icons.add, color: Colors.white),
            title: const Text('Make Donation',
                style: TextStyle(color: Colors.white)),
            onTap: () {
              onItemSelected('Make Donation');
              Navigator.of(context).pop(); // Close the drawer
            },
          ),
          ListTile(
            leading: const Icon(Icons.history_outlined, color: Colors.white),
            title: const Text("My Donations",
                style: TextStyle(color: Colors.white)),
            onTap: () {
              onItemSelected('My Donations');
              Navigator.of(context).pop(); // Close the drawer
            },
          ),
          ListTile(
            leading: const Icon(Icons.history_outlined, color: Colors.white),
            title: const Text('Previous Donations',
                style: TextStyle(color: Colors.white)),
            onTap: () {
              onItemSelected('Previous Donations');
              Navigator.of(context).pop(); // Close the drawer
            },
          ),
          ListTile(
            leading: const Icon(Icons.event, color: Colors.white),
            title: const Text('Organization Events',
                style: TextStyle(color: Colors.white)),
            onTap: () {
              onItemSelected('Organization Events');
              Navigator.of(context).pop(); // Close the drawer
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.white),
            title: const Text('Logout', style: TextStyle(color: Colors.white)),
            onTap: () {
              AuthService().signOut();
              Navigator.of(context).pop(); // Close the drawer
            },
          ),
        ],
      ),
    );
  }
}
