import 'package:flutter/material.dart';
import 'package:purse_ai_app/Models/user_model.dart';
import 'package:purse_ai_app/Views/AppLanding/landing_page.dart';
import 'package:purse_ai_app/Views/HomePage/home_page.dart';
import 'package:purse_ai_app/Views/Login/login_page.dart';
import 'package:purse_ai_app/Views/Login/otp_screen.dart';
import 'package:purse_ai_app/Views/Login/signup_page.dart';
import 'package:purse_ai_app/Views/Policies/legal_and_policy.dart';
import 'package:purse_ai_app/Views/Profile/create_password.dart';
import 'package:purse_ai_app/Views/Profile/forgot_password.dart';
import 'package:purse_ai_app/Views/Profile/my_profile_page.dart';
import 'package:purse_ai_app/Views/Profile/profile_page.dart';
import 'package:purse_ai_app/Views/Send/send_money_page.dart';
import 'package:purse_ai_app/Views/Send/send_money_summary_page.dart';
import 'package:purse_ai_app/Views/Transaction/transaction_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final params = settings.arguments;
    switch (settings.name) {
      case '/UserLogin':
        return MaterialPageRoute(builder: ((context) => const UserLoginPage()));
      case '/signup':
        return MaterialPageRoute(builder: ((context) => const SignupPage()));
      case '/homepage':
        return MaterialPageRoute(builder: ((context) => const HomePage()));
      case '/otp':
        return MaterialPageRoute(builder: ((context) => const OtpScreen()));
      case '/sendMoney':
        return MaterialPageRoute(builder: ((context) => const SendMoney()));
      case '/sendMoneySummary':
        {
          final User argu = params as User;
          return MaterialPageRoute(
              builder: ((context) => SendMoneySummaryPage(data: argu)));
        }
      case '/transactionPage':
        return MaterialPageRoute(
            builder: ((context) => const TransactionPage()));
      case '/profilePage':
        return MaterialPageRoute(builder: ((context) => const ProfilePage()));
      case '/forgotPassword':
        return MaterialPageRoute(
            builder: ((context) => const ForgotPassword()));
      case '/createPassword':
        return MaterialPageRoute(
            builder: ((context) => const CreatePassword()));
      case '/MyProfilePage':
        return MaterialPageRoute(builder: ((context) => const MyProfilePage()));
      case '/legalAndPolicy':
        return MaterialPageRoute(
            builder: ((context) => const LegalAndPolicy()));
      case '/landingPage':
        return MaterialPageRoute(builder: ((context) => const LandingPage()));
      default:
        return MaterialPageRoute(builder: ((context) => const UserLoginPage()));
    }
  }
}
