import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../models/donation_model.dart';
import '../../services/donations_service.dart';

class MobilePreviousDonationsScreen extends StatelessWidget {
  final DonationService donationService = DonationService();

  MobilePreviousDonationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const Text(
            'Donations history',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
          ),
          const SizedBox(height: 16),
          StreamBuilder<List<Donation>>(
            stream: DonationService().getAllDonationsForAllUsersAsStream(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // Show a loading indicator while waiting for data
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                // Show an error message if there was an error
                return Text('Error: ${snapshot.error}');
              } else if (snapshot.hasData) {
                List<Donation> allDonations = snapshot.data!;
                Map<String, List<Donation>> donationsByDate =
                    groupDonationsByDate(allDonations);

                return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
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
              } else {
                // No data available
                return const Center(child: Text('No donation history found.'));
              }
            },
          ),
        ],
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
