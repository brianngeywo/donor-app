import 'package:donor_app/organization_donation_model.dart';
import 'package:flutter/material.dart';

import 'dashboard_sidebar.dart';
import 'main_app_bar.dart';

class OrganizationDonationDetailsScreen extends StatefulWidget {
  final OrganizationDonation organizationDonation;

  const OrganizationDonationDetailsScreen(
      {super.key, required this.organizationDonation});

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
      appBar: MainAppBar(title: 'Dashboard'),
      body: Center(
        child: Row(
          children: [
            DashboardSidebar(
              onItemSelected: (String item) {
                setState(() {
                  selectedPage = item;
                });
              },
            ),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      itemCount: widget.organizationDonation.images.length,
                      itemBuilder: (BuildContext context, int index) {
                        final String image =
                            widget.organizationDonation.images[index];
                        return Image.network(
                          image,
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Text(
                          'Date: ${widget.organizationDonation.date}',
                          style: const TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          'Location: ${widget.organizationDonation.location}',
                          style: const TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          'Time: ${widget.organizationDonation.time}',
                          style: const TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
