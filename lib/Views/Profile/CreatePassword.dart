import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:purse_ai_app/Component/GenericButton.dart';
import 'package:purse_ai_app/Component/GenericHeader.dart';
import 'package:purse_ai_app/Component/InputFields.dart';

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
  Widget _mainContent() {
    return Column(
      children: [
        GenericHeader(title: '', onBackPressed: onBackPressed),
        SizedBox(height: 50,),
        Text('Create a ', style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w600,
          color: Colors.black
        ),),
        Text('New Password', style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w600,
          color: Colors.black
        ),),
        SizedBox(height: 4,),
        Text('Create a new password', style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Color.fromRGBO(156, 164, 171, 1)
        ),),
        SizedBox(height: 32,),
        InputFields(info: 'New Password', onChanged:  () => {}),
        SizedBox(height: 24,),
        InputFields(info: 'Confirm Password', onChanged:  () => {}),
        SizedBox(height: 20,),
        GenericButton(title: 'Next', onCallback: onNextClicked)
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