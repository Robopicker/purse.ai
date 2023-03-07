import 'package:flutter/material.dart';

void showDialogPopup(BuildContext context, Widget widget) async {
  showDialog(context: context,builder: (BuildContext context) {
              return AlertDialog(
                    scrollable: true,
                    content: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [widget],
                      ),
                    ),
                  );
                });
}