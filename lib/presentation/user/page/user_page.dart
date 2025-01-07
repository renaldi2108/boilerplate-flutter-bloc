import 'dart:convert';

import 'package:boilerplate/presentation/user/bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                var result = state.userState.maybeWhen(
                  success: (data) => jsonEncode(data),
                  loading: () => "loading",
                  error: (message) => message,
                  orElse: () => "initial"
                );

                return Text(
                  result,
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontSize: 10
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          BlocProvider.of<UserBloc>(context).add(UserEvent.fetchUser());
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}