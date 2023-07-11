import 'package:donor_app/auth_manager.dart';
import 'package:donor_app/constants.dart';
import 'package:donor_app/donor_model.dart';
import 'package:donor_app/login.dart';
import 'package:donor_app/main_dashboard.dart';
import 'package:flutter/material.dart';

import 'auth_service.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
            children: [
              const Text(
                'Donor App',
                style: TextStyle(
                  fontSize: 48.0,
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Sign Up',
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
                onPressed: () async {
                  if (email.isNotEmpty && password.isNotEmpty) {
                    try {
                      // Create user account
                      await AuthService()
                          .createUserWithEmailAndPassword(email, password);

                      // Check if user is signed in
                      if (AuthManager().currentUser != null) {
                        String userId = AuthManager().currentUser!.uid;
                        print("user id: " + userId);
                        Donor newDoner = Donor(
                          id: userId,
                          email: email,
                          password: password,
                          name: AuthManager().currentUser!.displayName ?? '',
                          phone: AuthManager().currentUser!.phoneNumber ?? '',
                          address: '',
                          donations: [],
                        );
                        // Save user details to Firestore database
                        donorsCollection.doc(userId).set(newDoner.toMap());
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
                        );
                      }
                    } catch (e) {
                      // Handle any errors that occurred during sign-up
                      print('Sign-up error: $e');
                    }
                  }
                },
                child: const Text(
                  'SIGN UP',
                  style: TextStyle(fontSize: 13.0, color: Colors.white),
                ),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Already have an account?',
                style: TextStyle(fontSize: 13.0),
              ),
              const SizedBox(height: 8.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 48.0),
                  primary: Colors.deepPurple,
                  backgroundColor: Colors.deepPurple[50],
                ),
                onPressed: () {
                  // Navigate to the login screen
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                child: const Text(
                  'LOGIN',
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
