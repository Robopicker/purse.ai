import 'package:flutter/material.dart';
import 'package:purse_ai_app/Component/generic_text.dart';
import 'package:purse_ai_app/Utils/constants.dart';

class ExploreCategories extends StatefulWidget {
  const ExploreCategories({super.key});

  @override
  State<ExploreCategories> createState() => _ExploreCategoriesState();
}

class _ExploreCategoriesState extends State<ExploreCategories> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 23, vertical: 24),
      child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 16, crossAxisSpacing: 16),
          itemCount: categoryList.length,
          itemBuilder: (context, index) => gridItem(index: index)),
    );
  }
}

Widget gridItem({index}) {
  return Container(
    decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(20)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            width: 48,
            height: 48,
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
                color: Colors.blueGrey[100],
                borderRadius: BorderRadius.circular(12)),
            child: (Icon(categoryList[index]['categoryIcon']))),
        GenericText(
          title: categoryList[index]['title'],
          size: 16,
          lineHeight: 24,
          fontWeight: FontWeight.w600,
        ),
        GenericText(
          title: categoryList[index]['subTitle'],
          size: 12,
          lineHeight: 20,
          textColor: Colors.blueGrey.shade400,
        )
      ],
    ),
  );
}
