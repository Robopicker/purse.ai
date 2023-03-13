import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:purse_ai_app/Component/GenericHeader.dart';

class LegalAndPolicy extends StatefulWidget {
  const LegalAndPolicy({super.key});

  @override
  State<LegalAndPolicy> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<LegalAndPolicy> {
  onBackPressed() {
    Navigator.pop(context);
  }
  Widget _renderPolicy(String header, String subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(header, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black)),
        SizedBox(height: 8,),
        Text(subtitle, style: TextStyle(fontSize: 12, color: Color.fromARGB(255, 215, 213, 213), fontWeight: FontWeight.w400),)
      ],
    );
  }
  Widget _mainContent() {
    return SingleChildScrollView(
      child: Column(
      children: [
         GenericHeader(title: 'Legal and Policies', onBackPressed: onBackPressed),
         SizedBox(height: 24,),
         _renderPolicy('Terms', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Eget ornare quam vel facilisis feugiat amet sagittis arcu, tortor. Sapien, consequat ultrices morbi orci semper sit nulla. Leo auctor ut etiam est, amet aliquet ut vivamus. Odio vulputate est id tincidunt fames. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Eget ornare quam vel facilisis feugiat amet sagittis arcu, tortor. Sapien, consequat ultrices morbi orci semper sit nulla. Leo auctor ut etiam est, amet aliquet ut vivamus. Odio vulputate est id tincidunt fames. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Eget ornare quam vel facilisis feugiat amet sagittis arcu, tortor. Sapien, consequat ultrices morbi orci semper sit nulla. Leo auctor ut etiam est, amet aliquet ut vivamus. Odio vulputate est id tincidunt fames.'),
         SizedBox(height: 40,),
         _renderPolicy('change in policy', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Eget ornare quam vel facilisis feugiat amet sagittis arcu, tortor. Sapien, consequat ultrices morbi orci semper sit nulla. Leo auctor ut etiam est, amet aliquet ut vivamus. Odio vulputate est id tincidunt fames.')
      ],
    ));
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