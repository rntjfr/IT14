import 'package:flutter/material.dart';
import 'package:flutter_session_5/orderdashboard.dart';
import 'package:flutter_session_5/page1.dart';
import 'package:flutter_session_5/page3.dart';
import 'package:flutter_session_5/productdetails.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Order App',
      debugShowCheckedModeBanner: false,
      home: OrderDashboard(),
    );
  }
}
