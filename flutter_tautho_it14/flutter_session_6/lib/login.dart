import 'package:flutter/material.dart';
import 'package:flutter_session_6/profileview.dart';
import 'package:flutter_session_6/register.dart';

class Login extends StatefulWidget {
  Login({
    super.key,
    this.username,
    this.password,
  });

  String? username;
  String? password;

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isError = false;
  String errmsg = '';
  String user = 'adenrx';
  String pass = '7699';
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  @override
  void initState() {
    if (widget.username != null && widget.username != "") {
      usernamecontroller.text = widget.username.toString();
      user = widget.username.toString();
    }
    if (widget.password != null && widget.password != "") {
      passwordcontroller.text = widget.password.toString();
      pass = widget.password.toString();
    }
    super.initState();
    print('user: $user and pass: $pass');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'LOGIN YOUR ACCOUNT',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: TextField(
                controller: usernamecontroller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter username',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: TextField(
                obscureText: true,
                controller: passwordcontroller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter password',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    String username = usernamecontroller.text;
                    String password = passwordcontroller.text;
                    if (username == "" || username == null) {
                      errmsg = "Please enter your username";
                      isError = true;
                    } else if (password == "" || password == null) {
                      errmsg = "Please enter your password";
                      isError = true;
                    } else if (user != username || pass != password) {
                      errmsg = "Incorrect username or password!";
                      isError = true;
                    } else {
                      isError = false;
                      errmsg = '';
                      gotoProfile();
                    }
                  });
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
                child: const Text(
                  'LOGIN',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            isError ? displayError(errmsg) : Container(),
            TextButton(
              onPressed: () {
                gotoRegister();
              },
              child: const Text(
                'Create an Account',
              ),
            ),
          ],
        ),
      ),
    );
  }

  gotoProfile() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProfileView(),
      ),
    );
  }

  gotoRegister() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Register1(),
      ),
    );
  }

  displayError(errmsg) => Container(
        padding: const EdgeInsets.all(5),
        child: Text(
          '* $errmsg',
          style: const TextStyle(
            color: Colors.red,
            fontSize: 16,
          ),
        ),
      );
}
