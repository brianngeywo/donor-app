import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

String formatDate(DateTime dateTime) {
  return DateFormat('MMM d, yyyy hh:mm a').format(dateTime);
}

// create firestore donors collecion
CollectionReference<Map<String, dynamic>> donorsCollection =
    FirebaseFirestore.instance.collection('donors');
// create firestore donations collection
CollectionReference<Map<String, dynamic>> donationsCollection =
    FirebaseFirestore.instance.collection('donations');
