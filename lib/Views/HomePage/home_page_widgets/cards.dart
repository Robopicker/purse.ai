// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:purse_ai_app/Component/generic_text.dart';
import 'package:purse_ai_app/Utils/card_utils.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

class Cards extends StatefulWidget {
  const Cards({super.key});

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {
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
  int activeIndex = 0;

  Widget itemList(BuildContext context, int index) {
    return SizedBox(
      width: 250,
      child: Container(
        margin: const EdgeInsets.only(bottom: 24),
        padding: const EdgeInsets.all(24),
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
              height: 40,
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
              height: 30,
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
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 50, bottom: 16),
          height: 250,
          child: ScrollSnapList(
            itemBuilder: itemList,
            itemSize: 250,
            itemCount: list.length,
            onItemFocus: (index) => setState(() {
              activeIndex = index;
            }),
            dynamicItemSize: true,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: list.map((index) {
            return Container(
              width: 8.0,
              height: 8.0,
              margin:
                  const EdgeInsets.symmetric(vertical: 4.0, horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: activeIndex == index ? Colors.black : Colors.blueGrey,
              ),
            );
          }).toList(),
        )
      ],
    );
  }
}
