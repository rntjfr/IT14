import 'package:flutter/material.dart';
import 'package:flutter_1st_lab_exam/login.dart';
import 'package:flutter_1st_lab_exam/model/account.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.cyan),
      home: Login(
        account: Account(username: '', password: ''),
      ),
    );
  }
}
