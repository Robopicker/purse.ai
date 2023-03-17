import 'package:flutter/material.dart';
import 'package:purse_ai_app/Api/money_page.dart';
import 'package:purse_ai_app/Component/generic_header.dart';
import 'package:purse_ai_app/Views/Send/user_list_view.dart';

class SendMoney extends StatefulWidget {
  const SendMoney({super.key});

  @override
  State<SendMoney> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SendMoney> {
  int filter = 0;

  @override
  @protected
  void didUpdateWidget(oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  @mustCallSuper
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  onBackPressed() {
    Navigator.pop(context);
  }

  Widget notificationIcon() {
    return Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: const Color.fromARGB(255, 233, 232, 232)),
        child: GestureDetector(
          onTap: () => {},
          child: const Icon(Icons.notifications),
        ));
  }

  Widget searchContainer() {
    return Container(
      padding: const EdgeInsets.only(top: 24),
      child: TextField(
        decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search),
            hintText: 'Search Contact',
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      ),
    );
  }

  Widget swtichIcon(title, id) {
    return GestureDetector(
      onTap: () => {
        setState(() {
          filter = id;
        })
      },
      child: Container(
        decoration: BoxDecoration(
          color: filter == id ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(5),
        ),
        padding: const EdgeInsets.only(left: 20, right: 20, top: 8, bottom: 8),
        child: Text(title),
      ),
    );
  }

  Widget swtichContainer() {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 224, 221, 221),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        swtichIcon('All', 0),
        swtichIcon('Favorite', 1),
        swtichIcon('Bank', 2),
        swtichIcon('e-wallet', 3)
      ]),
    );
  }

  onItemClick(User userData) {
    Navigator.pushNamed(
      context,
      '/sendMoneySummary',
      arguments: userData,
    );
  }

  Widget mainContainer() {
    return Column(children: [
      GenericHeader(
        title: 'Send Money',
        onBackPressed: onBackPressed,
        trailingView: notificationIcon(),
      ),
      searchContainer(),
      const SizedBox(
        height: 20,
      ),
      swtichContainer(),
      UserListView(
        filterId: filter,
        callback: onItemClick,
      )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: SafeArea(
              child: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(children: [mainContainer()]),
      ))),
    );
  }
}
