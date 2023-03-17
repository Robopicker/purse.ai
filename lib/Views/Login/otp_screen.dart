import 'package:flutter/material.dart';
import 'package:purse_ai_app/Component/generic_button.dart';
import 'package:purse_ai_app/Component/otp_input.dart';
import 'package:purse_ai_app/Utils/dialog_utils.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<OtpScreen> {
  onAgree() {
    Navigator.pop(context);
  }

  onDisagree() {}
  Widget _dialogWidget() {
    return Column(
      children: [
        const Center(
            child: Text(
                'I agree to the Terms of Service and Conditions of Use including consent to electronic communications and I affirm that the information provided is my own.')),
        GenericButton(title: 'agree and continue', onCallback: onCallback),
        const SizedBox(
          height: 16,
        ),
        TextButton(
            onPressed: onDisagree,
            child: const Text(
              'Disagree',
              style: TextStyle(color: Color.fromARGB(255, 79, 61, 86)),
            ))
      ],
    );
  }

  onCallback() {
    showDialogPopup(context, _dialogWidget());
  }

  onResendPressed() {}
  Widget _didNotReceiveCode() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Didn’t receive code?',
          style: TextStyle(
              fontSize: 16,
              letterSpacing: 0.5,
              color: Colors.grey,
              fontWeight: FontWeight.w500),
        ),
        TextButton(
            onPressed: onResendPressed,
            child: const Text(
              'Resend Code',
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 14,
                  fontWeight: FontWeight.w600),
            ))
      ],
    );
  }

  Widget _mainContainer() {
    return Padding(
        padding: const EdgeInsets.only(top: 120, left: 30, right: 30),
        child: Center(
            child: Column(
          children: [
            const Text(
              'ENTER OTP',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5),
            ),
            const Center(
                child: Text(
              'We have just sent you 4 digit code via your email example@gmail.com',
              style: TextStyle(
                  color: Color.fromARGB(255, 172, 168, 168),
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            )),
            const SizedBox(height: 31),
            const OtpInput(),
            const SizedBox(
              height: 16,
            ),
            GenericButton(title: 'Continue', onCallback: onCallback),
            const SizedBox(
              height: 16,
            ),
            _didNotReceiveCode()
          ],
        )));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: SafeArea(
        child: Container(
          child: _mainContainer(),
        ),
      )),
    );
  }
}
