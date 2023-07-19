import 'package:donor_app/services/auth_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../services/auth_service.dart';
import 'mobile_beneficiary_dashboard.dart';
import 'mobile_beneficiary_login.dart';

class MobileBeneficiaryHomePage extends StatefulWidget {
  const MobileBeneficiaryHomePage({super.key});

  @override
  State<MobileBeneficiaryHomePage> createState() =>
      _MobileBeneficiaryHomePageState();
}

class _MobileBeneficiaryHomePageState extends State<MobileBeneficiaryHomePage> {
  Widget _buildContent(User? user) {
    // return MainDashboard();
    if (user == null) {
      // User is logged out
      return MobileBeneficiaryLoginScreen();
    } else {
      // User is logged in
      return MobileMainBeneficiaryDashboard();
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