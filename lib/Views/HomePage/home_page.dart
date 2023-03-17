import 'package:flutter/material.dart';
import 'package:purse_ai_app/Component/generic_bottom_bar.dart';
import 'package:purse_ai_app/Views/HomePage/home_page_widgets/cards.dart';
import 'package:purse_ai_app/Views/HomePage/home_page_widgets/explore_categories.dart';
import 'package:purse_ai_app/Views/HomePage/home_page_widgets/header.dart';
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