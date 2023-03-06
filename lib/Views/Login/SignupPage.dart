import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SignupPage> {
  Container _topContent() {
  return Container( child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [ Image.asset('assest/arrowBack.png', height: 40, width: 40,), Text('Sign Up', style: TextStyle(fontSize: 18, color: Colors.black, letterSpacing: 0.5),)],));
}
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(child:  Container( 
          padding: EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
          child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
            children: [_topContent()],),)),
      ),
    );
  }
}