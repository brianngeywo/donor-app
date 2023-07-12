import 'package:flutter/material.dart';

import '../models/donation_request_model.dart';

class ApprovedDonationsPage extends StatelessWidget {
  final List<DonationRequest> approvedDonations;

  ApprovedDonationsPage({required this.approvedDonations});

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
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: approvedDonations.length,
                itemBuilder: (BuildContext context, int index) {
                  DonationRequest donationRequest = approvedDonations[index];
                  return ListTile(
                    title:
                        Text('Donation Type: ${donationRequest.requestType}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            'Request Message: ${donationRequest.requestMessage}'),
                        SizedBox(height: 8.0),
                        Text(
                            'Request Date: ${donationRequest.requestDate.toString()}'),
                      ],
                    ),
                    leading:
                        const Icon(Icons.check_circle, color: Colors.green),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
