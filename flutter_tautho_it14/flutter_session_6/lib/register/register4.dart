import 'package:flutter/material.dart';
import 'package:flutter_session_6/login/login4.dart';

class Register4 extends StatefulWidget {
  const Register4({super.key});

  @override
  State<Register4> createState() => _Register4State();
}

class _Register4State extends State<Register4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Page 4'),
      ),
      body: ListView(
        children: [
          Center(
            child: Column(
              children: [
                SizedBox(
                  height: 240,
                  child: Image.asset('assets/noimage.jpg'),
                ),
                const SizedBox(
                  height: 5,
                ),
                button('Upload', Icons.upload),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Enter Name'),
                      const SizedBox(height: 10),
                      txtfield('Name'),
                      const SizedBox(height: 10),
                      const Text('Enter Email Address'),
                      const SizedBox(height: 10),
                      txtfield('Email Address'),
                      const SizedBox(height: 10),
                      const Text('Enter Password'),
                      const SizedBox(height: 10),
                      txtfield('Password'),
                      const SizedBox(height: 10),
                      const Text('Enter Confirm Password'),
                      const SizedBox(height: 10),
                      txtfield('Confirm Password'),
                      const SizedBox(height: 10),
                      const Text('Enter Gender'),
                      const SizedBox(height: 10),
                      txtfield('Gender'),
                      const SizedBox(height: 10),
                      const Text('Enter Civil Status'),
                      const SizedBox(height: 10),
                      txtfield('Civil Status'),
                      const SizedBox(height: 10),
                      const Text('Enter Birthdate'),
                      const SizedBox(height: 10),
                      txtfield('Birthdate')
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    button('Login', Icons.login),
                    const SizedBox(width: 10),
                    button('Cancel', Icons.cancel_outlined),
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
                        builder: (context) => const Login4(),
                      ),
                    ),
                  },
                  child: const Center(
                    child: Text('Login Instead'),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ],
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
