import 'package:donor_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/donation_model.dart';
import '../../models/user_model.dart';
import '../../models/donation_request_model.dart';
import 'dashboard_tile.dart';

class DonationRequestsScreen extends StatefulWidget {
  const DonationRequestsScreen({Key? key}) : super(key: key);

  @override
  _DonationRequestsScreenState createState() => _DonationRequestsScreenState();
}

class _DonationRequestsScreenState extends State<DonationRequestsScreen> {
  late Stream<List<DonationRequest>> _donationRequestsStream;

  @override
  void initState() {
    super.initState();
    // Initialize the stream to fetch donation requests
    _donationRequestsStream = fetchDonationRequestsStream();
  }

  Stream<List<DonationRequest>> fetchDonationRequestsStream() {
    final CollectionReference donationRequestsCollection = FirebaseFirestore.instance.collection('donationRequests');

    return donationRequestsCollection.snapshots().map((snapshot) {
      List<DonationRequest> donationRequests = [];
      for (var document in snapshot.docs) {
        donationRequests.add(DonationRequest.fromMap(document.data() as Map<String, dynamic>));
      }
      return donationRequests;
    });
  }

  // Method to fetch the user information based on requester ID
  Future<UserModel?> fetchUserById(String requesterId) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance.collection('users').doc(requesterId).get();
      if (snapshot.exists) {
        return UserModel.fromMap(snapshot.data()!);
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Donation Requests'),
      ),
      body: StreamBuilder<List<DonationRequest>>(
        stream: _donationRequestsStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator()); // Show spinning widget while loading
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (snapshot.hasData && snapshot.data != null) {
            List<DonationRequest> donationRequests = snapshot.data!;
            return DataTable(
              columns: [
                DataColumn(label: Text('Requester')),
                DataColumn(label: Text('Request Type')),
                DataColumn(label: Text('Request Date')),
                DataColumn(label: Text('Status')),
              ],
              rows: donationRequests.map((donationRequest) {
                return DataRow(cells: [
                  DataCell(FutureBuilder<UserModel?>(
                    future: fetchUserById(donationRequest.requesterId),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasData && snapshot.data != null) {
                        UserModel? user = snapshot.data;
                        return Text(user!.name);
                      } else {
                        return const Text('Unknown Requester');
                      }
                    },
                  )),
                  DataCell(Text(donationRequest.requestType.name)),
                  DataCell(Text(formatDateAndTime(donationRequest.requestDate))),
                  DataCell(Text(donationRequest.isAccepted ? 'Accepted' : 'Pending')),
                ]);
              }).toList(),
            );
          } else {
            return const Center(child: Text('No donation requests available.'));
          }
        },
      ),
    );
  }
}
