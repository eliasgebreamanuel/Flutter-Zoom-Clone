import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreMethods {
  // this is used to create an instance to the firestpore
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // this is used to create an instance to the firebsae auth class
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Stream<QuerySnapshot<Map<String, dynamic>>>  get mettingHistory => _firestore
      .collection('users')
      .doc(_auth.currentUser!.uid)
      .collection('meetings')
      .snapshots();
  void addToMeetingHistory(String meetingName) async {
    try {
      await _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .collection('meetings')
          .add({'meetingName': meetingName, 'createdAt': DateTime.now()});
    } catch (e) {
      print(e);
    }
  }
}
