import 'dart:math';

import 'package:flutter/material.dart';

import '../../models/organization_donation_model.dart';
import '../../test_datas.dart';

class MobileOrganizationDonationEventsScreen extends StatefulWidget {
  final Function(String) onItemSelected;
  final Function(OrganizationDonation) organizationDonation;

  MobileOrganizationDonationEventsScreen({
    Key? key,
    required this.onItemSelected,
    required this.organizationDonation,
  }) : super(key: key);

  @override
  State<MobileOrganizationDonationEventsScreen> createState() =>
      _MobileOrganizationDonationEventsScreenState();
}

class _MobileOrganizationDonationEventsScreenState
    extends State<MobileOrganizationDonationEventsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns in the grid
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
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Image.network(
                      donation.images[
                      Random().nextInt(donation.images.length)],
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          donation.date,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          '${donation.location}, ${donation.time}',
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
