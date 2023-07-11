import 'package:flutter/material.dart';

import 'donation_model.dart';

class DonorProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Donor Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: 50.0,
              // Add donor's profile picture here
              // You can use NetworkImage or AssetImage as per your implementation
              backgroundImage: AssetImage('assets/profile_image.png'),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'John Doe',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            const Text('john.doe@example.com'),
            const SizedBox(height: 16.0),
            const Text(
              'Donation History',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
                itemCount: 5, // Replace with actual donation history data
                itemBuilder: (BuildContext context, int index) {
                  // Replace with actual donation data
                  var donation = Donation(
                    id: '1',
                    item: 'Food',
                    quantity: 5,
                    dateTime: DateTime.now(),
                  );
                  return ListTile(
                    leading: Text(donation.item),
                    title: Text('Quantity: ${donation.quantity}'),
                    subtitle: Text('Date: ${donation.dateTime.toString()}'),
                    trailing:
                        const Text('Status'), // Replace with donation status
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
