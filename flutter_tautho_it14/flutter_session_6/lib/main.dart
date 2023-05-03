import 'package:flutter/material.dart';
import 'package:flutter_session_6/buttons.dart';
import 'package:flutter_session_6/datepicker1.dart';
import 'package:flutter_session_6/datepicker2.dart';
import 'package:flutter_session_6/datepickerdialog1.dart';
import 'package:flutter_session_6/itempicker1.dart';
import 'package:flutter_session_6/itempicker2.dart';
import 'package:flutter_session_6/itempicker3.dart';
import 'package:flutter_session_6/itempickerdialog1.dart';
import 'package:flutter_session_6/itempickerdialog2.dart';
import 'package:flutter_session_6/login.dart';
import 'package:flutter_session_6/orderdashboard.dart';
import 'package:flutter_session_6/profileview.dart';
import 'package:flutter_session_6/register.dart';

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
      home: Buttons(),
    );
  }
}
