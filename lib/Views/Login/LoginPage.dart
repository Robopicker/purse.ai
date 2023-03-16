import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:purse_ai_app/Bloc/user/userBloc.dart';
import 'package:purse_ai_app/Bloc/user/userEvent.dart';
import 'package:purse_ai_app/Bloc/user/userState.dart';
import 'package:purse_ai_app/Component/GenericButton.dart';
import 'package:purse_ai_app/Component/GenericHeader.dart';
import 'package:purse_ai_app/Component/InputFields.dart';
import 'package:purse_ai_app/Component/LoginPanels.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _MyWidgetState();
}

onBackPressed() {
  print('vfef');
}

Widget _topContent() {
  return GenericHeader(
    title: 'Sign In',
    onBackPressed: onBackPressed,
  );
}

Column _welcomeMessage() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        'Hi, Welcome back!',
        style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.4),
      ),
      SizedBox(
        height: 5,
      ),
      Text(
        'we are happy to have you back',
        style: TextStyle(
            color: Colors.black54, fontSize: 14, fontWeight: FontWeight.w400),
      )
    ],
  );
}

Widget _inputFieldItem(String title) {
  return InputFields(info: title, onChanged: () => {},);
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

ctaCallback() {
  print('dsvfdvd');
}

Widget _signCta(BuildContext context) {
  return BlocConsumer<userBloc, userState>(
    listener: (context, state) {
      print(state);
      // TODO: implement listener
    },
    builder: (context, state) {
      return GenericButton(
        title: '${state.isLoggedIn}',
        onCallback: () => {
          context.read<userBloc>().add(login(data: 'hererer'))
        },
      );
    },
  );
}

Widget _renderOrView() {
  return LoginPanels(
    title: 'Or',
  );
}

Container _mainContent(BuildContext context) {
  return Container(
    child: SingleChildScrollView(
            child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _topContent(),
        SizedBox(height: 40,),
        _welcomeMessage(),
        _inputFeild(),
        _signCta(context),
        SizedBox(height: 20,),
        Center(
          child:  TextButton(child: Text("Don't have an account?", style: TextStyle(color: Colors.black),), onPressed: () => {
            Navigator.of(context).pushNamed('/signup')
          },) ,
        ),
        SizedBox(height: 20),
        _renderOrView()
      ],
    )),
    color: Colors.white,
    padding: EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
  );
}

class _MyWidgetState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: SafeArea(
          child: Container(
            child: _mainContent(context),
            decoration: BoxDecoration(color: Colors.white),
          ),
        )));
  }
}