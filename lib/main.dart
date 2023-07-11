import 'package:donor_app/auth_manager.dart';
import 'package:donor_app/auth_service.dart';
import 'package:donor_app/login.dart';
import 'package:donor_app/main_dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async {
  // Initialize Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget _buildContent(User? user) {
    // return MainDashboard();
    if (user == null) {
      // User is logged out
      return LoginScreen();
    } else {
      // User is logged in
      return MainDashboard();
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
