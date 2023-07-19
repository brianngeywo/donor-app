import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'desktop_layout/desktop_role_selection_screen.dart';
import 'firebase_options.dart';
import 'mobile_layout/mobile_role_selection_screen.dart';

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
      home: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth >= 1200) {
            // Desktop layout
            return DesktopHomePage();
          } else if (constraints.maxWidth >= 480) {
            // Tablet layout
            return TabletHomePage();
          } else {
            // Mobile layout
            return MobileHomePage();
          }
        },
      ),
    );
  }
}

class DesktopHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Build your desktop layout
    return Scaffold(
      body: Center(
        child: DesktopRoleSelectionPage(),
      ),
    );
  }
}

class TabletHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Build your tablet layout
    return Scaffold(
      body: Center(
        child: DesktopRoleSelectionPage(),
      ),
    );
  }
}

class MobileHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Build your mobile layout
    return Scaffold(
      body: Center(
        child: MobileRoleSelectionPage(),
      ),
    );
  }
}