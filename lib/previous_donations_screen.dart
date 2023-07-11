import 'package:donor_app/constants.dart';
import 'package:donor_app/donor_model.dart';
import 'package:flutter/material.dart';

class PreviousDonationsScreen extends StatelessWidget {
  final List<Donor> donors;

  PreviousDonationsScreen({required this.donors});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Previous Donations'),
      ),
      body: ListView.builder(
        itemCount: donors.length,
        itemBuilder: (context, index) {
          Donor donor = donors[index];
          return ExpansionTile(
            title: Text(donor.name),
            children: donor.donations.map((donation) {
              return ListTile(
                title: Text('Donation Type: ${donation.item}'),
                subtitle: Text('Quantity: ${donation.quantity}'),
                trailing: Text('Date: ${formatDate(donation.dateTime)}'),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
