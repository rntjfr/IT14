import 'package:flutter/material.dart';
import 'package:flutter_session_5/page2.dart';
import 'package:flutter_session_5/page3.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Page 1')),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Page2(),
                  ),
                );
              },
              child: const Text('Go to Page 2'),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Page2(),
                  ),
                );
              },
              child: const Text(
                'Normal Clickable Text',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Page3(
                      email: 'adenrx@gmail.com',
                      password: 'aehnv',
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.share),
              label: const Text('Go to Page 3'),
            )
          ],
        ),
      ),
    );
  }
}
