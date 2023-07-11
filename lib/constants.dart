import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

String formatDateAndTime(DateTime dateTime) {
  return DateFormat('MMM d, yyyy hh:mm a').format(dateTime);
}

String formatDateOnly(DateTime dateTime) {
  return DateFormat('MMM d, yyyy').format(dateTime);
}

String formatDate(DateTime dateTime) {
  String formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);
  return formattedDate;
}

// create firestore donors collecion
CollectionReference<Map<String, dynamic>> donorsCollection =
    FirebaseFirestore.instance.collection('donors');
// create firestore donations collection
CollectionReference<Map<String, dynamic>> donationsCollection =
    FirebaseFirestore.instance.collection('donations');
