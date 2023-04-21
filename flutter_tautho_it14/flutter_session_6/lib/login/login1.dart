import 'package:flutter/material.dart';
import 'package:flutter_session_6/register/register1.dart';

class Login1 extends StatefulWidget {
  const Login1({super.key});

  @override
  State<Login1> createState() => _Login1State();
}

class _Login1State extends State<Login1> {
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
        title: const Center(
          child: Text('Login Page 1'),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Enter Email'),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: txtcontroller1,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Email Address',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text('Enter Password'),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: txtcontroller2,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Password',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  // <-- ElevatedButton
                  onPressed: () {},
                  icon: const Icon(
                    Icons.login,
                    size: 24.0,
                  ),
                  label: const Text('Login'),
                ),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton.icon(
                  // <-- ElevatedButton
                  onPressed: () {},
                  icon: const Icon(
                    Icons.cancel_outlined,
                    size: 24.0,
                  ),
                  label: const Text('Cancel'),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Register1(),
                  ),
                ),
              },
              child: const Center(
                child: Text('Create an Account'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
