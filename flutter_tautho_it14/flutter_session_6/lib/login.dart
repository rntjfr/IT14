import 'package:flutter/material.dart';
import 'package:flutter_session_6/model/validation.dart';
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

class _LoginState extends State<Login> with InputValidationMix {
  final formGlobalKey = GlobalKey<FormState>();
  String user = 'adenrx@gmail.com';
  String pass = 'bypass';
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
        child: Form(
          key: formGlobalKey,
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
                child: TextFormField(
                  validator: (email) {
                    if (!isEmailValid(email!)) {
                      return 'Please enter a valid email';
                    } else {
                      return null;
                    }
                  },
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
                child: TextFormField(
                  validator: (password) {
                    if (!isPasswordValid(password!)) {
                      return 'Please enter a valid password';
                    } else if (!isPasswordCorrect(
                        usernamecontroller.text, user, password, pass)) {
                      return 'The account does not exist';
                    } else {
                      return null;
                    }
                  },
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
                    if (formGlobalKey.currentState!.validate()) {
                      if (isPasswordCorrect(usernamecontroller.text, user,
                          passwordcontroller.text, pass)) {
                        gotoProfile();
                      }
                    }
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
