import 'package:donor_app/donor_dashboard/login.dart';
import 'package:donor_app/donor_dashboard/main_dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../services/auth_service.dart';

class DonorHomePage extends StatefulWidget {
  const DonorHomePage({super.key});

  @override
  State<DonorHomePage> createState() => _DonorHomePageState();
}

class _DonorHomePageState extends State<DonorHomePage> {
  Widget _buildContent(User? user) {
    // return MainDashboard();
    if (user == null) {
      // User is logged out
      return DonorLoginScreen();
    } else {
      // User is logged in
      return MainDonorDashboard();
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: AuthService().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Loading state
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else {
          // Auth state received
          User? user = snapshot.data;
          return _buildContent(user);
        }
      },
    );
  }
}
