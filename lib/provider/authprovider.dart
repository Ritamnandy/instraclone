import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Authprovider extends ChangeNotifier {
  final _auth = FirebaseAuth.instance;

  Future<void> singUp({required String email, required String password}) async {
    try {
      final user = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      debugPrint(user.toString());
    } catch (e) {
      debugPrint(e.toString());
    }
    notifyListeners();
  }

  Future<void> signIn(String password, String email) async {
    try {
      final user = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      debugPrint(user.toString());
    } catch (e) {
      debugPrint(e.toString());
    }
    notifyListeners();
  }
}
