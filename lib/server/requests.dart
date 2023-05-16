import 'dart:convert';

import 'package:http/http.dart' as http;

class Request {


  Future<dynamic> get(String url) async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> post(String url, dynamic data) async {
    print(data.mobileNo);
    try {
      final response = await http.post( Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data.mobileNo),
      );
      print(response.statusCode);
      if (response.statusCode == 201) {
        return response;
      } else {
        throw Exception('Failed to post data');
      }
    } catch (e) {
      print(e);
    }
  }

  Request();
}
