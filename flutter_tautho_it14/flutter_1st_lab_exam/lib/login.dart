import 'package:flutter/material.dart';
import 'package:flutter_1st_lab_exam/model/account.dart';
import 'package:flutter_1st_lab_exam/profileview.dart';
import 'package:flutter_1st_lab_exam/register.dart';

class Login extends StatefulWidget {
  Login({
    super.key,
    this.account,
  });

  Account? account;

  @override
  State<Login> createState() => _LoginState(account!);
}

class _LoginState extends State<Login> {
  late TextEditingController txtcontroller1, txtcontroller2;
  late String msg;
  late bool isMatched;
  late bool isError;

  _LoginState(this.account);

  @override
  void initState() {
    msg = '';
    isMatched = false;
    isError = false;
    txtcontroller1 = TextEditingController(text: account.username);
    txtcontroller2 = TextEditingController(text: account.password);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    txtcontroller1.dispose();
    txtcontroller2.dispose();
  }

  final Account account;

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
                    color: Colors.cyan),
              ),
              const SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  txtfield('Enter username', txtcontroller1, false),
                  const SizedBox(height: 5),
                  txtfield('Enter password', txtcontroller2, true),
                  const SizedBox(height: 10),
                ],
              ),
              button('LOGIN'),
              const SizedBox(height: 10),
              if (isError)
                Text(
                  msg,
                  style: const TextStyle(fontSize: 15, color: Colors.red),
                ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Register(),
                    ),
                  ),
                },
                child: const Center(
                  child: Text(
                    'Create an Account',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.cyan),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Account account1 = Account(
    username: 'user1',
    password: 'password1',
  );

  txtfield(text, txtcontroller, state) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: TextFormField(
          obscureText: state,
          controller: txtcontroller,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            labelText: text,
          ),
        ),
      );
  button(text) => Container(
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
            setState(() {
              checkCredentials(
                txtcontroller1.text,
                txtcontroller2.text,
              );
            });
          },
          child: Text(
            text,
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      );

  checkCredentials(txt1, txt2) {
    isMatched = (account1.username == txt1 && account1.password == txt2 ||
            account.username == txt1 && account.password == txt2)
        ? true
        : false;
    if (txt1.isEmpty) {
      msg = 'Please enter your username';
      isError = true;
    } else if (txt2.isEmpty) {
      msg = 'Please enter your password';
      isError = true;
    } else if (isMatched) {
      isError = false;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProfileView(),
        ),
      );
    } else {
      isError = true;
      msg = 'Incorrect username or password';
    }
  }
}
