import 'package:firebase_auth/firebase_auth.dart';
import '../models/user_model.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // sign up with email and password
  Future<UserModel?> signUpWithEmailAndPassword(
      String email, String password, String name, String fullName) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;
      if (user != null) {
        return UserModel(
          uid: user.uid,
          email: email,
          name: name,
          fullName: fullName,
        );
      }
    } catch (e) {
      print("Error in sign up: $e");
      return null;
    }
  }

  // sign out
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print("Error in sign out: $e");
    }
  }
}
