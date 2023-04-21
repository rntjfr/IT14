import 'package:flutter/material.dart';

class Page4 extends StatefulWidget {
  const Page4({super.key});

  @override
  State<Page4> createState() => _Page4State();
}

class _Page4State extends State<Page4> {
  late TextEditingController txtcontroller1, txtcontroller2;
  late double result, val1, val2;

  @override
  void initState() {
    txtcontroller1 = TextEditingController();
    txtcontroller2 = TextEditingController();
    result = 0;
    val1 = 0;
    val2 = 0;

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
        title: const Center(
          child: Text('Stateful Widget 4'),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Enter value 1'),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: txtcontroller1,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter value 1',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text('Enter value 2'),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: txtcontroller2,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter value 2 ',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        val1 = double.parse(txtcontroller1.text);
                        val2 = double.parse(txtcontroller2.text);
                        result = val1 + val2;
                      });
                    },
                    child: const Text('+'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        val1 = double.parse(txtcontroller1.text);
                        val2 = double.parse(txtcontroller2.text);
                        result = val1 - val2;
                      });
                    },
                    child: const Text('-'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        val1 = double.parse(txtcontroller1.text);
                        val2 = double.parse(txtcontroller2.text);
                        result = val1 * val2;
                      });
                    },
                    child: const Text('*'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        val1 = double.parse(txtcontroller1.text);
                        val2 = double.parse(txtcontroller2.text);
                        result = val1 / val2;
                      });
                    },
                    child: const Text('/'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        val1 = double.parse(txtcontroller1.text);
                        val2 = double.parse(txtcontroller2.text);
                        result = val1 % val2;
                      });
                    },
                    child: const Text('%'),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                'Result: $result',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
