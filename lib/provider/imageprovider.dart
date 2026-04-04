import 'package:flutter/material.dart';

import 'package:instra_clone/apis/getimage.dart';

class Imageprovider extends ChangeNotifier {
  final users = Getimage();

  bool _islodding = true;
  List<dynamic> _data = [];
  List<dynamic> get data => _data;
  bool get isloding => _islodding;
  Future<void> getImage() async {
    try {
      _data = await users.fetchImage();
    } catch (e) {
      throw 'error';
    } finally {
      _islodding = false;
    }
    notifyListeners();
  }
}
