import 'package:flutter/material.dart';
import 'package:purse_ai_app/Views/HomePage/home_page_widgets/cards.dart';
import 'package:purse_ai_app/Views/HomePage/home_page_widgets/explore_categories.dart';
import 'package:purse_ai_app/Views/HomePage/home_page_widgets/header.dart';

class HomePageContent extends StatefulWidget {
  const HomePageContent({super.key});

  @override
  State<HomePageContent> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomePageContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [Header(), Cards(), ExploreCategories()],
    );
  }
}
