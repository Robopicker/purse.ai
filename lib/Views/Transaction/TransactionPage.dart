import 'dart:convert';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:purse_ai_app/Api/moneypage.dart';
import 'package:purse_ai_app/Component/BarChart.dart';
import 'package:purse_ai_app/Component/GenericHeader.dart';
import 'package:purse_ai_app/Views/Send/UserListView.dart';
import 'package:http/http.dart' as http;

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<TransactionPage> {
  List<dynamic> users = [];
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    fetchUser();
  }
  void fetchUser() async {
    String url = 'https://randomuser.me/api/?results=10';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
     final res = json['results'] as List<dynamic>;
     final resData = res.map((e) {
      return User(
          thumbnail: e['picture']['thumbnail'],
          email: e['email'],
          name: e['name']['first'] + ' ' + e['name']['last']);
    }).toList();
    setState(() {
      users = resData;
    });
  }
  Widget trailingView() {
    return GestureDetector(
      onTap: () => {

      },
      child: Container(
        child: Icon(Icons.settings_outlined),
      ),
    );
  }
  Widget _transactionCard(String title, String subTitle, Widget Icon) {
    return Container(
      height: 142,
      width: 156,
      padding: EdgeInsets.only(top: 16, left: 16),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Color.fromARGB(255, 215, 212, 212)),
        borderRadius: BorderRadius.circular(16)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Icon,
          SizedBox(height: 12,),
          Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color.fromRGBO(31, 44, 55, 1)),),
          SizedBox(height: 4,),
          Text(subTitle, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Color.fromRGBO(156, 164, 171, 1)),)
        ],
      ),
    );
  }
  Widget _incomeOutcome() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _transactionCard('6.564,34', 'Income', Image.asset('assest/sendMoney.png', height: 48, width: 48,)),
        _transactionCard('4.764,35', 'Outcome', Image.asset('assest/sentMoney.png', height: 48, width: 48,))
      ],
    );
  }
  onBackPressed() {

  }

  Widget _transactionList() {
    return ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: users.length,
      itemBuilder: ((context, index) {
          final user = users[index];
            final name = user.name;
            final email = user.email;
            final thumbnail = user.thumbnail;
      return ListTile(
        leading: CircleAvatar(child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image(image: NetworkImage(thumbnail)),
                ),
                ),
                title: Text(name),
                subtitle: Text(email),
                trailing: Text('\$123', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black),),
      );
    }));
  }

  Widget _recenttransaction() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Recent Transaction', style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600)),
          _transactionList()
        ],
      ),
    );
  }
  Widget _mainContent() {
    return Column(children: [
      GenericHeader(title: 'Reload', onBackPressed: onBackPressed, trailingView: trailingView(),),
      BarChat(),
      _incomeOutcome(),
      _recenttransaction()
    ],);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(child: 
        SingleChildScrollView(child: Container(child: _mainContent(),
        padding: EdgeInsets.only(left: 20, top: 20, right: 20),
        ))),
      ),
    );
  }
}