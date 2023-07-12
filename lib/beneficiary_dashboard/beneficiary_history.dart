import 'package:donor_app/donor_dashboard/constants.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/donation_model.dart';

class MyBeneficiaryDonationsScreen extends StatelessWidget {
  final CollectionReference donationsCollection = FirebaseFirestore.instance
      .collection("users")
      .doc("lm3jdbzl1Ub7Neq4LuEUeMfy6cY2")
      .collection('donations');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Beneficiary Donations'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: donationsCollection.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<DocumentSnapshot> donationDocs = snapshot.data!.docs;
            Map<String, List<Donation>> donationsByDate =
                groupBeneficiaryDonationsByDate(donationDocs);

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
                      title: Text('Donation Type: ${donation.donationType}'),
                      subtitle: Text(
                          'Date: ${formatDateAndTime(donation.donationDate)}'),
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

  Map<String, List<Donation>> groupBeneficiaryDonationsByDate(
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
