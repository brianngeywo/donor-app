import 'package:donor_app/services/donations_service.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../models/donation_model.dart';
import '../models/user_model.dart';
import '../models/user_service.dart';
import '../services/auth_manager.dart';

class DonorProfileScreen extends StatefulWidget {
  @override
  State<DonorProfileScreen> createState() => _DonorProfileScreenState();
}

class _DonorProfileScreenState extends State<DonorProfileScreen> {
  Future<UserModel>? _userFuture;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  void _loadUserData() {
    var userId = AuthManager().currentUser!.uid;
    _userFuture = UserService().getUser(userId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder<UserModel>(
          future: _userFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // Show a loading indicator while waiting for data
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              // Show an error message if there was an error
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              // User data is available, display it
              UserModel user = snapshot.data!;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 50.0,
                    // Add donor's profile picture here
                    // You can use NetworkImage or AssetImage as per your implementation
                    backgroundImage: NetworkImage(
                        'https://images.pexels.com/photos/3460478/pexels-photo-3460478.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    user.name,
                    style: const TextStyle(
                        fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8.0),
                  Text(user.email),
                  const SizedBox(height: 16.0),
                  const Text(
                    'Donation History',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8.0),
                  Expanded(
                    child: StreamBuilder<List<Donation>>(
                      stream: DonationService()
                          .getAllDonationsForSpecificUserAsStream(user.id),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else if (!snapshot.hasData) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (snapshot.data!.isEmpty) {
                          return const Center(
                            child: Text('No donation history found.'),
                          );
                        } else {
                          // Donation history data is available, display it
                          var donations = snapshot.data!;
                          return ListView.separated(
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const Divider(),
                            itemCount: donations.length,
                            // Replace with actual donation history data
                            itemBuilder: (BuildContext context, int index) {
                              // Replace with actual donation data
                              var donation = donations[index];

                              return ListTile(
                                leading: Text(donation.donationType.name),
                                subtitle: Text(
                                    'Date: ${donation.donationDate.toString()}'),
                              );
                            },
                          );
                        }
                      },
                    ),
                  ),
                ],
              );
            } else {
              // No user data found
              return const Text('No user data found.');
            }
          },
        ),
      ),
    );
  }
}
