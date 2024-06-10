import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createUser(String uid, String name, String fullName,
      String email, String walletNumber) async {
    try {
      await _firestore.collection('users').doc(uid).set({
        'name': name,
        'fullName': fullName,
        'email': email,
        'walletNumber': walletNumber,
      });
    } catch (e) {
      print("Error creating user: $e");
    }
  }
}
