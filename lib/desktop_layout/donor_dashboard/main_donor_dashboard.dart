import 'package:donor_app/desktop_layout/donor_dashboard/previous_donations_screen.dart';
import 'package:flutter/material.dart';

import '../../models/organization_donation_model.dart';
import '../main_app_bar.dart';
import 'dashboard_sidebar.dart';
import 'donor_profile_screen.dart';
import 'make_donation_screen.dart';
import 'my_donations_screen.dart';
import 'organization_donation_details_screen.dart';
import 'organization_donation_events.dart';

class MainDonorDashboard extends StatefulWidget {
  @override
  _MainDonorDashboardState createState() => _MainDonorDashboardState();
}

class _MainDonorDashboardState extends State<MainDonorDashboard> {
  String selectedPage = 'Your Profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(title: 'Donations Dashboard'),
      body: Center(
        child: Row(
          children: [
            DonorDashboardSidebar(
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
      case 'Your Profile':
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: DonorProfileScreen(),
        );
      case 'Make Donation':
        return const Padding(
          padding: EdgeInsets.all(12.0),
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
      case 'Organization Events':
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: OrganizationDonationEventsScreen(
            onItemSelected: (String item) {
              setState(() {
                widget.selectedPage = item;
              });
            },
            organizationDonation: (OrganizationDonation donation) {
              setState(() {
                widget.organizationDonation = donation;
              });
            },
          ),
        );
      case 'view event':
        return OrganizationDonationDetailsScreen(
          organizationDonation: widget.organizationDonation!,
        );
      default:
        return Container();
    }
  }
}