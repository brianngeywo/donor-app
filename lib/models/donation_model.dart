class Donation {
  final String id;
  final String donorId;
  final DonationType donationType;
  final DateTime donationDate;
  final String additionalDetails;

  Donation({
    required this.id,
    required this.donorId,
    required this.donationType,
    required this.donationDate,
    required this.additionalDetails,
  });
  //toMap method
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'donorId': donorId,
      'donationType': donationType,
      'donationDate': donationDate,
      'additionalDetails': additionalDetails,
    };
  }

  //fromMap method
  factory Donation.fromMap(Map<String, dynamic> map) {
    return Donation(
      id: map['id'],
      donorId: map['donorId'],
      donationType: map['donationType'],
      donationDate: map['donationDate'],
      additionalDetails: map['additionalDetails'],
    );
  }
}

enum DonationType {
  Clothes,
  Food,
  Money,
}
