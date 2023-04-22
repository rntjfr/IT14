import 'package:flutter/material.dart';
import 'package:flutter_session_6/login/login8.dart';

class Register8 extends StatefulWidget {
  const Register8({super.key});

  @override
  State<Register8> createState() => _Register8State();
}

class _Register8State extends State<Register8> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Page 8'),
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
                const SizedBox(height: 5),
                FloatingActionButton.extended(
                  label: const Text('Upload'), // <-- Text
                  backgroundColor: Colors.black,
                  icon: const Icon(
                    // <-- Icon
                    Icons.upload,
                    size: 24.0,
                  ),
                  onPressed: () {},
                ),
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
                        builder: (context) => const Login8(),
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

  txtfield(text) => TextField(
        decoration: InputDecoration(
          labelText: text,
          icon: const Icon(Icons.people), //icon at head of input
        ),
      );
  button(text, icon) => ElevatedButton.icon(
        // <-- ElevatedButton
        onPressed: () {},
        icon: Icon(
          icon,
          size: 24.0,
        ),
        label: Text(text),
      );
}
