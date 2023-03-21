import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:purse_ai_app/Bloc/transactions/transaction_bloc.dart';
import 'package:purse_ai_app/Bloc/transactions/transaction_state.dart';
import 'package:purse_ai_app/Component/generic_header.dart';
import 'package:purse_ai_app/Component/generic_text.dart';
import 'package:purse_ai_app/Utils/card_utils.dart';

class MyCard extends StatefulWidget {
  const MyCard({super.key});

  @override
  State<MyCard> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyCard> {
  List<CardClass> list = [
    const CardClass(
        cardName: 'Yogesh',
        amount: '\$12345',
        expire: '12/24',
        cardType: 'VISA',
        pin: '4567',
        bgColor: Colors.brown),
    const CardClass(
        cardName: 'Yogesh',
        amount: '\$12345',
        expire: '12/24',
        cardType: 'VISA',
        pin: '4567',
        bgColor: Colors.orange)
  ];
  onBackPressed() {
    Navigator.pop(context);
  }

  Widget listViewContent() {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: list.length,
        itemBuilder: ((context, index) => Container(
              padding: const EdgeInsets.all(24),
              margin: const EdgeInsets.only(bottom: 24),
              decoration: BoxDecoration(
                color: list[index].bgColor,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: GenericText(
                        title: list[index].cardName,
                        size: 12,
                        lineHeight: 20,
                        textColor: Colors.white,
                      )),
                      GenericText(
                        title: list[index].cardType,
                        size: 20,
                        lineHeight: 26,
                        textColor: Colors.white,
                        fontWeight: FontWeight.w800,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const GenericText(
                        title: 'Balance',
                        size: 14,
                        lineHeight: 22,
                        textColor: Colors.grey,
                        fontWeight: FontWeight.w400,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      GenericText(
                        title: list[index].amount,
                        size: 24,
                        lineHeight: 24,
                        textColor: Colors.white,
                        fontWeight: FontWeight.w600,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: GenericText(
                        title: '***** ${list[index].pin}',
                        size: 16,
                        lineHeight: 24,
                        textColor: Colors.grey,
                      )),
                      GenericText(
                        title: list[index].expire,
                        textColor: Colors.white,
                        fontWeight: FontWeight.w500,
                        size: 12,
                        lineHeight: 20,
                      )
                    ],
                  )
                ],
              ),
            )));
  }

  Widget mainContent() {
    return BlocConsumer<TransactionBloc, TransactionState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Column(
          children: [
            Text(state.toString()),
            GenericHeader(
              title: 'All Cards',
              onBackPressed: onBackPressed,
              trailingView: const Icon(Icons.settings),
            ),
            const SizedBox(
              height: 24,
            ),
            listViewContent()
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TransactionBloc(),
      child: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: mainContent(),
      ),
    );
  }
}
