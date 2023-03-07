import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class GenericButton extends StatelessWidget {
  final String title;
  final Function onCallback;
  const GenericButton({super.key, required this.title, required this.onCallback});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
    onTap: () => {
      this.onCallback()
    },
    child: Container(
      height: 42,
      margin: EdgeInsets.only(top:32),
      decoration: BoxDecoration(color: Color.fromARGB(255,79, 61, 86), borderRadius: BorderRadius.circular(12)),
      child: Center(child: Text(this.title, style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),)),
    ),
  );
  }
}