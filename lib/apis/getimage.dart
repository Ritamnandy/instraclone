import 'dart:convert';

import 'package:http/http.dart' as http;

class Getimage {
  Future<List<dynamic>> fetchImage() async {
    try {
      final url =
          'https://api.unsplash.com/photos/random?query=india&count=60&client_id=EanJ_j6KjLbre60HIqeLuhBZ3ujx2ivqHvQjMtK44fA';
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
      throw 'cannot fetch error';
    }
  }
}
