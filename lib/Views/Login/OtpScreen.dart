import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:purse_ai_app/Component/GenericButton.dart';
import 'package:purse_ai_app/Component/OtpInput.dart';
import 'package:purse_ai_app/Utils/dialogUtils.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<OtpScreen> {
  onAgree() {
    Navigator.pop(context);
  }
  onDisagree() {

  }
  Widget _dialogWidget() {
    return Column(
      children: [
        Center(child: Text('I agree to the Terms of Service and Conditions of Use including consent to electronic communications and I affirm that the information provided is my own.')),
        GenericButton(title: 'agree and continue', onCallback: onCallback),
        SizedBox(height: 16,),
        TextButton(onPressed: onDisagree, child: Text('Disagree', style: TextStyle(color: Color.fromARGB(255,79, 61, 86)),))
      ],
    );
  }
  onCallback() {
    showDialogPopup(context, _dialogWidget());
  }
  onResendPressed() {
    print('resend prefd');
  }
  Widget _didNotReceiveCode() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Didn’t receive code?', style: TextStyle(fontSize: 16, letterSpacing: 0.5, color: Colors.grey, fontWeight: FontWeight.w500),),
        TextButton(onPressed: onResendPressed, child: Text('Resend Code', style: TextStyle(color: Colors.blue, fontSize: 14, fontWeight: FontWeight.w600),))
      ],
    );
  }
  Widget _mainContainer() {
    return Padding(
      padding: EdgeInsets.only(top:120, left: 30, right: 30), 
      child: Center(
          child: Column(
           children: [
            Text('ENTER OTP', style: TextStyle(color: Colors.black, fontSize: 28, fontWeight: FontWeight.w600, letterSpacing: 0.5),),
            Center(child: Text('We have just sent you 4 digit code via your email example@gmail.com', 
            style: TextStyle(color: Color.fromARGB(255, 172, 168, 168), fontSize: 14, 
            fontWeight: FontWeight.w400),)),
            SizedBox(height: 31),
            OtpInput(),
            SizedBox(height: 16,),
            GenericButton(title: 'Continue', onCallback: onCallback),
            SizedBox(height: 16,),
            _didNotReceiveCode()
            
    ],)));
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: SafeArea(child: Container(
        child: _mainContainer(),
      ),)),
    );
  }
}