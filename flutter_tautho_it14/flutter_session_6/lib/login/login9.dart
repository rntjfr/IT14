import 'package:flutter/material.dart';
import 'package:flutter_session_6/register/register9.dart';

class Login9 extends StatefulWidget {
  const Login9({super.key});

  @override
  State<Login9> createState() => _Login9State();
}

class _Login9State extends State<Login9> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page 9'),
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
                    builder: (context) => Register9(),
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

  button(text, icon) => SizedBox(
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