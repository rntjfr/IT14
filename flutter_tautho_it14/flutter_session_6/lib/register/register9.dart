import 'package:flutter/material.dart';
import 'package:flutter_session_6/login/login9.dart';

class Register9 extends StatefulWidget {
  const Register9({super.key});

  @override
  State<Register9> createState() => _Register9State();
}

class _Register9State extends State<Register9> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Page 9'),
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
                        builder: (context) => const Login9(),
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
            icon: const Icon(Icons.lock), //icon at head of input
            //prefixIcon: Icon(Icons.people), //you can use prefixIcon property too.
            labelText: text,
            suffixIcon: const Icon(Icons.remove_red_eye) //icon at tail of input
            ),
      );
  button(text) => SizedBox(
      height: 40, //height of button
      width: 120, //width of button
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Colors.redAccent, //background color of button
              side: const BorderSide(
                  width: 3, color: Colors.black), //border width and color
              elevation: 3, //elevation of button
              shape: RoundedRectangleBorder(
                  //to set border radius to button
                  borderRadius: BorderRadius.circular(30)),
              padding: const EdgeInsets.all(5) //content padding inside button
              ),
          onPressed: () {},
          child: Text(text)));
}
