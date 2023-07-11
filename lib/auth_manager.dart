import 'package:firebase_auth/firebase_auth.dart';

class AuthManager {
  static final AuthManager _instance = AuthManager._internal();

  factory AuthManager() => _instance;

  AuthManager._internal();

  User? _currentUser;

  User? get currentUser => _currentUser;

  void setCurrentUser(User? user) {
    _currentUser = user;
  }
}
