// ignore: file_names
import 'package:flutter/material.dart';

class GenericText extends StatelessWidget {
  final String title;
  final double size;
  final double lineHeight;
  final String? secondaryTitle;
  final Color textColor;
  final FontWeight fontWeight;

  const GenericText(
      {super.key,
      required this.title,
      this.size = 12,
      this.lineHeight = 16,
      this.fontWeight = FontWeight.w400,
      this.secondaryTitle,
      this.textColor = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          color: textColor,
          fontSize: size,
          height: lineHeight / size,
          fontFamily: 'Inter',
          fontWeight: fontWeight),
    );
  }
}
