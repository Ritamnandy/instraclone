import 'dart:convert';

import 'package:http/http.dart' as http;

class Getimage {
  Future<Map<String, dynamic>> fetchImage() async {
    try {
      final url =
          'https://api.pexels.com/v1/search?query=nature&per_page=30&page=1';
      final uri = Uri.parse(url);
      final response = await http.get(
        uri,
        headers: {
          'Authorization':
              "tuIEpIRfhTbkT6SRvjKmhcXJxSYkr1mQyUTBu5kHMnacSX31dR5XJXid",
        },
      );
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
