import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:purse_ai_app/Models/user_model.dart';

class UserProvider {
  Future<List<dynamic>> fetchUser() async {
    const url = 'https://randomuser.me/api/?results=10';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final res = json['results'] as List<dynamic>;
    final resData = res.map((e) {
      return User(
          thumbnail: e['picture']['thumbnail'],
          email: e['email'],
          name: e['name']['first'] + ' ' + e['name']['last']);
    }).toList();
    return resData;
  }
}
