import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:donor_app/auth_manager.dart';
import 'package:donor_app/test_datas.dart';
import 'package:flutter/material.dart';

import 'constants.dart';
import 'donation_model.dart';

class MakeDonationScreen extends StatefulWidget {
  @override
  _MakeDonationScreenState createState() => _MakeDonationScreenState();
}

class _MakeDonationScreenState extends State<MakeDonationScreen> {
  DonationType selectedDonationType = DonationType.food;
  bool bringToOrg = true;
  String pickupAddress = '';
  DateTime? selectedDateTime;
  String selectedDay = 'Monday';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const Text(
            'Donation Type',
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
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
          if (selectedDonationType == DonationType.money)
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Payment Method',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                Text('M-Pesa Paybill Number: 341325'),
                SizedBox(height: 8.0),
                Text('Account Number: 072516215'),
              ],
            ),
          if (selectedDonationType == DonationType.food)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Food Pickup',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8.0),
                const Text(
                  'Please indicate the day and time you will visit the organization to deliver the food.',
                ),
                const SizedBox(height: 8.0),
                Row(
                  children: [
                    const Text('Date: '),
                    TextButton(
                      onPressed: () {
                        showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2100),
                        ).then((DateTime? selectedDate) {
                          if (selectedDate != null) {
                            setState(() {
                              selectedDateTime = selectedDate;
                            });
                          }
                        });
                      },
                      child: Text(selectedDateTime != null
                          ? formatDate(selectedDateTime!)
                          : 'Select Date'),
                    ),
                  ],
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onPressed: () async {
                    Donation donation = Donation(
                      id: Random().nextInt(1000).toString(),
                      item: donationTypeToString(selectedDonationType),
                      quantity: 1,
                      dateTime: selectedDateTime ?? DateTime.now(),
                      pickupAddress: "",
                    );
                    // Additional properties specific to food donation, such as specific food item, can be added to the Donation model and assigned here.

                    // Retrieve existing list of donations from the document
                    DocumentSnapshot documentSnapshot = await donorsCollection
                        .doc(AuthManager().currentUser!.uid)
                        .get();
                    if (documentSnapshot.exists) {
                      List<Donation> existingDonations =
                          List<Donation>.from(documentSnapshot['donations']);
                      existingDonations
                          .add(donation); // Add the new donation to the list
                      await donorsCollection
                          .doc(AuthManager().currentUser!.uid)
                          .update({
                        'donations': existingDonations,
                      });
                    } else {
                      // If the document doesn't exist, create a new one with the initial donation
                      await donorsCollection
                          .doc(AuthManager().currentUser!.uid)
                          .set({
                        'donations': [donation],
                      });
                    }
                    print('Donation added: ${donation.item}');
                  },
                  child: const Text('Submit',
                      style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          if (selectedDonationType == DonationType.clothes)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Clothes Pickup',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8.0),
                Row(
                  children: [
                    Checkbox(
                      value: bringToOrg,
                      onChanged: (bool? newValue) {
                        setState(() {
                          bringToOrg = newValue!;
                        });
                      },
                    ),
                    const SizedBox(width: 8.0),
                    const Text('I will bring the clothes to the organization'),
                  ],
                ),
                const SizedBox(height: 8.0),
                if (!bringToOrg)
                  TextField(
                    decoration:
                        const InputDecoration(labelText: 'Pickup Address'),
                    onChanged: (value) {
                      setState(() {
                        pickupAddress = value;
                      });
                    },
                  ),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onPressed: () {
                    // For clothes donations
                    Donation donation = Donation(
                      id: Random().nextInt(1000).toString(),
                      item: donationTypeToString(selectedDonationType),
                      quantity: 1,
                      dateTime: DateTime.now(),
                      pickupAddress:
                          bringToOrg ? "organization address" : pickupAddress,
                    );
                    // Additional properties specific to clothes donation can be added to the Donation model and assigned here.

                    // Use the donation object as needed
                    // Use the donation object as needed
                    donorsCollection
                        .doc(AuthManager().currentUser!.uid)
                        .set(donation.toMap());
                    print('Donation added: ${donation.item}');
                  },
                  child: const Text('Submit',
                      style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
        ],
      ),
    );
  }

  String donationTypeToString(DonationType donationType) {
    switch (donationType) {
      case DonationType.food:
        return 'Food';
      case DonationType.clothes:
        return 'Clothes';
      case DonationType.money:
        return 'Money';
    }
  }
}
