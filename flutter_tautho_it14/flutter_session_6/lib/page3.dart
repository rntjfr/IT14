import 'package:flutter/material.dart';

class Page3 extends StatefulWidget {
  const Page3({super.key});

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  late TextEditingController txtcontroller1, txtcontroller2;
  late int result, val1, val2;

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
        title: const Center(child: Text('Stateful Widget 3')),
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
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    val1 = int.parse(txtcontroller1.text);
                    val2 = int.parse(txtcontroller2.text);
                    result = val1 + val2;
                  });
                },
                child: const Text('Calculate'),
              ),
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
