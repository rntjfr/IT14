
import 'package:flutter/material.dart';
import 'package:flutter_session_6/model/validation.dart';
import 'package:flutter_session_6/profileview.dart';

class LoginValidate extends StatefulWidget {
  const LoginValidate({super.key});

  @override
  State<LoginValidate> createState() => _LoginValidateState();
}

class _LoginValidateState extends State<LoginValidate> with InputValidationMix {
  TextEditingController? txtemail;
  TextEditingController? txtpass;
  final formGlobalKey = GlobalKey<FormState>();

  @override
  void initState() {
    txtemail = TextEditingController();
    txtpass = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Validation'),
        centerTitle: true,
      ),
      body: Form(
        key: formGlobalKey,
        child: Column(
          children: [
            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.all(5),
              child: TextFormField(
                controller: txtemail,
                validator: (email) {
                  if (isEmailValid(email!)) {
                    return null;
                  } else {
                    return 'Please enter a valid email address.';
                  }
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter email',
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(5),
              child: TextFormField(
                obscureText: true,
                controller: txtpass,
                validator: (password) {
                  if (isPasswordValid(password!)) {
                    return null;
                  } else {
                    return 'Please enter a valid password';
                  }
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter password',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (formGlobalKey.currentState!.validate()) {
                  gotoProfile();
                }
              },
              child: const Text('Submit'),
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
}
