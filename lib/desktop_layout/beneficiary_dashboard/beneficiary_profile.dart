import 'package:donor_app/services/donation_requests_service.dart';
import 'package:flutter/material.dart';

import '../../models/donation_request_model.dart';
import '../../models/user_model.dart';
import '../../models/user_service.dart';
import '../../services/auth_manager.dart';
import '../../constants.dart';

class BeneficiaryProfileScreen extends StatefulWidget {
  @override
  State<BeneficiaryProfileScreen> createState() =>
      _BeneficiaryProfileScreenState();
}

class _BeneficiaryProfileScreenState extends State<BeneficiaryProfileScreen> {
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
                    child: StreamBuilder<List<DonationRequest>>(
                        stream: DonationRequestService()
                            .getAllDonationRequestsForUser(user.id),
                        builder: (context, snapshot) {
                          var donationRequests = snapshot.data ?? [];
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            // Show a loading indicator while waiting for data
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (snapshot.hasError) {
                            // Show an error message if there was an error
                            return Text('Error: ${snapshot.error}');
                          } else if (donationRequests.isNotEmpty) {
                            // Donation requests are available, display them
                            return ListView.separated(
                              separatorBuilder:
                                  (BuildContext context, int index) =>
                                      const Divider(),
                              itemCount: donationRequests.length,
                              // Replace with actual donation history data
                              itemBuilder: (BuildContext context, int index) {
                                // Replace with actual donation data
                                var donationRequest = donationRequests[index];

                                return ListTile(
                                  leading:
                                      Text(donationRequest.requestType.name),
                                  subtitle: Text(
                                      'Date: ${formatDateAndTime(donationRequest.requestDate)}'),
                                  trailing: Column(
                                    children: [
                                      const Text('Status'),
                                      Text(
                                        donationRequest.isAccepted
                                            ? 'Accepted'
                                            : 'Pending',
                                        style: TextStyle(
                                            color: donationRequest.isAccepted
                                                ? Colors.green
                                                : Colors.blue),
                                      ),
                                    ],
                                  ), // Replace with donation status
                                );
                              },
                            );
                          } else {
                            // No donation requests found
                            return const Text('No donation requests found.');
                          }
                        }),
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