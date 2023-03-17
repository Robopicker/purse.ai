import 'package:flutter/material.dart';
import 'package:purse_ai_app/Component/generic_button.dart';
import 'package:purse_ai_app/Component/generic_header.dart';
import 'package:purse_ai_app/Component/input_fields.dart';

class CreatePassword extends StatefulWidget {
  const CreatePassword({super.key});

  @override
  State<CreatePassword> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<CreatePassword> {
  onBackPressed() {
    Navigator.pop(context);
  }
  onNextClicked() {

  }
  Widget mainContent() {
    return Column(
      children: [
        GenericHeader(title: '', onBackPressed: onBackPressed),
        const SizedBox(height: 50,),
        const Text('Create a ', style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w600,
          color: Colors.black
        ),),
        const Text('New Password', style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w600,
          color: Colors.black
        ),),
        const SizedBox(height: 4,),
        const Text('Create a new password', style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Color.fromRGBO(156, 164, 171, 1)
        ),),
        const SizedBox(height: 32,),
        InputFields(info: 'New Password', onChanged:  () => {}),
        const SizedBox(height: 24,),
        InputFields(info: 'Confirm Password', onChanged:  () => {}),
        const SizedBox(height: 20,),
        GenericButton(title: 'Next', onCallback: onNextClicked)
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(child: SingleChildScrollView(child: Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: mainContent()
        ,)),
      )),
    );
  }
}