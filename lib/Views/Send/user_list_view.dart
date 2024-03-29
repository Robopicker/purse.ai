import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:purse_ai_app/Bloc/transactions/transaction_bloc.dart';
import 'package:purse_ai_app/Bloc/transactions/transaction_event.dart';
import 'package:purse_ai_app/Bloc/transactions/transaction_state.dart';

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
  final TransactionBloc transactionBloc = TransactionBloc();

  @override
  void initState() {
    transactionBloc.add(GetTransactionData());
    super.initState();
  }

  @override
  @mustCallSuper
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.filterId != widget.filterId) {
      transactionBloc.add(GetTransactionData());
    }
  }

  @override
  void dispose() {
    transactionBloc.close();
    super.dispose();
  }

  Widget listView() {
    return BlocListener<TransactionBloc, TransactionState>(
      listener: (context, state) {
        if (state is TransactionEror) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('getting error')));
        }
      },
      child: BlocConsumer<TransactionBloc, TransactionState>(
        listener: (context, state) => {},
        builder: (context, state) {
          if (state is TransactionLoading) {
            return const Text('loaind ');
          } else if (state is TransactionEror) {
            return const Text('error');
          } else if (state is TransactionInitial) {
            return const Text('initial');
          } else if (state is TransactionLoaded) {
            return ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: state.list.length,
                itemBuilder: (context, index) {
                  final user = state.list[index];
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
                });
          } else {
            return const Text('nothing to render');
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: BlocProvider(
      create: (_) => transactionBloc,
      child:
          Container(padding: const EdgeInsets.only(top: 20), child: listView()),
    ));
  }
}
