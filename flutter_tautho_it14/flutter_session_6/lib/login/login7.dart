import 'package:flutter/material.dart';
import 'package:flutter_session_6/register/register7.dart';

class Login7 extends StatefulWidget {
  const Login7({super.key});

  @override
  State<Login7> createState() => _Login7State();
}

class _Login7State extends State<Login7> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page 7'),
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
                button('Login'),
                const SizedBox(width: 10),
                button('Cancel')
              ],
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Register7(),
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
            icon: const Icon(Icons.lock), //icon at head of input
            //prefixIcon: Icon(Icons.people), //you can use prefixIcon property too.
            labelText: text,
            suffixIcon: const Icon(Icons.remove_red_eye) //icon at tail of input
            ),
      );
  button(text) => GestureDetector(
        onTap: () {},
        child: Container(
          width: 120,
          height: 40,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.blue[200],
          ),
          child: Text(text),
        ),
      );
}
