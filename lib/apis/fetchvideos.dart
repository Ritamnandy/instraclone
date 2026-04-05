import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;

class Fetchvideos {
  final _random = Random();
  Future<Map<String, dynamic>> fetchVideos() async {
    try {
      final page = getnumber();
      final url =
          'https://pixabay.com/api/videos/?key=55313763-86870444cf2ddd063f8cda7dc&per_page=50&page=$page';
      final uri = Uri.parse(url);
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final body = response.body;
        final json = jsonDecode(body);
        return json;
      } else {
        throw 'error';
      }
    } catch (e) {
      throw 'error';
    }
  }

  int getnumber() {
    return _random.nextInt(10) + 1;
  }
}
