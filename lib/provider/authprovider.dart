import 'package:flutter/material.dart';
import 'package:instra_clone/services/authservice.dart';

class Authprovider extends ChangeNotifier {
  final _auth = Authservice.instance;
  bool _isloging = false;
  bool get isLoging => _isloging;

  ///signUp
  Future<void> singUp({required String email, required String password}) async {
    await _auth.signUp(email, password);
    await _auth.isLogined(true);
    _isloging = true;
    notifyListeners();
  }

  ///signIn
  Future<bool> signIn(String password, String email1) async {
    String? pass = _auth.getpassword();
    String? email = _auth.getemail();
    if (pass == null || email == null) {
      _isloging = false;
      notifyListeners();
      return false;
    }
    if (pass == password && email == email1) {
      await _auth.isLogined(true);
      _isloging = true;
      notifyListeners();
      return true;
    }
    return false;
  }

  void checkLoging() {
    _isloging = _auth.getLogindata();
    notifyListeners();
  }

  Future<void> signOut() async {
    await _auth.logOut();
    _isloging = false;
    notifyListeners();
  }
}
