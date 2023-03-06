import 'package:flutter/material.dart';
import 'package:purse_ai_app/Views/Login/LoginPage.dart';
import 'package:purse_ai_app/Views/Login/SignupPage.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final params = settings.arguments;
    switch (settings.name) {
      case '/login':
        return MaterialPageRoute(builder: ((context) => LoginPage()));
      case '/signup':
        return MaterialPageRoute(builder: ((context) => SignupPage()));  
      default:
        return MaterialPageRoute(builder: ((context) => LoginPage()));
    }
  }
}