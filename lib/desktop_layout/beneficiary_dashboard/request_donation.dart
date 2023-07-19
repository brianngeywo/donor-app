import 'package:donor_app/services/auth_manager.dart';
import 'package:donor_app/services/donation_requests_service.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../../models/donation_model.dart';
import '../../models/donation_request_model.dart';

class DonationRequestPage extends StatefulWidget {
  const DonationRequestPage({super.key});

  @override
  _DonationRequestPageState createState() => _DonationRequestPageState();
}

class _DonationRequestPageState extends State<DonationRequestPage> {
  DonationType selectedDonationType = DonationType.Food;
  TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Donation Request'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Select Donation Type',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              ListTile(
                title: const Text('Food'),
                leading: Radio<DonationType>(
                  value: DonationType.Food,
                  groupValue: selectedDonationType,
                  onChanged: (DonationType? value) {
                    setState(() {
                      selectedDonationType = value!;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('Clothes'),
                leading: Radio<DonationType>(
                  value: DonationType.Clothes,
                  groupValue: selectedDonationType,
                  onChanged: (DonationType? value) {
                    setState(() {
                      selectedDonationType = value!;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('Money'),
                leading: Radio<DonationType>(
                  value: DonationType.Money,
                  groupValue: selectedDonationType,
                  onChanged: (DonationType? value) {
                    setState(() {
                      selectedDonationType = value!;
                    });
                  },
                ),
              ),
              const SizedBox(height: 24),
              TextField(
                controller: _messageController,
                decoration: const InputDecoration(
                  labelText: 'Additional Message',
                ),
                onChanged: (value) {
                  setState(() {
                    _messageController.text = value;
                  });
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  final DonationType donationType = selectedDonationType;
                  final DateTime requestDate = DateTime.now();

                  DonationRequest donationRequest = DonationRequest(
                    id: Uuid().v4(),
                    requesterId: AuthManager().currentUser!.uid,
                    requestType: donationType,
                    requestDate: requestDate,
                    requestMessage: _messageController.text,
                    isAccepted: false,
                  );

                  // Perform further actions with the donationRequest
                  DonationRequestService()
                      .createDonationRequest(donationRequest);

                  // Display a success message or navigate to another page
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Request Sent'),
                        content:
                            const Text('Your donation request has been sent.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              // Reset the form
                              setState(() {
                                selectedDonationType = DonationType.Food;
                                _messageController.text = '';
                              });
                              Navigator.pop(context);
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const Text('Request Donation'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}