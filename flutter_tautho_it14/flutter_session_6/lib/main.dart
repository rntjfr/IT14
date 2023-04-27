import 'package:flutter/material.dart';
import 'package:flutter_session_6/buttons.dart';
import 'package:flutter_session_6/login/login1.dart';
import 'package:flutter_session_6/page1.dart';
import 'package:flutter_session_6/page2.dart';
import 'package:flutter_session_6/page3.dart';
import 'package:flutter_session_6/page4.dart';
import 'package:flutter_session_6/register/register1.dart';
import 'package:flutter_session_6/textfields.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: TextFields(),
    );
  }
}
