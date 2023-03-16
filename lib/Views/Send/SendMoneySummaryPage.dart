import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:purse_ai_app/Api/moneypage.dart';
import 'package:purse_ai_app/Component/GenericButton.dart';
import 'package:purse_ai_app/Component/GenericHeader.dart';
import 'package:purse_ai_app/Views/Bills/PAyBillPopup.dart';

class SendMoneySummaryPage extends StatefulWidget {
  final User data;
  const SendMoneySummaryPage({super.key, required this.data});
  @override
  State<SendMoneySummaryPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SendMoneySummaryPage> {
  onBackPressed() {
    Navigator.pop(context);
  }
  Widget _amountContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Amount:', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),),
        SizedBox(height: 16,),
        Container(
          padding: EdgeInsets.all(18),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            border: Border.all(width: 1, color: Color.fromARGB(255, 218, 214, 214)),
            color: Colors.white
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(color: Color.fromARGB(255, 228, 227, 227),
                borderRadius: BorderRadius.circular(16),),
                child: Row(
                  children: [
                    Icon(Icons.currency_bitcoin),
                    Text('USD'),
                    Icon(Icons.arrow_drop_down_rounded)
                  ],
                ),
              ),
              Expanded(flex: 1, child: Align(alignment: Alignment.centerRight, child: Text('154,42', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),)))
            ],
          ),
        )
      ],
    );
  }
  Widget _messageContent() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text('Message:', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),),
        SizedBox(height: 16,),
        SizedBox(
          height: 132,
          child: TextField(
                   keyboardType: TextInputType.multiline,
                   maxLines: 10,
                   decoration: InputDecoration(
                   hintText: 'Add some message',
                   border: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(16))),
      ),
        )
      ],
    );
  }
  onClick() {
    showPayBillPopup(context);
  }
  Widget _payCta() {
    return GenericButton(title: 'send money', onCallback: onClick) ;
  }
  Widget _mainContent() {
    return SingleChildScrollView(child: Column(
      children: [
        GenericHeader(title: 'Send Money', onBackPressed: onBackPressed),
        SizedBox(height: 38,),
        CircleAvatar(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(140),
              child: Image(image: NetworkImage(widget.data.thumbnail)),
              ),
            ),
        SizedBox(height: 20,),
        Text(widget.data.name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, letterSpacing: 0.5),),
        SizedBox(height: 4,),
        Text(widget.data.email, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14, color: Color.fromARGB(255, 182, 178, 178)),),
        SizedBox(height: 25,),
        _amountContent(),
        SizedBox(height: 25,),
        _messageContent(),
        SizedBox(height: 113,),
        _payCta()
      ],
    ));
  }
  @override
  Widget build(BuildContext context) {
    // Extract the arguments from the current ModalRoute
    // settings and cast them as ScreenArguments.
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(child: 
        Container(
          decoration: BoxDecoration(color: Colors.white),
          child: _mainContent(),
          padding: EdgeInsets.only(left: 20, right: 20, top: 20),
        )),
      ),
    );
  }
}