import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class GenericHeader extends StatelessWidget {
  final String title;
  final Function onBackPressed;
  final Widget trailingView;
  const GenericHeader({super.key, required this.title, required this.onBackPressed, this.trailingView = const SizedBox(height: 0, width: 0,)});

  @override
  Widget build(BuildContext context) {
      return Container(
        child: Row(mainAxisAlignment: MainAxisAlignment.start, 
      children: [ GestureDetector(onTap: () => {this.onBackPressed()},
      child: Image.asset('assest/arrowBack.png', height: 40, width: 40,)),
      Expanded(child: Center( child: Text(title, style: TextStyle(fontSize: 18, color: Colors.black, letterSpacing: 0.5),))), 
      this.trailingView
      ],));
  }
}