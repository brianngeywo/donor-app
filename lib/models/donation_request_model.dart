import 'package:cloud_firestore/cloud_firestore.dart';
import 'donation_model.dart';

class DonationRequest {
  final String id;
  final String requesterId;
  final DonationType requestType;
  final DateTime requestDate;
  final String requestMessage;
  final bool isAccepted;

  DonationRequest({
    required this.id,
    required this.requesterId,
    required this.requestType,
    required this.requestDate,
    required this.requestMessage,
    required this.isAccepted,
  });

  // ToMap method
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'requesterId': requesterId,
      'requestType': requestType.toString().split('.').last,
      'requestDate': Timestamp.fromDate(requestDate),
      'requestMessage': requestMessage,
      'isAccepted': isAccepted,
    };
  }

  // FromMap method
  factory DonationRequest.fromMap(Map<String, dynamic> map) {
    return DonationRequest(
      id: map['id'],
      requesterId: map['requesterId'],
      requestType: DonationType.values.firstWhere(
          (type) => type.toString() == 'DonationType.${map['requestType']}'),
      requestDate: (map['requestDate'] as Timestamp).toDate(),
      requestMessage: map['requestMessage'],
      isAccepted: map['isAccepted'],
    );
  }
}
