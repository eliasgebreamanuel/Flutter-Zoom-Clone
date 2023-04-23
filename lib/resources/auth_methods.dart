import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:zoom_clone_with_flutter/utils/utils.dart';

class AuthMethods {
  // this is used to create an instance for the firebase auth
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // this is used to creatre an instance for teh firebase firestore
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // this is used to check if teh auth state changes
  Stream<User?> get authChanges => _auth.authStateChanges();
  // this is used to create a getter function to get the current user
  User get user => _auth.currentUser!;
  // this is used to signin with google
  Future<bool> signInWithGoogle(BuildContext context) async {
    bool res = false;
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // this is used to ge the credential of the user
      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      User? user = userCredential.user;
      if (user != null) {
        if (userCredential.additionalUserInfo!.isNewUser) {
          await _firestore.collection('users').doc(user.uid).set({
            'username': user.displayName,
            'uid': user.uid,
            'profilePhoto': user.photoURL
          });
        }
        res = true;
      }
    } on FirebaseAuthException catch (e) {
      // this is used to show a snack bar
      showSnackBar(context, e.message!);
      res = false;
    }
    return res;
  }

  // this is usd o sign out the user
  void signOut() async {
    try {
      _auth.signOut();
    } catch (e) {
      print(e);
      // new edited file
    }
  }
}
