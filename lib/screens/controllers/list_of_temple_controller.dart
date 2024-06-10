import 'dart:convert';

import 'package:http/http.dart' as http;

Future fetchData() async {
  final response =
      await http.get(Uri.parse('http://localhost:4000/imagesGetAll'));
  if (response.statusCode == 200) {
    // If the server returns a 200 OK response, parse the JSON
    return jsonDecode(response.body);
  } else {
    // If the server returns an error response, throw an exception
    throw Exception('Failed to load data');
  }
}
