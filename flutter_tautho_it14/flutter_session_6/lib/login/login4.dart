import 'package:flutter/material.dart';
import 'package:flutter_session_6/register/register4.dart';

class Login4 extends StatefulWidget {
  const Login4({super.key});

  @override
  State<Login4> createState() => _Login4State();
}

class _Login4State extends State<Login4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page 4'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Enter Email Address'),
                const SizedBox(height: 10),
                txtfield('Email Address'),
                const SizedBox(height: 10),
                const Text('Enter Password'),
                const SizedBox(height: 10),
                txtfield('Password'),
                const SizedBox(height: 10),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                button('Login', Icons.login),
                const SizedBox(width: 10),
                button('Cancel', Icons.cancel_outlined)
              ],
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Register4(),
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

  txtfield(text) => Container(
        width: 300,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
                width: 1,
                color: Color.fromARGB(255, 21, 13, 22),
                style: BorderStyle.solid)),
        child: TextField(
          decoration: InputDecoration(
              hintText: text,
              contentPadding: const EdgeInsets.all(15),
              border: InputBorder.none),
          onChanged: (value) {
            // Do something
          },
        ),
      );
  button(text, icon) => ElevatedButton(
        onPressed: () {},
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(text),
            const SizedBox(
              width: 5,
            ),
            Icon(
              icon,
              size: 24.0,
            ),
          ],
        ),
      );
}
