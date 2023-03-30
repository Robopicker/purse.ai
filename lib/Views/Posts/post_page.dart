import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:purse_ai_app/Bloc/bloc/post_bloc.dart';
import 'package:purse_ai_app/Views/Posts/post_list.dart';
import 'package:purse_ai_app/Views/Posts/simple_bloc_observer.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Posts')),
        body: BlocProvider(
          create: (_) => PostBloc(),
          child: const PostsList(),
        ));
  }
}
