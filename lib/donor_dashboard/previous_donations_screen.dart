import '../services/donations_service.dart';
import 'package:flutter/material.dart';
import '../models/donation_model.dart';

import 'constants.dart';

class PreviousDonationsScreen extends StatelessWidget {
  final DonationService donationService = DonationService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Previous Donations'),
      ),
      body: StreamBuilder<List<Donation>>(
        stream: donationService.getAllDonationsAsStream(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Donation> allDonations = snapshot.data!;
            Map<String, List<Donation>> donationsByDate =
                groupDonationsByDate(allDonations);

            return ListView.builder(
              itemCount: donationsByDate.length,
              itemBuilder: (context, index) {
                String date = donationsByDate.keys.elementAt(index);
                List<Donation> donations = donationsByDate[date]!;

                return ExpansionTile(
                  initiallyExpanded: true,
                  title: Text(formatDateOnly(DateTime.parse(date))),
                  children: donations.map((donation) {
                    return ListTile(
                      title: Text('Donation Type: ${donation.donationType}'),
                      trailing: Text(
                          'Date Requested: ${formatDateAndTime(donation.donationDate)}'),
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

  Map<String, List<Donation>> groupDonationsByDate(List<Donation> donations) {
    Map<String, List<Donation>> donationsByDate = {};

    for (Donation donation in donations) {
      String date = formatDate(donation.donationDate);

      if (donationsByDate.containsKey(date)) {
        donationsByDate[date]!.add(donation);
      } else {
        donationsByDate[date] = [donation];
      }
    }

    return donationsByDate;
  }

  String formatDate(DateTime dateTime) {
    // Implement your own date formatting logic here
    return dateTime.toString();
  }

  String formatDateAndTime(DateTime dateTime) {
    // Implement your own date and time formatting logic here
    return dateTime.toString();
  }
}
