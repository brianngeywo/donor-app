import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../desktop_layout/donor_dashboard/login.dart';
import '../../services/auth_manager.dart';
import '../../services/auth_service.dart';
import 'mobile_main_donor_dashboard.dart';

class MobileDonorHomePage extends StatefulWidget {
  const MobileDonorHomePage({super.key});

  @override
  State<MobileDonorHomePage> createState() => _MobileDonorHomePageState();
}

class _MobileDonorHomePageState extends State<MobileDonorHomePage> {
  Widget _buildContent(User? user) {
    // return MainDashboard();
    if (user == null) {
      // User is logged out
      return DonorLoginScreen();
    } else {
      // User is logged in
      return MobileMainDonorDashboard();
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
          AuthManager().setCurrentUser(user);
          return _buildContent(user);
        }
      },
    );
  }
}