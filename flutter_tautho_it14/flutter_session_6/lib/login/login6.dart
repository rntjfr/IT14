import 'package:flutter/material.dart';
import 'package:flutter_session_6/register/register6.dart';

class Login6 extends StatefulWidget {
  const Login6({super.key});

  @override
  State<Login6> createState() => _Login6State();
}

class _Login6State extends State<Login6> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page 6'),
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
                    builder: (context) => Register6(),
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
          labelText: text,
          icon: const Icon(Icons.people), //icon at head of input
        ),
      );
  button(text, icon) => SizedBox.fromSize(
        size: const Size(56, 56),
        child: ClipOval(
          child: Material(
            color: Colors.blue,
            child: InkWell(
              splashColor: Colors.green,
              onTap: () {},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    color: Colors.white,
                  ),
                  Text(
                    text,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
