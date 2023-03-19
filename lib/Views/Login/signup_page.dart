import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:purse_ai_app/Bloc/user/user_bloc.dart';
import 'package:purse_ai_app/Bloc/user/user_state.dart';
import 'package:purse_ai_app/Component/generic_button.dart';
import 'package:purse_ai_app/Component/generic_header.dart';
import 'package:purse_ai_app/Component/input_fields.dart';
import 'package:purse_ai_app/Component/login_panels.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SignupPage> {
  String name = '';
  String email = '';
  String password = '';
  onBackPressed() {
    Navigator.pop(context);
  }

  Widget _topContent() {
    return GenericHeader(title: 'Sign Up', onBackPressed: onBackPressed);
  }

  Widget _messageInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Create Account',
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
          'we are really exicted to start journey',
          style: TextStyle(
              color: Colors.black54, fontSize: 14, fontWeight: FontWeight.w400),
        )
      ],
    );
  }

  Widget _inputFeilds() {
    return Padding(
        padding: const EdgeInsets.only(top: 48),
        child: Column(
          children: [
            InputFields(
                info: 'full Name',
                onChanged: (val) => {
                      setState(() {
                        name = val;
                      })
                    }),
            const SizedBox(height: 16),
            InputFields(
                info: 'Email Address',
                onChanged: (val) => {
                      setState(() {
                        email = val;
                      })
                    }),
            const SizedBox(
              height: 16,
            ),
            InputFields(
                info: 'Password',
                onChanged: (val) => {
                      setState(() {
                        password = val;
                      })
                    }),
            const SizedBox(
              height: 16,
            )
          ],
        ));
  }

  createProfile1() {
    //  createPR(CreateAccount(name: name, email: email, password: password));
  }

  Widget _submitCta() {
    return BlocConsumer<UserBloc, UserState>(
      listener: (context, state) {
        if (state.name != '' && state.email != '' && state.password != '') {
          onBackPressed();
        }
      },
      builder: (context, state) {
        return GenericButton(
            title: 'Continue',
            onCallback: () => {
                  if (name != '' && email != '' && password != '')
                    {
                      //  BlocProvider.of<UserBloc>(context)
                      //                 .add(CreateAccount(name: name, email: email, password: password))
                      createProfile1()
                    }
                  else
                    {
                      const AlertDialog(
                        title: Text('add data'),
                      )
                    }
                });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
            child: Container(
          padding:
              const EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
          child: SingleChildScrollView(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _topContent(),
              const SizedBox(
                height: 32,
              ),
              _messageInfo(),
              _inputFeilds(),
              _submitCta(),
              const SizedBox(height: 35),
              const UserLoginPanels(title: 'or signup with')
            ],
          )),
        )),
      ),
    );
  }
}
