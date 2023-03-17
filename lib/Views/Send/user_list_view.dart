import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:purse_ai_app/Api/money_page.dart';

class UserListView extends StatefulWidget {
  final int filterId;
  final Function callback;
  const UserListView(
      {super.key, required this.filterId, required this.callback});

  @override
  State<UserListView> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<UserListView> {
  List<dynamic> users = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  @mustCallSuper
  void didChangeDependencies() {
    super.didChangeDependencies();
    fetchUser();
  }

  @override
  void didUpdateWidget(oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.filterId != widget.filterId) {
      fetchUser();
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  void fetchUser() async {
    const url = 'https://randomuser.me/api/?results=10';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final res = json['results'] as List<dynamic>;
    final resData = res.map((e) {
      return User(
          thumbnail: e['picture']['thumbnail'],
          email: e['email'],
          name: e['name']['first'] + ' ' + e['name']['last']);
    }).toList();
    setState(() {
      users = resData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.only(top: 20),
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];
                  final name = user.name;
                  final email = user.email;
                  final thumbnail = user.thumbnail;
                  return ListTile(
                    onTap: () => {widget.callback(user)},
                    leading: CircleAvatar(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image(image: NetworkImage(thumbnail)),
                      ),
                    ),
                    title: Text(name),
                    subtitle: Text(email),
                    trailing: const Icon(
                      Icons.star_border_rounded,
                      color: Colors.deepPurpleAccent,
                    ),
                  );
                })));
  }
}
