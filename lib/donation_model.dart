class Donation {
  final String id;
  final String item;
  final int quantity;
  final DateTime dateTime;
  final String? pickupAddress;

  Donation({
    required this.id,
    required this.item,
    required this.quantity,
    required this.dateTime,
    this.pickupAddress,
  });
  // tomap method
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'item': item,
      'quantity': quantity,
      'dateTime': dateTime.toIso8601String(),
      'pickupAddress': pickupAddress,
    };
  }

  //frommap method
  factory Donation.fromMap(Map<String, dynamic> map) {
    return Donation(
      id: map['id'],
      item: map['item'],
      quantity: map['quantity'],
      dateTime: DateTime.parse(map['dateTime']),
      pickupAddress: map['pickupAddress'],
    );
  }
}
