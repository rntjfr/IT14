import 'package:flutter/material.dart';
import 'package:flutter_session_6/login/login5.dart';

class Register5 extends StatefulWidget {
  const Register5({super.key});

  @override
  State<Register5> createState() => _Register5State();
}

class _Register5State extends State<Register5> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Page 5'),
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
                button('Upload'),
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
                    button(
                      'Login',
                    ),
                    const SizedBox(width: 10),
                    button(
                      'Cancel',
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
                        builder: (context) => const Login5(),
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
                width: 1, color: Colors.purple, style: BorderStyle.solid)),
        child: TextField(
          minLines: 1,
          maxLines: 1,
          decoration: InputDecoration(
              hintText: text,
              contentPadding: const EdgeInsets.all(15),
              border: InputBorder.none),
          onChanged: (value) {},
        ),
      );
  button(text) => ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
        ),
        child: Text(text),
        onPressed: () {},
      );
}
