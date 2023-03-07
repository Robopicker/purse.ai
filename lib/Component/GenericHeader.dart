import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class GenericHeader extends StatelessWidget {
  final String title;
  final Function onBackPressed;
  const GenericHeader({super.key, required this.title, required this.onBackPressed});

  @override
  Widget build(BuildContext context) {
      return Container(
        child: Row(mainAxisAlignment: MainAxisAlignment.start, 
      children: [ GestureDetector(onTap: () => {this.onBackPressed()},
      child: Image.asset('assest/arrowBack.png', height: 40, width: 40,)),
      Expanded(child: Center( child: Text(title, style: TextStyle(fontSize: 18, color: Colors.black, letterSpacing: 0.5),)))],));
  }
}