import 'package:flutter/material.dart';
import 'package:flutter_final_project/modal/validate.dart';
import 'package:flutter_final_project/page1.dart';
import 'package:flutter_final_project/register.dart';
import 'package:flutter_final_project/sample.dart';

class Login extends StatefulWidget {
  Login({
    super.key,
    this.email,
    this.password,
  });

  String? email;
  String? password;

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> with InputValidationMix {
  final formGlobalKey = GlobalKey<FormState>();
  String email = 'adenrx@gmail.com';
  String pass = 'bypass';
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  @override
  void initState() {
    if (widget.email != null && widget.email != "") {
      emailcontroller.text = widget.email.toString();
      email = widget.email.toString();
    }
    if (widget.password != null && widget.password != "") {
      passwordcontroller.text = widget.password.toString();
      pass = widget.password.toString();
    }
    super.initState();
    print('user: $email and pass: $pass');
  }

  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'LOGIN YOUR ACCOUNT',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    color: Colors.deepPurple),
              ),
              const SizedBox(height: 10),
              Form(
                key: formGlobalKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 8),
                      child: TextFormField(
                        validator: (email) {
                          if (!isEmailValid(email!)) {
                            return 'Please enter a valid email';
                          } else {
                            return null;
                          }
                        },
                        controller: emailcontroller,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          labelText: 'Enter email',
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 8),
                      child: TextFormField(
                        validator: (password) {
                          if (!isPasswordValid(password!)) {
                            return 'Please enter a valid password';
                          } else if (!isPasswordCorrect(
                              emailcontroller.text, email, password, pass)) {
                            return 'The account does not exist';
                          } else {
                            return null;
                          }
                        },
                        obscureText: true,
                        controller: passwordcontroller,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          labelText: 'Enter Password',
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(18),
                    minimumSize: Size(MediaQuery.of(context).size.width, 0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    if (formGlobalKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Dummy(),
                        ),
                      );
                    }
                  },
                  child: const Text(
                    'LOGIN',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Register(),
                    ),
                  );
                },
                child: const Center(
                  child: Text(
                    'Create an Account',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.deepPurple),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
