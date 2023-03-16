import 'package:flutter/material.dart';
import 'package:purse_ai_app/Utils/GenericBottomBar.dart';
import 'package:purse_ai_app/Views/Login/HomePage/HomePageWidgets/Cards.dart';
import 'package:purse_ai_app/Views/Login/HomePage/HomePageWidgets/ExploreCategories.dart';
import 'package:purse_ai_app/Views/Login/HomePage/HomePageWidgets/Header.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: const [Header(), Cards(), ExploreCategories()],
            ),
          ),
        ),
        bottomNavigationBar: const GenericBottomBar());
  }
}
