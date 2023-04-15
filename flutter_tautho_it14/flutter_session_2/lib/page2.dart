import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IT14/L - 6263'),
      ),
      body: const Center(
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'Rexdan ',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                ),
              ),
              TextSpan(
                text: 'Rex ',
                style: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              TextSpan(
                text: 'Tautho',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
