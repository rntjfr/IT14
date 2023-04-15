import 'package:flutter/material.dart';

class ContainerSample extends StatelessWidget {
  const ContainerSample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Margin Example'),
      ),
      body: Row(
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.yellow,
              border: Border.all(
                color: Colors.black,
                width: 10,
              ),
            ),
            child: const Text(
              'text 1',
              style: TextStyle(
                fontSize: 32,
              ),
            ),
          ),
          Container(
            //margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.red,
              border: Border.all(
                color: Colors.yellow,
                width: 5,
              ),
            ),
            child: const Text(
              'text 2',
              style: TextStyle(fontSize: 32),
            ),
          ),
        ],
      ),
    );
  }
}
