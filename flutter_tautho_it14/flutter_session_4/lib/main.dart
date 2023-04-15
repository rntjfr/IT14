import 'package:flutter/material.dart';
import 'package:flutter_session_4/containersample.dart';
import 'package:flutter_session_4/imagesample.dart';
import 'package:flutter_session_4/intro.dart';
import 'package:flutter_session_4/pavlova.dart';
import 'package:flutter_session_4/product_layout_app.dart';
import 'package:flutter_session_4/profileview.dart';
import 'package:flutter_session_4/profileviewdetails.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: ProfileView(),
    );
  }
}
