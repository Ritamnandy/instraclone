import 'package:flutter/material.dart';
import 'package:instra_clone/apis/fetchusers.dart';

class Randomuser extends ChangeNotifier {
  final users = Fetchrandomusers();

  bool _islodding = true;
  Map<String, dynamic> _data = {};
  Map<String, dynamic> get data => _data;
  bool get isloding => _islodding;
  Future<void> getUser() async {
    try {
      _data = await users.fetchUser();
    } catch (e) {
      throw 'error';
    } finally {
      _islodding = false;
    }
    notifyListeners();
  }
}
