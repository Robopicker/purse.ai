import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:purse_ai_app/Component/BarChart.dart';
import 'package:purse_ai_app/Component/GenericHeader.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<TransactionPage> {
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
  Widget _mainContent() {
    return Column(children: [
      GenericHeader(title: 'Reload', onBackPressed: onBackPressed, trailingView: trailingView(),),
      BarChat(),
      _incomeOutcome()
    ],);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(child: Container(child: _mainContent(),
        padding: EdgeInsets.only(left: 20, top: 20, right: 20),
        )),
      ),
    );
  }
}