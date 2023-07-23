import 'package:donor_app/desktop_layout/main_dashboard/donation_requests_screen.dart';
import 'package:donor_app/desktop_layout/main_dashboard/donors_screen.dart';
import 'package:donor_app/desktop_layout/main_dashboard/profile.dart';
import 'package:donor_app/desktop_layout/main_dashboard/reports_page.dart';
import 'package:flutter/material.dart';
import '../main_app_bar.dart';
import 'dashboard_sidebar.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  _AdminDashboardState createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  String selectedPage = 'Donors';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(title: 'Admin Dashboard'),
      body: Center(
        child: Row(
          children: [
            AdminDashboardSidebar(
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
  final String selectedPage;

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
          child: UserProfileScreen(),
        );
      case 'Donors':
        return const Padding(
          padding: EdgeInsets.all(12.0),
          child: DonationsScreen(),
        );
      case 'Donation Requests':
        return const Padding(
          padding: EdgeInsets.all(12.0),
          child: DonationRequestsScreen(),
        );
      case 'Reports':
        return ReportsPage();
      default:
        return Container();
    }
  }
}
