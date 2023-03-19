import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:purse_ai_app/Models/covid_model.dart';
import 'package:purse_ai_app/Models/user_model.dart';

class UserProvider {
  Future<List<dynamic>> fetchUser() async {
    const url = 'https://randomuser.me/api/?results=10';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    print('repsone');
    print(response);
    final body = response.body;
    final json = jsonDecode(body);
    final res = json['results'] as List<dynamic>;
    final resData = res.map((e) {
      return User(
          thumbnail: e['picture']['thumbnail'],
          email: e['email'],
          name: e['name']['first'] + ' ' + e['name']['last']);
    }).toList();
    print('result here');
    print(resData);
    return resData;
  }

  Future<CovidModel> fetchCovidList() async {
    String url = 'https://api.covid19api.com/summary';
    Uri uri = Uri.parse(url);
    try {
      final response = await http.get(uri);
      final body = response.body;
      final json = jsonDecode(body);
      return CovidModel.fromJson(json);
      // ignore: avoid_catches_without_on_clauses
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return CovidModel.withError("Data not found / Connection issue");
    }
  }
}
