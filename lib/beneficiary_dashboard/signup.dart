import 'package:donor_app/donor_dashboard/constants.dart';
import '../models/user_model.dart';
import '../services/auth_manager.dart';
import '../services/auth_service.dart';
import 'beneficiary_login.dart';
import 'package:flutter/material.dart';

class BeneficiarySignUpScreen extends StatefulWidget {
  const BeneficiarySignUpScreen({Key? key});

  @override
  State<BeneficiarySignUpScreen> createState() =>
      _BeneficiarySignUpScreenState();
}

class _BeneficiarySignUpScreenState extends State<BeneficiarySignUpScreen> {
  String email = '';
  String password = '';
  String name = '';

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
                'Beneficiary App',
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
              const SizedBox(height: 32.0),
              TextField(
                onChanged: (value) {
                  // Handle name input
                  setState(() {
                    name = value;
                  });
                },
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              const SizedBox(height: 16.0),
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
                        UserModel newUser = UserModel(
                          id: userId,
                          email: email,
                          password: password,
                          name: name,
                          role: UserRole.Requester,
                        );
                        // Save user details to Firestore database
                        await AuthService().saveUserDetailsToFirestore(newUser);
                        // show success snackbar
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Sign-up successful!',
                                style: TextStyle(color: Colors.white)),
                            backgroundColor: Colors.green,
                          ),
                        );
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: (context) => BeneficiaryLoginScreen()),
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
                    MaterialPageRoute(
                        builder: (context) => BeneficiaryLoginScreen()),
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
