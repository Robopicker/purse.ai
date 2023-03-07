import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:purse_ai_app/Component/GenericHeader.dart';
import 'package:purse_ai_app/Component/InputFields.dart';

class SendMoney extends StatefulWidget {
  const SendMoney({super.key});

  @override
  State<SendMoney> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SendMoney> {
  onBackPressed() {
    Navigator.pop(context);
  }
  Widget _notificationIcon() {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: Color.fromARGB(255, 233, 232, 232)
      ),
      child: GestureDetector(
      onTap: () => {},
      child: Icon(Icons.notifications),
    ));
  }
  Widget _searchContainer() {
    return Container(
      padding: EdgeInsets.only(top: 24),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          hintText: 'Search Contact',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
  Widget _swtichIcon(title) {
    return GestureDetector(
      onTap: () => {

      },
      child: Container(
        decoration: BoxDecoration(
           color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        padding: EdgeInsets.only(left: 20, right: 20, top:8, bottom: 8),
        child: Text(title),
      ),
    );
  }
  Widget _swtichContainer() {
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
         color: Color.fromARGB(255, 224, 221, 221),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
        _swtichIcon('All'),
        _swtichIcon('Favorite'),
        _swtichIcon('Bank'),
        _swtichIcon('e-wallet')
      ]),
    );
  }
  Widget _mainContainer() {
    return Container(
      child: Column(children: [
        GenericHeader(title: 'Send Money', onBackPressed: onBackPressed, trailingView: _notificationIcon(),),
        _searchContainer(),
        SizedBox(height: 20,),
        _swtichContainer()
      ]),
    );
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: SafeArea(child: Container(
      child: Column(children: [
        _mainContainer()
      ]),
      padding: EdgeInsets.only(left: 20, right: 20),
    ))),);
  }
}