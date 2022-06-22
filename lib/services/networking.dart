import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHandler {
  Future<dynamic> fetch(String authority, String unencodedPath, [Map<String, dynamic> queryParameters]) async {
    try {
      Uri url = Uri.https(authority, unencodedPath, queryParameters);
      http.Response response = await http.get(url);

      if (response.statusCode == 200) {
        String data = response.body;
        return jsonDecode(data);
      }
    } catch (e) {
      return;
    }
  }
}
