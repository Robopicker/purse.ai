import 'package:flutter/material.dart';

class InputFields extends StatelessWidget {
  final String info;
  final Function onChanged;
  const InputFields({super.key, required this.info, required this.onChanged });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
    Text(info),
    const SizedBox(height: 8),
    Container(
      decoration: BoxDecoration(
      border: Border.all(width: 1, color: const Color.fromARGB(255, 200, 199, 199)),
      borderRadius: BorderRadius.circular(12),
     ),
     padding: const EdgeInsets.only(bottom: 4),
    child:
    TextField(
      onChanged: (String val) => {
        onChanged(val)
      },
      cursorColor: Colors.transparent,
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.all(10.0),
        focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),// pass the hint text parameter here
      ),
    ))],
 );
  }
}