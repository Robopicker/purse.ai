import 'package:flutter/material.dart';
import 'package:purse_ai_app/Component/generic_app_bar.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return GenericAppbar(
      showUserIcon: true,
      trailing: trailingIcon(),
    );
  }
}

Widget trailingIcon() => Container(
      height: 48,
      width: 48,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: Border.all(color: Colors.grey.shade400)),
      child: IconButton(
          onPressed: () => {}, icon: const Icon(Icons.notifications_rounded)),
    );
