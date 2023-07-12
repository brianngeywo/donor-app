import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/donation_model.dart';
import '../services/auth_manager.dart';

class DonationService {
  final CollectionReference donationsCollection =
      FirebaseFirestore.instance.collection('donations');

  Stream<List<Donation>> getAllDonationsForAllUsersAsStream() {
    return donationsCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Donation.fromMap(doc.data() as Map<String, dynamic>);
      }).toList();
    });
  }

  Stream<List<Donation>> getAllDonationsForSpecificUserAsStream(String userId) {
    final userDonationsCollection =
        donationsCollection.where('donorId', isEqualTo: userId);

    return userDonationsCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Donation.fromMap(doc.data() as Map<String, dynamic>);
      }).toList();
    });
  }

  Future<void> addDonation(Donation donation) async {
    try {
      final user = AuthManager().currentUser;
      if (user != null) {
        final donorId = user.uid;

        // Add the donation to the collection
        await donationsCollection.add({
          ...donation.toMap(),
          'donorId': donorId,
        });

        print('Donation added: ${donation.donationType}');
      }
    } catch (e) {
      print('Error adding donation: $e');
      // Handle the error as needed
    }
  }
}
