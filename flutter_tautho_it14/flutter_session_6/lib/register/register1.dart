import 'package:flutter/material.dart';

class Register1 extends StatefulWidget {
  const Register1({super.key});

  @override
  State<Register1> createState() => _Register1State();
}

class _Register1State extends State<Register1> {
  late TextEditingController txtcontroller1, txtcontroller2;

  @override
  void initState() {
    txtcontroller1 = TextEditingController();
    txtcontroller2 = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    txtcontroller1.dispose();
    txtcontroller2.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Page 1'),
      ),
      body: Center(
        child: Column(
          children: [Text('data')],
        ),
      ),
    );
  }
}
