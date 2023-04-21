import 'package:flutter/material.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  int num = 0;
  bool isZero = false;
  bool isTen = false;
  String msg = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Stateful Widget 1'),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Number: $num'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(
                      () {
                        num--;
                        updateNumber();
                      },
                    );
                  },
                  child: const Text('-'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(
                      () {
                        num++;
                        updateNumber();
                      },
                    );
                  },
                  child: const Text('+'),
                ),
              ],
            ),
            Text(msg),
          ],
        ),
      ),
    );
  }

  updateNumber() {
    isZero = (num == 0) ? true : false;
    isTen = (num == 10) ? true : false;

    if (isZero) msg = 'You reached zero!';
    if (isTen) msg = 'You reached ten!';
  }
}
