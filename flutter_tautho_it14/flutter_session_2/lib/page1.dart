import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IT14/L - 6263'),
      ),
      body: const Center(
        child: Text('Rexdan N. Tautho'),
      ),
    );
  }
}
