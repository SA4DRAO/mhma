import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();

  // String? _displayName = "";
  // String _uid = "";
  // String _email = "";
  // String? _photoUrl = "";

  // void setDisplayName(String? displayName) {
  //   _displayName = displayName;
  // }

  // void setuid(String uid) {
  //   _uid = uid;
  // }

  // void setemail(String email) {
  //   _email = email;
  // }

  // void setphotoUrl(String? photoUrl) {
  //   _photoUrl = photoUrl;
  // }

  // String? get displayName => _displayName;
  // String get uid => _uid;
  // String get email => _email;
  // String? get photoUrl => _photoUrl;

  GoogleSignInAccount? _user;
  GoogleSignInAccount get user => _user!;

  Future googleLogin() async {
    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) return;
    final googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);

    // setDisplayName(user.displayName);
    // setemail(user.email);
    // setphotoUrl(user.photoUrl);
    // setuid(user.id);

    notifyListeners();
  }

  Future logout() async {
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
  }
}
