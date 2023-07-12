import '../test_datas.dart';
import 'donation_model.dart';

class DonationRequest {
  final String id;
  final String requesterId;
  final DonationType requestType;
  final DateTime requestDate;
  final String requestMessage;

  DonationRequest({
    required this.id,
    required this.requesterId,
    required this.requestType,
    required this.requestDate,
    required this.requestMessage,
  });
  //toMap method
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'requesterId': requesterId,
      'requestType': requestType,
      'requestDate': requestDate,
      'requestMessage': requestMessage,
    };
  }

  //frommap method
  factory DonationRequest.fromMap(Map<String, dynamic> map) {
    return DonationRequest(
      id: map['id'],
      requesterId: map['requesterId'],
      requestType: map['requestType'],
      requestDate: map['requestDate'],
      requestMessage: map['requestMessage'],
    );
  }
}
