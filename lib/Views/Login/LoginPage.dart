import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _MyWidgetState();
}

Container _topContent() {
  return Container( child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [ Image.asset('assest/arrowBack.png', height: 40, width: 40,), Center(child: Text('Sign In', style: TextStyle(fontSize: 18, color: Colors.black, letterSpacing: 0.5),),)],));
}

Column _welcomeMessage() {
  return  Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [Text('Hi, Welcome back!', style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.w600, letterSpacing: 0.4),), SizedBox(height: 5,) ,Text('we are happy to have you back', style: TextStyle(color: Colors.black54, fontSize: 14, fontWeight: FontWeight.w400),)],
    );
}

Column _inputFieldItem(String title) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [Text(title),
         SizedBox(height: 4),
        TextField(
          decoration: InputDecoration(
          ),
         ),],);
}

Container _inputFeild() {
  return Container(
    margin: EdgeInsets.only(top: 40),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _inputFieldItem('Full Name'),
         SizedBox(height: 30,),
        _inputFieldItem('Password')
      ],
    ),
  );
}

GestureDetector _signCta(BuildContext context) {
  return GestureDetector(
    onTap: () => {
      Navigator.of(context).pushNamed('/signup')
    },
    child: Container(
      height: 42,
      margin: EdgeInsets.only(top:80),
      decoration: BoxDecoration(color: Color.fromARGB(255,79, 61, 86), borderRadius: BorderRadius.circular(12)),
      child: Center(child: Text('SignIn', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),)),
    ),
  );
}

Container _mainContent(BuildContext context) {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      _topContent(),
      SizedBox(height: 40,),
      _welcomeMessage(),
      _inputFeild(),
      _signCta(context),
      SizedBox(height: 20,),
      Center(child: Text("Don't have an account?"),)
    ],
  ),
  padding: EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),);
}

class _MyWidgetState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: SafeArea(
      child: Container(child: _mainContent(context), decoration: BoxDecoration(color: Colors.white),),
    )));
  }
}