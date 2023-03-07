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
  return Container( child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [ Image.asset('assest/arrowBack.png', height: 40, width: 40,), Expanded(child: Center( child: Text('Sign In', style: TextStyle(fontSize: 18, color: Colors.black, letterSpacing: 0.5),)))],));
}

Column _welcomeMessage() {
  return  Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [Text('Hi, Welcome back!', style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.w600, letterSpacing: 0.4),), SizedBox(height: 5,) ,Text('we are happy to have you back', style: TextStyle(color: Colors.black54, fontSize: 14, fontWeight: FontWeight.w400),)],
    );
}

Widget _inputFieldItem(String title) {
 return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
    Text(title),
    SizedBox(height: 8),
    Container(
      decoration: BoxDecoration(
      border: Border.all(width: 1, color: Color.fromARGB(255, 200, 199, 199)),
      borderRadius: BorderRadius.circular(12),
     ),
     padding: EdgeInsets.only(bottom: 4),
    child:
    TextField(
      cursorColor: Colors.transparent,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(10.0),
        focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),// pass the hint text parameter here
      ),
    ))],
 ));
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

Widget _renderOrView() {
  return Column(children: [Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Container(height: 1, width: 140, decoration: BoxDecoration(color: Color.fromARGB(255, 194, 192, 192), border: Border.all(width: 1)),),
    Text(' Or '),
    Container(height: 1, width: 140, decoration: BoxDecoration(color: Color.fromARGB(255, 194, 192, 192), border: Border.all(width: 1)),)
  ],),
  SizedBox(height: 20,),
  Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [Image.asset('assest/Google.png', height: 50, width: 50,), Image.asset('assest/apple.png', height: 50, width: 50,), Image.asset('assest/facebook.png', height: 50, width: 50,)],)]);
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
      Center(child: Text("Don't have an account?"),),
      SizedBox(height: 20),
      _renderOrView()
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