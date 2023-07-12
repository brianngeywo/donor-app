import 'package:firebase_auth/firebase_auth.dart';

import 'auth_manager.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      final User? user = userCredential.user;
      AuthManager().setCurrentUser(user);
      return user!.uid;
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  Future<String?> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      final UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      final User? user = userCredential.user;
      AuthManager().setCurrentUser(user);
      return user!.uid;
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Stream<User?> get authStateChanges {
    return _firebaseAuth.authStateChanges();
  }
}
