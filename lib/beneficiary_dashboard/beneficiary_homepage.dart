import 'package:donor_app/donor_dashboard/login.dart';
import 'package:donor_app/donor_dashboard/main_donor_dashboard.dart';
import 'package:donor_app/services/auth_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../services/auth_service.dart';
import 'beneficiary_dashboard.dart';
import 'beneficiary_login.dart';

class BeneficiaryHomePage extends StatefulWidget {
  const BeneficiaryHomePage({super.key});

  @override
  State<BeneficiaryHomePage> createState() => _BeneficiaryHomePageState();
}

class _BeneficiaryHomePageState extends State<BeneficiaryHomePage> {
  Widget _buildContent(User? user) {
    // return MainDashboard();
    if (user == null) {
      // User is logged out
      return BeneficiaryLoginScreen();
    } else {
      // User is logged in
      return MainBeneficiaryDashboard();
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
