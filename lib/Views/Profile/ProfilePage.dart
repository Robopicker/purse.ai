import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:purse_ai_app/Component/GenericHeader.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ProfilePage> {
  onBackPressed() {
    Navigator.pop(context);
  }
  Widget _renderOptionTitle(String title) {
    return Container(
    child: Text(title, style: temp['optionTitleStyle'],),
    margin: EdgeInsets.only(bottom: 26, top: 24),
    );
  }
  Widget _optionCta(dynamic image, String title) {
    return GestureDetector(
      onTap: () => {
        print('clicking')
      },
      child: Column(
        children: [ Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [Icon(image), Container(margin: EdgeInsets.only(left: 25),child: Text(title, style: temp['optionTextStyle'],)) ],
      ),
      SizedBox(height: 12,),
      Divider(),
      SizedBox(height: 12,)
      ],
      )
    );
  }
  Widget _userInfo() {
    return Container(child: Column(
      children: [
         SizedBox(height: 30,),
        Image.asset('assest/UserIcon.png', height: 100, width: 100,),
         SizedBox(height: 14,),
        Text('Simran', style: temp['userTextStyle'],),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
           children: [
           _renderOptionTitle('Personal Information'),
        _optionCta(Icons.verified_user_outlined, 'Your Profile '),
        _optionCta(Icons.download, 'History Transaction'),
        _renderOptionTitle('Security'),
        _optionCta(Icons.face, 'FaceId'),
        _optionCta(Icons.lock, 'Change password'),
        _optionCta(Icons.lock_open, 'Forgot password'),
        _renderOptionTitle('General'),
        _optionCta(Icons.notifications, 'Notifications'),
        _optionCta(Icons.no_backpack, 'Languages'),
        _optionCta(Icons.warning, 'Help and Support')
        ],)

      ],
    ), );
  }
  Widget logoutCta() {
    return Container(
      child: GestureDetector(
        onTap: () => {

        },
        child: Text('Logut', style: temp['textStyle'],)),
    );
  }
  Widget _mainContent() {
    return Column(
      children: [
        GenericHeader(title: 'Profile', 
        onBackPressed: onBackPressed, 
        ),
        _userInfo(),
        logoutCta()
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

final temp = {
  'textStyle': TextStyle(color: Colors.red, fontSize: 16, fontWeight: FontWeight.w500,),
  'userTextStyle': TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),
  'optiontextStyle': TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),
  'optionTitleStyle': TextStyle(color: Color.fromRGBO(156, 164, 171, 1), fontSize: 14, fontWeight: FontWeight.w500)
};