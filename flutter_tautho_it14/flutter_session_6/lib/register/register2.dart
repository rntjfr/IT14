import 'package:flutter/material.dart';
import 'package:flutter_session_6/login/login2.dart';

class Register2 extends StatefulWidget {
  const Register2({super.key});

  @override
  State<Register2> createState() => _Register2State();
}

class _Register2State extends State<Register2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Page 2'),
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
                        builder: (context) => const Login2(),
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
