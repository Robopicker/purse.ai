import 'package:flutter/material.dart';
import 'package:purse_ai_app/Component/generic_header.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({super.key});

  @override
  State<MyProfilePage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyProfilePage> {
  onBackPressed() {
    Navigator.pop(context);
  }
  Widget editButton() {
    return GestureDetector(
    onTap: () => {
      Navigator.of(context).pushNamed('/profile')
    },
    child: Container(padding: const EdgeInsets.all(5),
    decoration: BoxDecoration(
     color: Colors.white, 
    border: Border.all(color: const Color.fromARGB(255, 210, 202, 202), width: 1),
    borderRadius: BorderRadius.circular(30)
    ),child: const Icon(Icons.edit_note, size: 30.0,),
    ));
  }
  Widget _title(String st) {
    return Text(st, style: const TextStyle(color: Color.fromARGB(255, 209, 207, 207), fontSize: 12, fontWeight: FontWeight.w400));
  }
  Widget renderUserContent(String st, String name) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _title(st),
         const SizedBox(height: 10,),
        Text(name, style: const TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w400),),
        const SizedBox(height: 4,),
        const Divider(),
        const SizedBox(height: 20,)
      ],
    );
  }
  Widget _mainContent() {
    return Column(
      children: [
        GenericHeader(title: 'My profile', onBackPressed: onBackPressed, trailingView: editButton(),),
        const SizedBox(height: 39,),
        Image.asset('assest/UserIcon.png', height: 100, width: 100,),
        const SizedBox(height: 9,),
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
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: _mainContent()
        ,)),
      )),
    );
  }
}