import 'package:flutter/material.dart';
import 'package:flutter/src/animation/animation_controller.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/ticker_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:purse_ai_app/Bloc/bloc/counter_bloc.dart';
import 'package:purse_ai_app/Bloc/transactions/transaction_bloc.dart';
import 'package:purse_ai_app/Bloc/transactions/transaction_state.dart';
import 'package:purse_ai_app/Bloc/user/user_bloc.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<CounterPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CounterBloc, int>(
      listener: (context, state) {
        print('chaing state');
      },
      builder: (context, state) {
        return Container(
          child: Text(state.toString()),
        );
      },
    );
  }
}
