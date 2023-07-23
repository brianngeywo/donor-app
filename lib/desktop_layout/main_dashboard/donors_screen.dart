import 'package:donor_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/donation_model.dart';
import '../../models/user_model.dart';
import 'dashboard_tile.dart';

class DonationsScreen extends StatefulWidget {
  const DonationsScreen({Key? key}) : super(key: key);

  @override
  _DonationsScreenState createState() => _DonationsScreenState();
}

class _DonationsScreenState extends State<DonationsScreen> {
  late Stream<List<Donation>> _donationsStream;

  @override
  void initState() {
    super.initState();
    // Initialize the stream to fetch donations
    _donationsStream = fetchDonationsStream();
  }

  Stream<List<Donation>> fetchDonationsStream() {
    final CollectionReference donationsCollection = FirebaseFirestore.instance.collection('donations');

    return donationsCollection.snapshots().map((snapshot) {
      List<Donation> donations = [];
      for (var document in snapshot.docs) {
        donations.add(Donation.fromMap(document.data() as Map<String, dynamic>));
      }
      return donations;
    });
  }

  // Method to fetch the user information based on donor ID
  Future<UserModel?> fetchUserById(String donorId) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance.collection('users').doc(donorId).get();
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
        title: const Text('Donations'),
      ),
      body: StreamBuilder<List<Donation>>(
        stream: _donationsStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator()); // Show spinning widget while loading
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (snapshot.hasData && snapshot.data != null) {
            List<Donation> donations = snapshot.data!;
            return DataTable(
              columns: [
                DataColumn(label: Text('Donor')),
                DataColumn(label: Text('Donation Type')),
                DataColumn(label: Text('Donation Date')),
              ],
              rows: donations.map((donation) {
                return DataRow(cells: [
                  DataCell(FutureBuilder<UserModel?>(
                    future: fetchUserById(donation.donorId),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasData && snapshot.data != null) {
                        UserModel? user = snapshot.data;
                        return Text(user!.name);
                      } else {
                        return const Text('Unknown Donor');
                      }
                    },
                  )),
                  DataCell(Text(donation.donationType.name)),
                  DataCell(Text(formatDateAndTime(donation.donationDate))),
                ]);
              }).toList(),
            );
          } else {
            return const Center(child: Text('No donations available.'));
          }
        },
      ),
    );
  }
}
