import 'package:donor_app/services/auth_manager.dart';
import 'package:flutter/material.dart';

import '../../models/donation_request_model.dart';
import '../../services/donation_requests_service.dart';
import '../donor_dashboard/constants.dart';

class PendingDonationsPage extends StatelessWidget {
  const PendingDonationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Pending Donations',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: StreamBuilder<List<DonationRequest>>(
                  stream: DonationRequestService()
                      .getUnacceptedDonationRequestsForUser(
                          AuthManager().currentUser!.uid),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      // Show a loading indicator while waiting for data
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      // Show an error message if there was an error
                      return Text('Error: ${snapshot.error}');
                    } else if (!snapshot.hasData) {
                      // Show a message if no data was found
                      return const Text('No approved donations found');
                    } else if (snapshot.hasData) {
                      // User data is available, display it
                      List<DonationRequest> approvedDonations = snapshot.data!;
                      return ListView.builder(
                        itemCount: approvedDonations.length,
                        itemBuilder: (BuildContext context, int index) {
                          DonationRequest donationRequest =
                              approvedDonations[index];
                          return ListTile(
                            title: Text(
                                'Donation Type: ${donationRequest.requestType.name}'),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    'Request Message: ${donationRequest.requestMessage}'),
                                SizedBox(height: 8.0),
                                Text(
                                    'Request Date: ${formatDateOnly(donationRequest.requestDate)}'),
                              ],
                            ),
                            leading: const Icon(Icons.info_outline,
                                color: Colors.blueGrey),
                          );
                        },
                      );
                    }
                    return CircularProgressIndicator();
                  }),
            ),
          ],
        ),
      ),
    );
  }
}