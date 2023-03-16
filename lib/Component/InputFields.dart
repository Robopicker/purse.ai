import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class InputFields extends StatelessWidget {
  final String info;
  final Function onChanged;
  const InputFields({super.key, required this.info, required this.onChanged });

  @override
  Widget build(BuildContext context) {
    return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
    Text(info),
    SizedBox(height: 8),
    Container(
      decoration: BoxDecoration(
      border: Border.all(width: 1, color: Color.fromARGB(255, 200, 199, 199)),
      borderRadius: BorderRadius.circular(12),
     ),
     padding: EdgeInsets.only(bottom: 4),
    child:
    TextField(
      onChanged: (String val) => {
        this.onChanged(val)
      },
      cursorColor: Colors.transparent,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(10.0),
        focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),// pass the hint text parameter here
      ),
    ))],
 ));
  }
}