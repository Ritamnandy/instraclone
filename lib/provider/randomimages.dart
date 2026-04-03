import 'package:flutter/material.dart';
import 'package:instra_clone/apis/fetchimages.dart';

class Randomimages extends ChangeNotifier {
  final image = Fetchimages();
  bool _islodding = true;
  List<dynamic> _data = [];
  List<dynamic> get data => _data;
  bool get isloding => _islodding;
  Future<void> getImages() async {
    try {
      _data = await image.fetchImages();
    } catch (e) {
      throw 'error';
    } finally {
      _islodding = false;
    }
    notifyListeners();
  }
}
