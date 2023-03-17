import 'package:flutter/material.dart';
import 'package:purse_ai_app/Component/generic_button.dart';
import 'package:purse_ai_app/Component/generic_header.dart';
import 'package:purse_ai_app/Component/input_fields.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ForgotPassword> {
  onBackPressed() {
    Navigator.pop(context);
  }
  onNextClicked() {

  }
  Widget _mainContent() {
    return Column(
      children: [
        GenericHeader(title: '', onBackPressed: onBackPressed),
        const SizedBox(height: 50,),
        const Text('Forgot Password', style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w600,
          color: Colors.black
        ),),
        const SizedBox(height: 4,),
        const Text('Recover your account password', style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Color.fromRGBO(156, 164, 171, 1)
        ),),
        const SizedBox(height: 32,),
        InputFields(info: 'Email', onChanged:  () => {}),
        const SizedBox(height: 32,),
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
          child: _mainContent()
        ,)),
      )),
    );
  }
}