import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:donor_app/services/auth_manager.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../models/donation_model.dart';

class MobileMyDonationsScreen extends StatelessWidget {
  final userDonationsCollection = FirebaseFirestore.instance
      .collection('donations')
      .where('donorId', isEqualTo: AuthManager().currentUser!.uid);

  MobileMyDonationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const Text(
            'My Donations',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
          ),
          const SizedBox(height: 16),
          StreamBuilder<QuerySnapshot>(
            stream: userDonationsCollection.snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // Show a loading indicator while waiting for data
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                // Show an error message if there was an error
                return Text('Error: ${snapshot.error}');
              } else if (snapshot.hasData) {
                List<DocumentSnapshot> donationDocs = snapshot.data!.docs;
                Map<String, List<Donation>> donationsByDate =
                    groupDonationsByDate(donationDocs);

                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: donationsByDate.length,
                  itemBuilder: (context, index) {
                    String date = donationsByDate.keys.elementAt(index);
                    List<Donation> donationsForDate = donationsByDate[date]!;

                    return ExpansionTile(
                      initiallyExpanded: true,
                      title: Text(formatDateOnly(DateTime.parse(date))),
                      children: donationsForDate.map((donation) {
                        return ListTile(
                          title: Text(
                              'Donation Type: ${donation.donationType.toString().split('.').last}'),
                          subtitle: Text(
                              'Date Confirmed: ${formatDateAndTime(donation.donationDate)}'),
                        );
                      }).toList(),
                    );
                  },
                );
              } else {
                // No data available
                return Center(child: Text('No donation history found.'));
              }
            },
          ),
        ],
      ),
    );
  }

  Map<String, List<Donation>> groupDonationsByDate(
      List<DocumentSnapshot> donationDocs) {
    Map<String, List<Donation>> donationsByDate = {};

    for (DocumentSnapshot doc in donationDocs) {
      Donation donation = Donation.fromMap(doc.data() as Map<String, dynamic>);
      String date = formatDate(donation.donationDate);

      if (donationsByDate.containsKey(date)) {
        donationsByDate[date]!.add(donation);
      } else {
        donationsByDate[date] = [donation];
      }
    }

    return donationsByDate;
  }
}
