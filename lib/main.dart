import 'package:flutter/material.dart';
import 'package:purse_ai_app/Navigation/Routes.dart';

void main() {
  runApp(const MyApp(
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/profilePage',
      onGenerateRoute: RouteGenerator.generateRoute,
      home: Scaffold(
        body: SafeArea(child: Container(child: Text('adszcsddscvcd'),)),
      ),
    );
  }
}