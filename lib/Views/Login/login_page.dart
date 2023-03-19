import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:purse_ai_app/Bloc/user/user_bloc.dart';
import 'package:purse_ai_app/Bloc/user/user_event.dart';
import 'package:purse_ai_app/Bloc/user/user_state.dart';
import 'package:purse_ai_app/Component/generic_button.dart';
import 'package:purse_ai_app/Component/generic_header.dart';
import 'package:purse_ai_app/Component/input_fields.dart';
import 'package:purse_ai_app/Component/login_panels.dart';

class UserLoginPage extends StatefulWidget {
  const UserLoginPage({super.key});

  @override
  State<UserLoginPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<UserLoginPage> {
  onBackPressed() {}

  Widget _topContent() {
    return GenericHeader(
      title: 'Sign In',
      onBackPressed: onBackPressed,
    );
  }

  Column _welcomeMessage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
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
    return InputFields(
      info: title,
      onChanged: () => {},
    );
  }

  Container _inputFeild() {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _inputFieldItem('Full Name'),
          const SizedBox(
            height: 30,
          ),
          _inputFieldItem('Password')
        ],
      ),
    );
  }

  ctaCallback() {}

  Widget _signCta(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
      listener: (context, state) {},
      builder: (context, state) {
        return GenericButton(
          title: '${state.isLoggedIn} here',
          onCallback: () =>
              {context.read<UserBloc>().add(UserLogin(data: 'hererer'))},
        );
      },
    );
  }

  Widget _renderOrView() {
    return const UserLoginPanels(
      title: 'Or',
    );
  }

  Container _mainContent(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
      child: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _topContent(),
          const SizedBox(
            height: 40,
          ),
          _welcomeMessage(),
          _inputFeild(),
          _signCta(context),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: TextButton(
              child: const Text(
                "Don't have an account?",
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () => {Navigator.of(context).pushNamed('/signup')},
            ),
          ),
          const SizedBox(height: 20),
          _renderOrView()
        ],
      )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: ((context) => UserBloc()))],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
              body: SafeArea(
            child: Container(
              decoration: const BoxDecoration(color: Colors.white),
              child: _mainContent(context),
            ),
          ))),
    );
  }
}
