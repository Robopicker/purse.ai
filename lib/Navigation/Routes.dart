import 'package:flutter/material.dart';
import 'package:purse_ai_app/Api/moneypage.dart';
import 'package:purse_ai_app/Views/Login/LoginPage.dart';
import 'package:purse_ai_app/Views/Login/OtpScreen.dart';
import 'package:purse_ai_app/Views/Login/SignupPage.dart';
import 'package:purse_ai_app/Views/Profile/CreatePassword.dart';
import 'package:purse_ai_app/Views/Profile/ForgotPassword.dart';
import 'package:purse_ai_app/Views/Profile/ProfilePage.dart';
import 'package:purse_ai_app/Views/Send/SendMoneyPage.dart';
import 'package:purse_ai_app/Views/Send/SendMoneySummaryPage.dart';
import 'package:purse_ai_app/Views/Transaction/TransactionPage.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final params = settings.arguments;
    switch (settings.name) {
      case '/login':
        return MaterialPageRoute(builder: ((context) => LoginPage()));
      case '/signup':
        return MaterialPageRoute(builder: ((context) => SignupPage()));  
      case '/otp':
      return MaterialPageRoute(builder: ((context) => OtpScreen())); 
      case '/sendMoney':
      return MaterialPageRoute(builder: ((context) => SendMoney())); 
      case '/sendMoneySummary':{
        final User argu = params as User;
      return MaterialPageRoute(builder: ((context) => SendMoneySummaryPage(data: params)));
      }
      case '/transactionPage':
        return MaterialPageRoute(builder: ((context) => TransactionPage()));
      case '/profilePage':
        return MaterialPageRoute(builder: ((context) => ProfilePage())); 
      case '/forgotPassword':
        return MaterialPageRoute(builder: ((context) => ForgotPassword())); 
      case '/createPassword':
      return MaterialPageRoute(builder:  ((context) => CreatePassword()));   
      default:
        return MaterialPageRoute(builder: ((context) => LoginPage()));
    }
  }
}