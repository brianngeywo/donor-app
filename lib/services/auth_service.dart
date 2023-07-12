import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:donor_app/models/user_model.dart';
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

  saveUserDetailsToFirestore(UserModel newUser) {
    try {
      final user = AuthManager().currentUser;
      if (user != null) {
        final userId = user.uid;
        final userCollection = FirebaseFirestore.instance.collection('users');
        userCollection.doc(userId).set(newUser.toMap());
      }
    } catch (e) {
      print('Error adding user: $e');
      // Handle the error as needed
    }
  }
}
