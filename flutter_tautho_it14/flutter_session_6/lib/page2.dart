import 'package:flutter/material.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  late TextEditingController txtcontroller;
  late String value;

  @override
  void initState() {
    txtcontroller = TextEditingController();
    value = " ";
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    txtcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Stateful Widget 2'),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                onChanged: (text) {
                  setState(() {
                    value = text;
                  });
                },
                controller: txtcontroller,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Please enter a value'),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  value = txtcontroller.text;
                });
              },
              child: const Text("SHOW"),
            ),
            Text(
              'Result: $value',
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
