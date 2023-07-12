import 'dart:math';

import 'package:donor_app/organization_donation_model.dart';
import 'package:flutter/material.dart';

import 'dashboard_sidebar.dart';
import 'main_app_bar.dart';

class OrganizationDonationDetailsScreen extends StatefulWidget {
  final OrganizationDonation organizationDonation;

  const OrganizationDonationDetailsScreen({
    Key? key,
    required this.organizationDonation,
  }) : super(key: key);

  @override
  State<OrganizationDonationDetailsScreen> createState() =>
      _OrganizationDonationDetailsScreenState();
}

class _OrganizationDonationDetailsScreenState
    extends State<OrganizationDonationDetailsScreen> {
  String selectedPage = 'view event';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(title: 'Event Details'),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DashboardSidebar(
            onItemSelected: (String item) {
              setState(() {
                selectedPage = item;
              });
            },
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 300, // Adjust the height as needed
                    child: Image.network(
                      width: double.infinity,
                      widget.organizationDonation.images[Random()
                          .nextInt(widget.organizationDonation.images.length)],
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'Event Purpose:',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    widget.organizationDonation.eventPurpose,
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    'Event Theme:',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    widget.organizationDonation.eventTheme,
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    'Date:',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    widget.organizationDonation.date,
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    'Location:',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    widget.organizationDonation.location,
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    'Time:',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    widget.organizationDonation.time,
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    'Sponsorships and Partnerships:',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    widget.organizationDonation.sponsorshipsAndPartnerships,
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    'Volunteer Coordination:',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    widget.organizationDonation.volunteerCoordination,
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    'Publicity and Promotions:',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    widget.organizationDonation.publicityAndPromotions,
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    'Fundraising Activities:',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    widget.organizationDonation.fundraisingActivities,
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    'Event Program:',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    widget.organizationDonation.eventProgram,
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'Event Description:',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    widget.organizationDonation.eventDescription,
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'Event Images:',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: widget.organizationDonation.images
                        .map(
                          (image) => SizedBox(
                            width: 200.0, // Adjust the width as needed
                            height: 200.0, // Adjust the height as needed
                            child: Image.network(
                              image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
