import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:donor_app/donation_model.dart';

class DonationService {
  final CollectionReference donorsCollection =
      FirebaseFirestore.instance.collection('donors');

  // Create a new donation for a specific donor
  Future<void> createDonationForDonor(
      {required String donorId, required Donation donation}) {
    return donorsCollection
        .doc(donorId)
        .collection('donations')
        .doc(donation.id)
        .set(donation.toMap());
  }

  // Update an existing donation for a specific donor
  Future<void> updateDonationForDonor(
      {required String donorId, required Donation donation}) {
    return donorsCollection
        .doc(donorId)
        .collection('donations')
        .doc(donation.id)
        .update(donation.toMap());
  }

  // Delete a donation for a specific donor
  Future<void> deleteDonationForDonor(
      {required String donorId, required String donationId}) {
    return donorsCollection
        .doc(donorId)
        .collection('donations')
        .doc(donationId)
        .delete();
  }

  // Fetch all donations for a specific donor
  Stream<List<Donation>> fetchAllDonationsForDonor({required String donorId}) {
    return donorsCollection
        .doc(donorId)
        .collection('donations')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Donation.fromMap(doc.data())).toList();
    });
  }

  // Fetch a specific donation for a specific donor by ID
  Future<Donation?> fetchDonationForDonorById(
      String donorId, String donationId) async {
    DocumentSnapshot snapshot = await donorsCollection
        .doc(donorId)
        .collection('donations')
        .doc(donationId)
        .get();

    if (snapshot.exists) {
      return Donation.fromMap(snapshot.data() as Map<String, dynamic>);
    } else {
      return null;
    }
  }

  Stream<List<Donation>> getAllDonationsAsStream() {
    return donorsCollection.snapshots().asyncMap((snapshot) async {
      List<Donation> allDonations = [];

      for (var donorDoc in snapshot.docs) {
        var donationDocs =
            await donorDoc.reference.collection('donations').get();
        var donations = donationDocs.docs
            .map((doc) => Donation.fromMap(doc.data() as Map<String, dynamic>))
            .toList();
        allDonations.addAll(donations);
      }

      return allDonations;
    });
  }
}
