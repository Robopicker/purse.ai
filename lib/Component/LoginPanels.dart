import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginPanels extends StatelessWidget {
  final String title;
  const LoginPanels({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center( child: Column(children: [Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Container(height: 1, width: 100, decoration: BoxDecoration(color: Color.fromARGB(255, 194, 192, 192), border: Border.all(width: 1)),),
    Text(' ${this.title} '),
    Container(height: 1, width: 100, decoration: BoxDecoration(color: Color.fromARGB(255, 194, 192, 192), border: Border.all(width: 1)),)
  ],),
  SizedBox(height: 20,),
  Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [Image.asset('assest/Google.png', height: 50, width: 50,), Image.asset('assest/apple.png', height: 50, width: 50,), Image.asset('assest/facebook.png', height: 50, width: 50,)],)]
    ));
  }
}