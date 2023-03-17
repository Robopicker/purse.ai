import 'package:flutter/material.dart';

class GenericBottomBar extends StatefulWidget {
  final Function onPressed;
  const GenericBottomBar({super.key, required this.onPressed});

  @override
  State<GenericBottomBar> createState() => _GenericBottomBarState();
}

class _GenericBottomBarState extends State<GenericBottomBar> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        showUnselectedLabels: false,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey.shade500,
        onTap: (index) => setState(() {
              _selectedIndex = index;
              widget.onPressed(index);
            }),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.insert_chart_outlined_rounded),
              label: 'Statistics'),
          BottomNavigationBarItem(icon: Icon(Icons.add_box), label: 'Add'),
          BottomNavigationBarItem(
              icon: Icon(Icons.credit_card_rounded), label: 'My Card'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_rounded), label: 'Profile'),
        ]);
  }
}
