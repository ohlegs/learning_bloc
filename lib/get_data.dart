import 'dart:convert';

import 'package:http/http.dart' as http;

class GetData {
  // final data;
  // GetData(this.data);
  Future getUser() async {
    try {
      final url = Uri.https('jsonplaceholder.typicode.com', '/users');
      final response = await http.get(url);
      return jsonDecode(response.body);
    } catch (e) {
    }
  }
}
