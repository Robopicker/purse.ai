import 'package:flutter/material.dart';

class GenericButton extends StatelessWidget {
  final String title;
  final Function onCallback;
  const GenericButton({super.key, required this.title, required this.onCallback});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
    onTap: () => {
      onCallback()
    },
    child: Container(
      height: 42,
      margin: const EdgeInsets.only(top:32),
      decoration: BoxDecoration(color: const Color.fromARGB(255,79, 61, 86), borderRadius: BorderRadius.circular(12)),
      child: Center(child: Text(title, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),)),
    ),
  );
  }
}