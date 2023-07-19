import 'package:donor_app/mobile_layout/donor_dashboard/previous_donations_screen.dart';
import 'package:flutter/material.dart';

import '../../models/organization_donation_model.dart';
import 'make_donation_screen.dart';
import 'mobile_donor_profile_screen.dart';
import 'mobile_main_dashboard_drawer.dart';
import 'mobile_organization_donation_details_screen.dart';
import 'my_donations_screen.dart';
import 'organization_donation_events.dart';

class MobileMainDonorDashboard extends StatefulWidget {
  @override
  _MobileMainDonorDashboardState createState() =>
      _MobileMainDonorDashboardState();
}

class _MobileMainDonorDashboardState extends State<MobileMainDonorDashboard> {
  String selectedPage = 'Your Profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          "Donations Dashboard",
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      drawer: MobileDonorDashboardDrawer(
        onItemSelected: (String item) {
          setState(() {
            selectedPage = item;
          });
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: MainContent(
          selectedPage: selectedPage,
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
          child: MobileDonorProfileScreen(),
        );
      case 'Make Donation':
        return const Padding(
          padding: EdgeInsets.all(12.0),
          child: MobileMakeDonationScreen(),
        );
      case 'My Donations':
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: MobileMyDonationsScreen(),
        );
      case 'Previous Donations':
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: MobilePreviousDonationsScreen(),
        );
      case 'Organization Events':
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: MobileOrganizationDonationEventsScreen(
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
        return MobileOrganizationDonationDetailsScreen(
          organizationDonation: widget.organizationDonation!,
        );
      default:
        return Container();
    }
  }
}
