import 'package:flutter/material.dart';
import 'package:flutter_session_6/register/register2.dart';

class Login2 extends StatefulWidget {
  const Login2({super.key});

  @override
  State<Login2> createState() => _Login2State();
}

class _Login2State extends State<Login2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page 2'),
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
                    builder: (context) => Register2(),
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

  txtfield(text) => TextFormField(
        decoration: InputDecoration(
          border: const UnderlineInputBorder(),
          labelText: text,
        ),
      );
  button(text, icon) => TextButton.icon(
        onPressed: () {},
        icon: Icon(
          icon,
          size: 24.0,
        ),
        label: Text(text),
      );
}
