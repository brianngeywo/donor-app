import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:donor_app/desktop_layout/main_dashboard/report_preview_widget.dart';
import 'package:flutter/material.dart';

import '../../services/reports_service.dart';
import '../main_app_bar.dart';
import '../../mobile_layout/donor_dashboard/download_report_tile.dart';
import '../../models/donation_model.dart';
import '../../models/donation_request_model.dart';

class ReportsPage extends StatefulWidget {
  const ReportsPage({super.key});

  @override
  State<ReportsPage> createState() => _ReportsPageState();
}

class _ReportsPageState extends State<ReportsPage> {
  List<Donation> donationList = [];
  List<DonationRequest> donationRequestList = [];

  // Fetch donations
  Future<void> fetchDonations() async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance.collection('donations').get();
      if (snapshot.docs.isNotEmpty) {
        for (QueryDocumentSnapshot<Map<String, dynamic>> doc in snapshot.docs) {
          Donation donation = Donation.fromMap(doc.data());
          setState(() {
            donationList.add(donation);
          });
        }
      }
    } catch (e) {
      print('Error fetching donation data: $e');
    }
  }

  // Fetch donation requests
  Future<void> fetchDonationRequests() async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance.collection('donationRequests').get();
      if (snapshot.docs.isNotEmpty) {
        for (QueryDocumentSnapshot<Map<String, dynamic>> doc in snapshot.docs) {
          DonationRequest request = DonationRequest.fromMap(doc.data());
          setState(() {
            donationRequestList.add(request);
          });
        }
      }
    } catch (e) {
      print('Error fetching donation request data: $e');
    }
  }

  @override
  void initState() {
    fetchDonations(); // Add this line to fetch donations
    fetchDonationRequests(); // Add this line to fetch donation requests
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(title: 'Reports'),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        color: Colors.grey[200],
        child: GridView.count(
          crossAxisCount: 3,
          children: [
            DownloadReportTile(
              title: "Donors Report",
              downloadExcel: () {
                showDonationsPreviewDialog(false, donationList);
              },
              downloadPdf: () {
                showDonationsPreviewDialog(true, donationList);
              },
            ),
            DownloadReportTile(
              title: "Donation Requests Report",
              downloadExcel: () {
                showDonationRequestsPreviewDialog(false, donationRequestList);
              },
              downloadPdf: () {
                showDonationRequestsPreviewDialog(true, donationRequestList);
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> showDonationRequestsPreviewDialog(bool isPDFReport, List<DonationRequest> donationRequestList) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Donation Requests Report'),
          content: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.6,
            child: DonationRequestsPreviewWidget(donationRequestList: donationRequestList),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
            ElevatedButton(
              onPressed: () async {
                if (isPDFReport) {
                  await ReportService().generateDonationRequestsPDFReport(donationRequestList: donationRequestList);
                } else {
                  await ReportService().generateDonationRequestsCSVReport(donationRequestList: donationRequestList);
                }
                // await openFile(reportFile.path);
              },
              child: const Text('Download'),
            ),
          ],
        );
      },
    );
  }

  Future<void> showDonationsPreviewDialog(bool isPDFReport, List<Donation> donationList) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Donations Report'),
          content: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.6,
            child: DonationsPreviewWidget(donationList: donationList),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
            ElevatedButton(
              onPressed: () async {
                if (isPDFReport) {
                  await ReportService().generateDonationsPDFReport(donationList: donationList);
                } else {
                  await ReportService().generateDonationsCSVReport(donationList: donationList);
                }
                // await openFile(reportFile.path);
              },
              child: const Text('Download'),
            ),
          ],
        );
      },
    );
  }
}
