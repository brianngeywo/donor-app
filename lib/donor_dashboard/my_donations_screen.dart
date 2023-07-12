import 'package:donor_app/donor_dashboard/constants.dart';
import 'package:donor_app/services/auth_manager.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/donation_model.dart';

class MyDonationsScreen extends StatelessWidget {
  final userDonationsCollection = FirebaseFirestore.instance
      .collection('donations')
      .where('donorId', isEqualTo: AuthManager().currentUser!.uid);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Donations'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: userDonationsCollection.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<DocumentSnapshot> donationDocs = snapshot.data!.docs;
            Map<String, List<Donation>> donationsByDate =
                groupDonationsByDate(donationDocs);

            return ListView.builder(
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
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
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
