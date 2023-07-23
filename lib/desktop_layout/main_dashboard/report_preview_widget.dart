import 'package:flutter/material.dart';

import '../../models/donation_model.dart';
import '../../models/donation_request_model.dart';

class DonationsPreviewWidget extends StatelessWidget {
  final List<Donation> donationList;

  const DonationsPreviewWidget({Key? key, required this.donationList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: donationList.length,
        itemBuilder: (context, index) {
          Donation donation = donationList[index];
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 5),
                Text("Donation ID: ${donation.id}"),
                Divider(),
                const SizedBox(height: 10),
                Text("Donor ID: ${donation.donorId}"),
                const SizedBox(height: 5),
                Text("Donation Type: ${donation.donationType.toString().split('.').last}"),
                const SizedBox(height: 5),
                Text("Donation Date: ${donation.donationDate.toLocal().toString()}"),
                const SizedBox(height: 5),
                Text("Additional Details: ${donation.additionalDetails}"),
              ],
            ),
          );
        },
      ),
    );
  }
}

class DonationRequestsPreviewWidget extends StatelessWidget {
  final List<DonationRequest> donationRequestList;

  const DonationRequestsPreviewWidget({Key? key, required this.donationRequestList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: donationRequestList.length,
        itemBuilder: (context, index) {
          DonationRequest donationRequest = donationRequestList[index];
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 5),
                Text("Donation Request ID: ${donationRequest.id}"),
                Divider(),
                const SizedBox(height: 10),
                Text("Requester ID: ${donationRequest.requesterId}"),
                const SizedBox(height: 5),
                Text("Request Type: ${donationRequest.requestType.toString().split('.').last}"),
                const SizedBox(height: 5),
                Text("Request Date: ${donationRequest.requestDate.toLocal().toString()}"),
                const SizedBox(height: 5),
                Text("Request Message: ${donationRequest.requestMessage}"),
                const SizedBox(height: 5),
                Text("Is Accepted: ${donationRequest.isAccepted ? 'Yes' : 'No'}"),
              ],
            ),
          );
        },
      ),
    );
  }
}
