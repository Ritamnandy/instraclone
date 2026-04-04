import 'dart:convert';

import 'package:http/http.dart' as http;

class Fetchvideos {
  Future<Map<String, dynamic>> fetchVideos() async {
    try {
      final url = 'https://api.pexels.com/videos/popular?per_page=50';
      final uri = Uri.parse(url);
      final response = await http.get(
        uri,
        headers: {
          "Authorization":
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
      throw 'error';
    }
  }
}
