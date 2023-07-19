import 'package:donor_app/desktop_layout/beneficiary_dashboard/pending_donations_page.dart';
import 'package:donor_app/desktop_layout/beneficiary_dashboard/request_donation.dart';
import 'package:flutter/material.dart';

import '../../models/organization_donation_model.dart';
import '../donor_dashboard/organization_donation_details_screen.dart';
import '../donor_dashboard/organization_donation_events.dart';
import '../main_app_bar.dart';
import 'approved_donation_requests.dart';
import 'beneficiary_dashboard_sidebar.dart';
import 'beneficiary_profile.dart';

class MainBeneficiaryDashboard extends StatefulWidget {
  @override
  _MainBeneficiaryDashboardState createState() =>
      _MainBeneficiaryDashboardState();
}

class _MainBeneficiaryDashboardState extends State<MainBeneficiaryDashboard> {
  String selectedPage = 'Your Profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(title: 'Beneficiary Dashboard'),
      body: Center(
        child: Row(
          children: [
            BeneficiaryDashboardSidebar(
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
      case 'view event':
        return OrganizationDonationDetailsScreen(
          organizationDonation: widget.organizationDonation!,
        );
      case 'Your Profile':
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: BeneficiaryProfileScreen(),
        );
      case 'Approved Donations':
        return const Padding(
          padding: EdgeInsets.all(12.0),
          child: ApprovedDonationsPage(),
        );
      case 'Pending Donations':
        return const Padding(
          padding: EdgeInsets.all(12.0),
          child: PendingDonationsPage(),
        );
      case 'Request Donation':
        return const Padding(
          padding: EdgeInsets.all(12.0),
          child: DonationRequestPage(),
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

      default:
        return Container();
    }
  }
}