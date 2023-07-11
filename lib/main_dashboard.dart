import 'package:donor_app/default_screen.dart';
import 'package:donor_app/make_donation_screen.dart';
import 'package:donor_app/organization_donation_events.dart';
import 'package:donor_app/previous_donations_screen.dart';
import 'package:donor_app/test_datas.dart';
import 'package:flutter/material.dart';

import 'dashboard_sidebar.dart';
import 'main_app_bar.dart';
import 'my_donations_screen.dart';
import 'organization_donation_details_screen.dart';
import 'organization_donation_model.dart';

class MainDashboard extends StatefulWidget {
  @override
  _MainDashboardState createState() => _MainDashboardState();
}

class _MainDashboardState extends State<MainDashboard> {
  String selectedPage = 'Make Donation';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(title: 'Donations Dashboard'),
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
              child: MainContent(selectedPage: selectedPage),
            ),
          ],
        ),
      ),
    );
  }
}

class MainContent extends StatefulWidget {
  String selectedPage;
  OrganizationDonation? organizationDonation;

  MainContent({required this.selectedPage});

  @override
  State<MainContent> createState() => _MainContentState();
}

class _MainContentState extends State<MainContent> {
  @override
  Widget build(BuildContext context) {
    switch (widget.selectedPage) {
      case 'Home':
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: DefaultScreen(),
        );
      case 'Make Donation':
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: MakeDonationScreen(),
        );
      case 'My Donations':
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: MyDonationsScreen(),
        );
      case 'Previous Donations':
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: PreviousDonationsScreen(),
        );
      case 'Organization Donation Events':
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: OrganizationDonationEventsScreen(
            onItemSelected: (String item) {
              setState(() {
                widget.selectedPage = item;
              });
            },
          ),
        );
      case 'view event':
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: OrganizationDonationDetailsScreen(
            organizationDonation: organizationDonations[0],
          ),
        );
      default:
        return Container();
    }
  }
}
