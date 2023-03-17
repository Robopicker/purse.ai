import 'package:flutter/material.dart';

class CardClass {
  final String cardName;
  final String amount;
  final String pin;
  final String expire;
  final String cardType;
  final Color bgColor;
  const CardClass(
      {required this.cardName,
      required this.amount,
      required this.expire,
      required this.cardType,
      required this.pin,
      required this.bgColor});
}
