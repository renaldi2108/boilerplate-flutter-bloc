import 'package:boilerplate/presentation/user/bloc/user_bloc.dart';
import 'package:boilerplate/presentation/user/page/user_page.dart';
import 'package:boilerplate/shared/core/di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDepedencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(create: (context) => getIt<UserBloc>(), child: MyHomePage(title: 'Flutter Demo Home Page'),),
    );
  }
}