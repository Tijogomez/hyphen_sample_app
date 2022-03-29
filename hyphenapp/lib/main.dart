import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hyphenapp/bloc/auth_repo.dart';
import 'package:hyphenapp/screens/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RepositoryProvider(
        create: (context) => AuthRepo(),
        child: LoginScreen(),
      ),
    );
  }
}
