import 'package:flutter/material.dart';

import '../../models/donation_model.dart';
import '../../services/donations_service.dart';t';
import 'constants.dart';

class PreviousDonationsScreen extends StatelessWidget {
  final DonationService donationService = DonationService();

  PreviousDonationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Previous Donations'),
      ),
      body: StreamBuilder<List<Donation>>(
        stream: DonationService().getAllDonationsForAllUsersAsStream(),
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
                      title: Text(
                          'Donation Type: ${donation.donationType.toString().split('.').last}'),
                      subtitle: Text(
                          'Date sent: ${formatDateAndTime(donation.donationDate)}'),
                    );
                  }).toList(),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return const Center(child: CircularProgressIndicator());
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