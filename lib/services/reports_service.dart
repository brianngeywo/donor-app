import 'dart:html' as html;

import 'package:csv/csv.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart' as pwLib;

import '../models/donation_model.dart';
import '../models/donation_request_model.dart';

class ReportService {
  Future<void> generateDonationsPDFReport({required List<Donation> donationList}) async {
    final pdf = pw.Document();

    // Add content to the PDF report
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pwLib.Container(
            child: pwLib.Column(
              children: [
                pwLib.Text('Donation Report', style: pwLib.TextStyle(fontSize: 20, fontWeight: pwLib.FontWeight.bold)),
                pwLib.SizedBox(height: 20),
                for (final donation in donationList)
                  pwLib.Container(
                    margin: const pwLib.EdgeInsets.symmetric(vertical: 10),
                    child: pwLib.Column(
                      crossAxisAlignment: pwLib.CrossAxisAlignment.start,
                      children: [
                        pwLib.Text('Donation ID: ${donation.id}'),
                        pwLib.Text('Donor ID: ${donation.donorId}'),
                        pwLib.Text('Donation Type: ${donation.donationType.toString().split('.').last}'),
                        pwLib.Text('Donation Date: ${donation.donationDate.toLocal().toString()}'),
                        pwLib.Text('Additional Details: ${donation.additionalDetails}'),
                      ],
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );

    // Save the PDF file
    final pdfBytes = await pdf.save();
    final blob = html.Blob([pdfBytes], 'application/pdf');
    final url = html.Url.createObjectUrlFromBlob(blob);
    final anchor = html.document.createElement('a') as html.AnchorElement
      ..href = url
      ..style.display = 'none'
      ..download = 'donations-report.pdf';

    html.document.body?.children.add(anchor);
    anchor.click();
    html.document.body?.children.remove(anchor);
    html.Url.revokeObjectUrl(url);
  }

  Future<void> generateDonationsCSVReport({required List<Donation> donationList}) async {
    final List<List<dynamic>> rows = [];

    // Add headers
    rows.add([
      'Donation ID',
      'Donor ID',
      'Donation Type',
      'Donation Date',
      'Additional Details',
    ]);

    // Add data rows
    for (final donation in donationList) {
      rows.add([
        donation.id,
        donation.donorId,
        donation.donationType.toString().split('.').last,
        donation.donationDate.toLocal().toString(),
        donation.additionalDetails,
      ]);
    }

    // Convert rows to CSV format
    final csvData = ListToCsvConverter().convert(rows);

    final blob = html.Blob([csvData], 'text/csv;charset=utf-8;');
    final url = html.Url.createObjectUrlFromBlob(blob);
    final anchor = html.document.createElement('a') as html.AnchorElement
      ..href = url
      ..style.display = 'none'
      ..download = 'donations-report.csv';

    html.document.body?.children.add(anchor);
    anchor.click();
    html.document.body?.children.remove(anchor);
    html.Url.revokeObjectUrl(url);
  }

  Future<void> generateDonationRequestsPDFReport({required List<DonationRequest> donationRequestList}) async {
    final pdf = pw.Document();

    // Add content to the PDF report
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pwLib.Container(
            child: pwLib.Column(
              children: [
                pwLib.Text('Donation Request Report',
                    style: pwLib.TextStyle(fontSize: 20, fontWeight: pwLib.FontWeight.bold)),
                pwLib.SizedBox(height: 20),
                for (final request in donationRequestList)
                  pwLib.Container(
                    margin: const pwLib.EdgeInsets.symmetric(vertical: 10),
                    child: pwLib.Column(
                      crossAxisAlignment: pwLib.CrossAxisAlignment.start,
                      children: [
                        pwLib.Text('Request ID: ${request.id}'),
                        pwLib.Text('Requester ID: ${request.requesterId}'),
                        pwLib.Text('Request Type: ${request.requestType.toString().split('.').last}'),
                        pwLib.Text('Request Date: ${request.requestDate.toLocal().toString()}'),
                        pwLib.Text('Request Message: ${request.requestMessage}'),
                        pwLib.Text('Is Accepted: ${request.isAccepted}'),
                      ],
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );

    // Save the PDF file
    final pdfBytes = await pdf.save();
    final blob = html.Blob([pdfBytes], 'application/pdf');
    final url = html.Url.createObjectUrlFromBlob(blob);
    final anchor = html.document.createElement('a') as html.AnchorElement
      ..href = url
      ..style.display = 'none'
      ..download = 'donation-requests-report.pdf';

    html.document.body?.children.add(anchor);
    anchor.click();
    html.document.body?.children.remove(anchor);
    html.Url.revokeObjectUrl(url);
  }

  Future<void> generateDonationRequestsCSVReport({required List<DonationRequest> donationRequestList}) async {
    final List<List<dynamic>> rows = [];

    // Add headers
    rows.add([
      'Request ID',
      'Requester ID',
      'Request Type',
      'Request Date',
      'Request Message',
      'Is Accepted',
    ]);

    // Add data rows
    for (final request in donationRequestList) {
      rows.add([
        request.id,
        request.requesterId,
        request.requestType.toString().split('.').last,
        request.requestDate.toLocal().toString(),
        request.requestMessage,
        request.isAccepted,
      ]);
    }

    // Convert rows to CSV format
    final csvData = ListToCsvConverter().convert(rows);

    final blob = html.Blob([csvData], 'text/csv;charset=utf-8;');
    final url = html.Url.createObjectUrlFromBlob(blob);
    final anchor = html.document.createElement('a') as html.AnchorElement
      ..href = url
      ..style.display = 'none'
      ..download = 'donation-requests-report.csv';

    html.document.body?.children.add(anchor);
    anchor.click();
    html.document.body?.children.remove(anchor);
    html.Url.revokeObjectUrl(url);
  }
}
