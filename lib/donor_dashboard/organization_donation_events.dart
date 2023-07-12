import 'dart:math';

import 'organization_donation_details_screen.dart';
import 'package:donor_app/test_datas.dart';
import 'package:flutter/material.dart';

import 'organization_donation_model.dart';

class OrganizationDonationEventsScreen extends StatefulWidget {
  Function(String) onItemSelected;
  Function(OrganizationDonation) organizationDonation;

  OrganizationDonationEventsScreen(
      {super.key,
      required this.onItemSelected,
      required this.organizationDonation});

  @override
  State<OrganizationDonationEventsScreen> createState() =>
      _OrganizationDonationEventsScreenState();
}

class _OrganizationDonationEventsScreenState
    extends State<OrganizationDonationEventsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Previous Organization Donations'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 6, // Number of columns in the grid
          crossAxisSpacing: 10.0, // Spacing between columns
          mainAxisSpacing: 10.0, // Spacing between rows
        ),
        itemCount: organizationDonations.length,
        itemBuilder: (BuildContext context, int index) {
          final OrganizationDonation donation = organizationDonations[index];
          return GestureDetector(
            onTap: () {
              // Handle onTap event
              widget.onItemSelected("view event");
              widget.organizationDonation(donation);
            },
            child: GridTile(
              footer: GridTileBar(
                backgroundColor: Colors.black54,
                title: Text(
                  donation.date,
                  textAlign: TextAlign.center,
                ),
                subtitle: Text(
                  '${donation.location}, ${donation.time}',
                  textAlign: TextAlign.center,
                ),
              ),
              child: Image.network(
                donation.images[Random().nextInt(
                    donation.images.length)], // Display the first image
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
