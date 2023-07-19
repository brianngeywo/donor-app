import 'package:donor_app/desktop_layout/beneficiary_dashboard/signup.dart';
import 'package:flutter/material.dart';

import '../../services/auth_service.dart';
import 'beneficiary_dashboard.dart';

class BeneficiaryLoginScreen extends StatefulWidget {
  @override
  State<BeneficiaryLoginScreen> createState() => _BeneficiaryLoginScreenState();
}

class _BeneficiaryLoginScreenState extends State<BeneficiaryLoginScreen> {
  String email = '';

  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Beneficiary App',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 48.0,
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Login',
                style: TextStyle(fontSize: 26.0),
              ),
              TextField(
                onChanged: (value) {
                  // Handle email input
                  setState(() {
                    email = value;
                  });
                },
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              const SizedBox(height: 16.0),
              TextField(
                onChanged: (value) {
                  // Handle password input
                  setState(() {
                    password = value;
                  });
                },
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Password'),
              ),
              const SizedBox(height: 32.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 48.0),
                  primary: Colors.deepPurple,
                ),
                onPressed: () {
                  // Handle login button press
                  if (email.isNotEmpty || password.isNotEmpty) {
                    AuthService().signInWithEmailAndPassword(email, password);
                    Future.delayed(const Duration(seconds: 2), () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => MainBeneficiaryDashboard()));
                    });
                  }
                },
                child: const Text(
                  'LOGIN',
                  style: TextStyle(fontSize: 13.0, color: Colors.white),
                ),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Don\'t have an account?',
                style: TextStyle(fontSize: 13.0),
              ),
              const SizedBox(height: 8.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 48.0),
                  primary: Colors.deepPurple,
                  backgroundColor: Colors.deepPurple.shade100,
                ),
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => BeneficiarySignUpScreen()));
                },
                child: const Text(
                  'REGISTER',
                  style: TextStyle(fontSize: 13.0, color: Colors.deepPurple),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
