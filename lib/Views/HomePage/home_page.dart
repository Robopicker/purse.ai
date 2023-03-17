import 'package:flutter/material.dart';
import 'package:purse_ai_app/Component/generic_bottom_bar.dart';
import 'package:purse_ai_app/Views/Cards/my_cards.dart';
import 'package:purse_ai_app/Views/HomePage/home_page_widgets/home_page_content.dart';
import 'package:purse_ai_app/Views/Profile/profile_page.dart';
import 'package:purse_ai_app/Views/Send/send_money_page.dart';
import 'package:purse_ai_app/Views/Transaction/transaction_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int activeIndex = 0;
  Widget renderContent() {
    if (activeIndex == 0) {
      return const HomePageContent();
    } else if (activeIndex == 1) {
      return const TransactionPage();
    } else if (activeIndex == 2) {
      return const SendMoney();
    } else if (activeIndex == 3) {
      return const MyCard();
    } else {
      return const ProfilePage();
    }
  }

  onPressed(index) {
    setState(() {
      activeIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: renderContent(),
          ),
        ),
        bottomNavigationBar: GenericBottomBar(
          onPressed: onPressed,
        ));
  }
}
