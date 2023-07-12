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

  // toMap method
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'donorId': donorId,
      'donationType': donationType.toString().split('.').last,
      'donationDate': donationDate.toUtc().toIso8601String(),
      'additionalDetails': additionalDetails,
    };
  }

  // fromMap method
  factory Donation.fromMap(Map<String, dynamic> map) {
    return Donation(
      id: map['id'],
      donorId: map['donorId'],
      donationType: _parseDonationType(map['donationType']),
      donationDate: DateTime.parse(map['donationDate']).toLocal(),
      additionalDetails: map['additionalDetails'],
    );
  }

  static DonationType _parseDonationType(String value) {
    return DonationType.values.firstWhere(
      (type) => type.toString() == 'DonationType.$value',
      orElse: () => DonationType
          .Clothes, // Set a default value or handle the case when the value is not found
    );
  }
}

enum DonationType {
  Clothes,
  Food,
  Money,
}
