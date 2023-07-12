import 'package:donor_app/beneficiary_dashboard/beneficiary_profile.dart';
import 'package:donor_app/beneficiary_dashboard/request_donation.dart';

import '../donor_dashboard/organization_donation_details_screen.dart';
import '../donor_dashboard/organization_donation_model.dart';
import '../main_app_bar.dart';
import 'approved_donation_requests.dart';
import 'beneficiary_dashboard_sidebar.dart';
import 'package:donor_app/donor_dashboard/previous_donations_screen.dart';
import 'package:donor_app/donor_dashboard/organization_donation_events.dart';
import 'package:donor_app/test_datas.dart';
import 'package:flutter/material.dart';

import 'beneficiary_history.dart';

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
      case 'Your Profile':
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: BeneficiaryProfileScreen(),
        );
      case 'Recipient History':
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: MyBeneficiaryDonationsScreen(),
        );
      case 'Approved Donations':
        return Padding(
          padding: EdgeInsets.all(12.0),
          child: ApprovedDonationsPage(
            approvedDonations: testDonationRequests,
          ),
        );
      case 'Request Donation':
        return Padding(
          padding: EdgeInsets.all(12.0),
          child: DonationRequestPage(),
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

      default:
        return Container();
    }
  }
}
