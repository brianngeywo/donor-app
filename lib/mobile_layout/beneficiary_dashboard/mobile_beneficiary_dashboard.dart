import 'package:flutter/material.dart';

import '../../desktop_layout/beneficiary_dashboard/request_donation.dart';
import '../../models/organization_donation_model.dart';
import '../../services/auth_service.dart';
import '../donor_dashboard/mobile_organization_donation_details_screen.dart';
import '../donor_dashboard/organization_donation_events.dart';
import 'mobile_approved_donation_requests.dart';
import 'mobile_beneficiary_profile.dart';
import 'mobile_pending_donations_page.dart';
import 'mobile_request_donation.dart';

class MobileMainBeneficiaryDashboard extends StatefulWidget {
  @override
  _MobileMainBeneficiaryDashboardState createState() =>
      _MobileMainBeneficiaryDashboardState();
}

class _MobileMainBeneficiaryDashboardState
    extends State<MobileMainBeneficiaryDashboard> {
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
          "Beneficiary Dashboard",
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      drawer: MobileBeneficiaryDashboardDrawer(
        onItemSelected: (String item) {
          setState(() {
            selectedPage = item;
          });
          Navigator.of(context).pop(); // Close the drawer
        },
        selectedPage: selectedPage,
      ),
      body: MainContent(selectedPage: selectedPage),
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
        return MobileOrganizationDonationDetailsScreen(
          organizationDonation: widget.organizationDonation!,
        );
      case 'Your Profile':
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: MobileBeneficiaryProfileScreen(),
        );
      case 'Approved Donations':
        return const Padding(
          padding: EdgeInsets.all(12.0),
          child: MobileApprovedDonationsPage(),
        );
      case 'Pending Donations':
        return const Padding(
          padding: EdgeInsets.all(12.0),
          child: MobilePendingDonationsPage(),
        );
      case 'Request Donation':
        return const Padding(
          padding: EdgeInsets.all(12.0),
          child: MobileDonationRequestPage(),
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

      default:
        return Container();
    }
  }
}

class MobileBeneficiaryDashboardDrawer extends StatefulWidget {
  final String selectedPage;
  final Function(String) onItemSelected;

  const MobileBeneficiaryDashboardDrawer({
    required this.selectedPage,
    required this.onItemSelected,
  });

  @override
  State<MobileBeneficiaryDashboardDrawer> createState() =>
      _MobileBeneficiaryDashboardDrawerState();
}

class _MobileBeneficiaryDashboardDrawerState
    extends State<MobileBeneficiaryDashboardDrawer> {
  String selectedPage = 'Your Profile';

  @override
  void initState() {
    // TODO: implement initState
    selectedPage = widget.selectedPage;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250.0,
      color: Theme.of(context).colorScheme.primary,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Text(
              'Beneficiary Dashboard',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.account_circle, color: Colors.white),
            title: const Text('Your Profile',
                style: TextStyle(color: Colors.white)),
            onTap: () {
              setState(() {
                widget.onItemSelected('Your Profile');
                selectedPage = 'Your Profile';
              });
            },
          ),
          ListTile(
            leading: const Icon(Icons.send_outlined, color: Colors.white),
            title: const Text("Request Donation",
                style: TextStyle(color: Colors.white)),
            onTap: () {
              setState(() {
                widget.onItemSelected('Request Donation');
                selectedPage = 'Request Donation';
              });
            },
          ),
          ListTile(
            leading: const Icon(Icons.check_circle, color: Colors.white),
            title: const Text('Approved Donations',
                style: TextStyle(color: Colors.white)),
            onTap: () {
              setState(() {
                widget.onItemSelected('Approved Donations');
                selectedPage = 'Approved Donations';
              });
            },
          ),
          ListTile(
            leading: const Icon(Icons.pending, color: Colors.white),
            title: const Text('Pending Donations',
                style: TextStyle(color: Colors.white)),
            onTap: () {
              setState(() {
                widget.onItemSelected('Pending Donations');
                selectedPage = 'Pending Donations';
              });
            },
          ),
          ListTile(
            leading: const Icon(Icons.event, color: Colors.white),
            title: const Text('Organization Events',
                style: TextStyle(color: Colors.white)),
            onTap: () {
              setState(() {
                widget.onItemSelected('Organization Events');
                selectedPage = 'Organization Events';
              });
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.white),
            title: const Text('Logout', style: TextStyle(color: Colors.white)),
            onTap: () {
              AuthService().signOut();
            },
          ),
          // Add any other relevant sidebar items here
        ],
      ),
    );
  }
}
