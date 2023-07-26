import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/donation_request_model.dart';

class DonationRequestService {
  final CollectionReference donationRequestsCollection =
      FirebaseFirestore.instance.collection('donationRequests');

  // Create a new donation request
  Future<void> createDonationRequest(DonationRequest request) async {
    await donationRequestsCollection.doc(request.id).set(request.toMap());
  }

  // Update an existing donation request
  Future<void> updateDonationRequest(DonationRequest request) async {
    await donationRequestsCollection.doc(request.id).update(request.toMap());
  }

  // Delete a donation request
  Future<void> deleteDonationRequest(String requestId) async {
    await donationRequestsCollection.doc(requestId).delete();
  }

  // Fetch all donation requests for a specific user
  Stream<List<DonationRequest>> getAllDonationRequestsForUser(String userId) {
    return donationRequestsCollection
        .where('requesterId', isEqualTo: userId)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return DonationRequest.fromMap(doc.data() as Map<String, dynamic>);
      }).toList();
    });
  }

  // Fetch all donation requests for all users
  Stream<List<DonationRequest>> getAllDonationRequestsForAllUsers() {
    return donationRequestsCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return DonationRequest.fromMap(doc.data() as Map<String, dynamic>);
      }).toList();
    });
  }

  // Fetch all accepted donation requests for a specific user
  Stream<List<DonationRequest>> getAcceptedDonationRequestsForUser(String userId) {
    return donationRequestsCollection
        .where('requesterId', isEqualTo: userId)
        .where('isAccepted', isEqualTo: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return DonationRequest.fromMap(doc.data() as Map<String, dynamic>);
      }).toList();
    });
  }

  // Fetch all accepted donation requests for all users
  Stream<List<DonationRequest>> getAcceptedDonationRequestsForAllUsers() {
    return donationRequestsCollection
        .where('isAccepted', isEqualTo: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return DonationRequest.fromMap(doc.data() as Map<String, dynamic>);
      }).toList();
    });
  }

  // Fetch all unaccepted donation requests for a specific user
  Stream<List<DonationRequest>> getUnacceptedDonationRequestsForUser(String userId) {
    return donationRequestsCollection
        .where('requesterId', isEqualTo: userId)
        .where('isAccepted', isEqualTo: false)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return DonationRequest.fromMap(doc.data() as Map<String, dynamic>);
      }).toList();
    });
  }

  // Fetch all unaccepted donation requests for all users
  Stream<List<DonationRequest>> getUnacceptedDonationRequestsForAllUsers() {
    return donationRequestsCollection
        .where('isAccepted', isEqualTo: false)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return DonationRequest.fromMap(doc.data() as Map<String, dynamic>);
      }).toList();
    });
  }

// change isAccepted field to true
  void acceptDonationRequest(String userId) {
    donationRequestsCollection
        .where('requesterId', isEqualTo: userId)
        .get()
        .then((snapshot) {
      for (DocumentSnapshot ds in snapshot.docs) {
        ds.reference.update({'isAccepted': true});
      }
    });
  }
}
