import 'package:flutter/material.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

class Cards extends StatefulWidget {
  const Cards({super.key});

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  List<int> data = [0, 1, 2];
  int activeIndex = 0;

  Widget itemList(BuildContext context, int index) {
    return SizedBox(
        width: 250,
        child: Card(
          color: Colors.blueGrey[100],
          elevation: 10,
          child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              child: Center(
                child: Text(index.toString()),
              )),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 50, bottom: 16),
          height: 263,
          child: ScrollSnapList(
            itemBuilder: itemList,
            itemSize: 250,
            itemCount: data.length,
            onItemFocus: (index) => setState(() {
              activeIndex = index;
            }),
            dynamicItemSize: true,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: data.map((index) {
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
