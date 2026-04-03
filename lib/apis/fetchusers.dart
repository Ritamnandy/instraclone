import 'dart:convert';

import 'package:http/http.dart' as http;

class Fetchrandomusers {
  Future<Map<String, dynamic>> fetchUser() async {
    try {
      final url = 'https://randomuser.me/api/?results=${70}';
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
