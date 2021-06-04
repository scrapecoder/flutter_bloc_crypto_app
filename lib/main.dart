import 'package:blocpattern/bloc/cubit/counter_cubit.dart';
import 'package:blocpattern/presentation/screen/home_page.dart';
import 'package:blocpattern/presentation/screen/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth/auth_respository.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: RepositoryProvider(
          create: (context) => AuthRespository(),
          child: LoginView(),
        ),
      ),
    );
  }
}
