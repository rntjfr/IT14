import 'package:flutter/material.dart';
import 'package:flutter_session_6/register/register8.dart';

class Login8 extends StatefulWidget {
  const Login8({super.key});

  @override
  State<Login8> createState() => _Login8State();
}

class _Login8State extends State<Login8> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page 8'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Enter Email Address'),
                SizedBox(height: 10),
                TextField(
                    decoration: InputDecoration(
                  labelText: "Email",
                  icon: Icon(Icons.people), //icon at head of input
                )),
                SizedBox(height: 10),
                Text('Enter Password'),
                SizedBox(height: 10),
                TextField(
                    decoration: InputDecoration(
                        icon: Icon(Icons.lock), //icon at head of input
                        //prefixIcon: Icon(Icons.people), //you can use prefixIcon property too.
                        labelText: "Password",
                        suffixIcon:
                            Icon(Icons.remove_red_eye) //icon at tail of input
                        )),
                SizedBox(height: 10),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton.extended(
                  label: const Text('Login'), // <-- Text
                  backgroundColor: Colors.black,
                  icon: const Icon(
                    // <-- Icon
                    Icons.login,
                    size: 24.0,
                  ),
                  onPressed: () {},
                ),
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
                    builder: (context) => Register8(),
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
