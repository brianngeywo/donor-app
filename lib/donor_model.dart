import 'package:donor_app/donation_model.dart';

class Donor {
  final String id;
  final String name;
  final String email;
  final String password;
  final String phone;
  final String address;
  final List<Donation> donations;

  Donor({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
    required this.address,
    required this.donations,
  });
  //tomap function
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'phone': phone,
      'address': address,
      'donations': donations,
    };
  }

  //frommap function
  factory Donor.fromMap(Map<String, dynamic> map) {
    return Donor(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      password: map['password'],
      phone: map['phone'],
      address: map['address'],
      donations: List<Donation>.from(
          map['donations']?.map((x) => Donation.fromMap(x))),
    );
  }
}
