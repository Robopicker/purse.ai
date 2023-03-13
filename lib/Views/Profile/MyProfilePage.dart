import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:purse_ai_app/Component/GenericHeader.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({super.key});

  @override
  State<MyProfilePage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyProfilePage> {
  onBackPressed() {
    Navigator.pop(context);
  }
  Widget _editButton() {
    return GestureDetector(
    onTap: () => {
      Navigator.of(context).pushNamed('/profile')
    },
    child: Container(child: Icon(Icons.edit_note, size: 30.0,),
    padding: EdgeInsets.all(5),
    decoration: BoxDecoration(
     color: Colors.white, 
    border: Border.all(color: Color.fromARGB(255, 210, 202, 202), width: 1),
    borderRadius: BorderRadius.circular(30)
    ),
    ));
  }
  Widget _title(String st) {
    return Text(st, style: TextStyle(color: Color.fromARGB(255, 209, 207, 207), fontSize: 12, fontWeight: FontWeight.w400));
  }
  Widget renderUserContent(String st, String name) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _title(st),
         SizedBox(height: 10,),
        Text(name, style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w400),),
        SizedBox(height: 4,),
        Divider(),
        SizedBox(height: 20,)
      ],
    );
  }
  Widget _mainContent() {
    return Column(
      children: [
        GenericHeader(title: 'My profile', onBackPressed: onBackPressed, trailingView: _editButton(),),
        SizedBox(height: 39,),
        Image.asset('assest/UserIcon.png', height: 100, width: 100,),
        SizedBox(height: 9,),
        renderUserContent('Full Name', 'Rashid khan'),
        renderUserContent('Email', 'Brooklin@gmail.com'),
        renderUserContent('Phone Number', '+1 2343567654'),
        renderUserContent('Address', 'RZ-P-12A, New Roshan Pura, Najafgarh, New Delhi-110043')
      ],
    );
  }
   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(child: SingleChildScrollView(child: Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: _mainContent()
        ,)),
      )),
    );
  }
}