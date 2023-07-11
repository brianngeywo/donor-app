// Static test data
import 'package:donor_app/donation_model.dart';
import 'package:donor_app/donor_model.dart';
import 'package:donor_app/organization_donation_model.dart';

List<Donor> testDonors = [
  Donor(
    id: '1',
    name: 'John Baraka',
    donations: [
      Donation(id: '1', item: 'Food', quantity: 5, dateTime: DateTime.now()),
      Donation(id: '2', item: 'Money', quantity: 100, dateTime: DateTime.now()),
    ],
    email: '',
    password: "",
    phone: '',
    address: '',
  ),
  Donor(
    id: '2',
    name: 'Tabitha Mutai',
    donations: [
      Donation(
          id: '3', item: 'Clothes', quantity: 10, dateTime: DateTime.now()),
      Donation(id: '4', item: 'Food', quantity: 3, dateTime: DateTime.now()),
    ],
    email: '',
    password: "",
    phone: '',
    address: '',
  ),
  Donor(
    id: '3',
    name: 'Yvonne Johnson',
    donations: [
      Donation(id: '5', item: 'Money', quantity: 50, dateTime: DateTime.now()),
    ],
    email: '',
    password: "",
    phone: '',
    address: '',
  ),
];

enum DonationType { food, clothes, money }

final List<OrganizationDonation> organizationDonations = [
  OrganizationDonation(
    images: [
      'https://images.pexels.com/photos/9826015/pexels-photo-9826015.jpeg?auto=compress&cs=tinysrgb&w=600',
      'https://images.pexels.com/photos/6646907/pexels-photo-6646907.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      'https://images.pexels.com/photos/6995201/pexels-photo-6995201.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    ],
    date: '2023-07-10',
    location: 'ABC Organization',
    time: '10:00 AM',
  ),
  OrganizationDonation(
    images: [
      'https://images.pexels.com/photos/9826015/pexels-photo-9826015.jpeg?auto=compress&cs=tinysrgb&w=600',
      'https://images.pexels.com/photos/6646907/pexels-photo-6646907.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      'https://images.pexels.com/photos/6995201/pexels-photo-6995201.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    ],
    date: '2023-07-08',
    location: 'XYZ Organization',
    time: '02:30 PM',
  ),
  // Add more OrganizationDonation objects as needed
];
