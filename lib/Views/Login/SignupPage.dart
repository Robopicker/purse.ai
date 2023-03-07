import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:purse_ai_app/Component/GenericButton.dart';
import 'package:purse_ai_app/Component/GenericHeader.dart';
import 'package:purse_ai_app/Component/InputFields.dart';
import 'package:purse_ai_app/Component/LoginPanels.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SignupPage> {
  onBackPressed() {
    print('vfdvfdv');
  }
  Widget _topContent() {
  return GenericHeader(title: 'Sign Up', onBackPressed: onBackPressed);
}
Widget _messageInfo() {
  return  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [Text('Create Account', style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.w600, letterSpacing: 0.4),), SizedBox(height: 5,) ,Text('we are really exicted to start journey', style: TextStyle(color: Colors.black54, fontSize: 14, fontWeight: FontWeight.w400),)],
    );
}
Widget _inputFeilds() {
  return Padding(padding: EdgeInsets.only(top: 48), child: Column(
    children: [
      InputFields(info: 'full Name'),
      SizedBox(height: 16),
      InputFields(info: 'Email Address'),
      SizedBox(height: 16,),
      InputFields(info: 'Password'),
      SizedBox(height: 16,)
    ],
  ));
}

onCtaPressed() {
  print('fdvdfgffg');
}

Widget _submitCta() {
  return GenericButton(title: 'Continue', onCallback: onCtaPressed);
}
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(child:  Container( 
          padding: EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
          child: SingleChildScrollView(child: Column(
             mainAxisAlignment: MainAxisAlignment.start,
             crossAxisAlignment: CrossAxisAlignment.start,
            children: [_topContent(),
            SizedBox(height: 32,),
             _messageInfo(),
             _inputFeilds(),
             _submitCta(),
             SizedBox(height: 35),
             LoginPanels(title: 'or signup with')
             ],))
            ,)),
      ),
    );
  }
}