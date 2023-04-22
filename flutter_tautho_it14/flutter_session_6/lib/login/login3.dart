import 'package:flutter/material.dart';
import 'package:flutter_session_6/register/register3.dart';

class Login3 extends StatefulWidget {
  const Login3({super.key});

  @override
  State<Login3> createState() => _Login3State();
}

class _Login3State extends State<Login3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page 3'),
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
                    builder: (context) => Register3(),
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

  txtfield(text) => TextField(
        decoration: InputDecoration(
            hintText: text,
            contentPadding: const EdgeInsets.all(15),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
        onChanged: (value) {
          // do something
        },
      );
  button(text, icon) => OutlinedButton.icon(
        onPressed: () {},
        icon: Icon(
          icon,
          size: 24.0,
        ),
        label: Text(text),
      );
}
