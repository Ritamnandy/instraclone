import 'package:flutter/material.dart';
import 'package:instra_clone/apis/fetchvideos.dart';

class Videpovider extends ChangeNotifier {
  final _video = Fetchvideos();
  bool _islodding = true;
  Map<String, dynamic> _data = {};
  Map<String, dynamic> get data => _data;
  bool get isloding => _islodding;
  Future<void> getvideo() async {
    try {
      _data = await _video.fetchVideos();
    } catch (e) {
      throw 'error';
    } finally {
      _islodding = false;
    }
    notifyListeners();
  }
}
