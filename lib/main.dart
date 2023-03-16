import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:purse_ai_app/Bloc/loginBloc.dart';
import 'package:purse_ai_app/Navigation/Routes.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    await Future.delayed(const Duration(seconds: 3));
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => loginBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/homepage',
        onGenerateRoute: RouteGenerator.generateRoute,
        home: Scaffold(
          body: SafeArea(
              child: Container(
            child: Text('adszcsddscvcd'),
          )),
        ),
      ),
    );
  }
}
