import 'package:donor_app/services/donations_service.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../../models/donation_model.dart';
import '../../services/auth_manager.dart';

class MobileMakeDonationScreen extends StatefulWidget {
  const MobileMakeDonationScreen({Key? key}) : super(key: key);

  @override
  _MobileMakeDonationScreenState createState() =>
      _MobileMakeDonationScreenState();
}

class _MobileMakeDonationScreenState extends State<MobileMakeDonationScreen> {
  DonationType selectedDonationType = DonationType.Clothes;
  final TextEditingController additionalDetailsController =
      TextEditingController();

  @override
  void dispose() {
    additionalDetailsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Make a donation",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Donation Type',
              style: TextStyle(fontSize: 16.0, color: Colors.black),
            ),
            const SizedBox(height: 8.0),
            DropdownButton<DonationType>(
              value: selectedDonationType,
              onChanged: (DonationType? newValue) {
                setState(() {
                  selectedDonationType = newValue!;
                });
              },
              items: DonationType.values.map((DonationType donationType) {
                return DropdownMenuItem<DonationType>(
                  value: donationType,
                  child: Text(donationTypeToString(donationType)),
                );
              }).toList(),
            ),
            const SizedBox(height: 16.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Additional Details',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8.0),
                TextField(
                  controller: additionalDetailsController,
                  decoration: const InputDecoration(
                    labelText: 'Additional Details',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 48.0),
              ),
              onPressed: () {
                Donation donation = Donation(
                  id: const Uuid().v4(),
                  donorId: AuthManager().currentUser!.uid,
                  donationType: selectedDonationType,
                  donationDate: DateTime.now(),
                  additionalDetails: additionalDetailsController.text,
                );
                DonationService().addDonation(donation);
                // Display a success message
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Success'),
                      content: const Text(
                          'Donation has been confirmed successfully'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            // Reset the form
                            setState(() {
                              selectedDonationType = DonationType.Clothes;
                              additionalDetailsController.clear();
                            });
                            Navigator.of(context).pop();
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text(
                'Submit',
                style: TextStyle(fontSize: 13.0, color: Colors.deepPurple),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String donationTypeToString(DonationType donationType) {
    switch (donationType) {
      case DonationType.Clothes:
        return 'Clothes';
      case DonationType.Food:
        return 'Food';
      case DonationType.Money:
        return 'Money';
    }
  }
}
