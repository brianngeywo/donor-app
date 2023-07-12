import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user_model.dart';

class UserService {
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

  // Get a single user by ID
  Future<UserModel> getUser(String userId) async {
    DocumentSnapshot doc = await usersCollection.doc(userId).get();
    if (doc.exists) {
      return UserModel.fromMap(doc.data() as Map<String, dynamic>);
    } else {
      throw Exception('User not found');
    }
  }

  // Add a new user
  Future<void> addUser(UserModel user) async {
    await usersCollection.doc(user.id).set(user.toMap());
  }

  // Update an existing user
  Future<void> updateUser(UserModel user) async {
    await usersCollection.doc(user.id).update(user.toMap());
  }

  // Delete a user
  Future<void> deleteUser(String userId) async {
    await usersCollection.doc(userId).delete();
  }

  // Stream of all users
  Stream<List<UserModel>> getAllUsersAsStream() {
    return usersCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return UserModel.fromMap(doc.data() as Map<String, dynamic>);
      }).toList();
    });
  }
}
