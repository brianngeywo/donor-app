import 'package:donor_app/services/auth_manager.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../models/donation_request_model.dart';
import '../../services/donation_requests_service.dart';

class MobileApprovedDonationsPage extends StatelessWidget {
  const MobileApprovedDonationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Approved Donations',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: StreamBuilder<List<DonationRequest>>(
                stream: DonationRequestService()
                    .getAcceptedDonationRequestsForUser(
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
                    return const Center(
                      child: Text('No approved donations found'),
                    );
                  } else if (snapshot.hasData) {
                    // Approved donations are available, display them
                    List<DonationRequest> approvedDonations = snapshot.data!;
                    return ListView.builder(
                      itemCount: approvedDonations.length,
                      itemBuilder: (BuildContext context, int index) {
                        DonationRequest donationRequest =
                            approvedDonations[index];
                        return ListTile(
                          title: Text(
                            donationRequest.requestType.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(donationRequest.requestMessage),
                              const SizedBox(height: 8.0),
                              Text(
                                'Request Date: ${formatDateOnly(donationRequest.requestDate)}',
                              ),
                            ],
                          ),
                          leading: const Icon(
                            Icons.check_circle,
                            color: Colors.green,
                          ),
                        );
                      },
                    );
                  }
                  return const CircularProgressIndicator();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
