import 'package:flutter/material.dart';
import 'package:flutter_1st_lab_exam/login.dart';
import 'package:flutter_1st_lab_exam/model/account.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  late TextEditingController txtcontroller1,
      txtcontroller2,
      txtcontroller3,
      txtcontroller4,
      txtcontroller5,
      txtcontroller6,
      txtcontroller7;
  late String msg;
  late bool isError;

  @override
  void initState() {
    txtcontroller1 = TextEditingController();
    txtcontroller2 = TextEditingController();
    txtcontroller3 = TextEditingController();
    txtcontroller4 = TextEditingController();
    txtcontroller5 = TextEditingController();
    txtcontroller6 = TextEditingController();
    txtcontroller7 = TextEditingController();
    msg = '';
    isError = false;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    txtcontroller1.dispose();
    txtcontroller2.dispose();
    txtcontroller3.dispose();
    txtcontroller4.dispose();
    txtcontroller5.dispose();
    txtcontroller6.dispose();
    txtcontroller7.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          bottomOpacity: 0.0,
          elevation: 0.0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.grey,
            ),
          )),
      body: ListView(
        children: [
          Center(
            child: Column(
              children: [
                const Text(
                  'REGISTER',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                      color: Colors.cyan),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      txtfield('Enter name', txtcontroller1),
                      txtfield('Enter username', txtcontroller2),
                      txtfield('Enter password', txtcontroller3),
                      txtfield('Enter confirm password', txtcontroller4),
                      txtfield('Enter gender', txtcontroller5),
                      txtfield('Enter civil status', txtcontroller6),
                      txtfield('Enter birthday', txtcontroller7)
                    ],
                  ),
                ),
                button('REGISTER'),
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
                        builder: (context) => Login(
                          account:
                              Account(username: 'user1', password: 'password1'),
                        ),
                      ),
                    ),
                  },
                  child: const Center(
                    child: Text(
                      'Login Instead',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.cyan),
                    ),
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

  txtfield(text, txtcontroller) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: TextFormField(
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
                  txtcontroller3.text,
                  txtcontroller4.text,
                  txtcontroller5.text,
                  txtcontroller6.text,
                  txtcontroller7.text);
            });
          },
          child: Text(
            text,
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      );
  checkCredentials(txt1, txt2, txt3, txt4, txt5, txt6, txt7) {
    if (txt1 == '') {
      msg = 'Please enter your name';
      isError = true;
    } else if (txt2.isEmpty) {
      msg = 'Please enter your username';
      isError = true;
    } else if (txt3.isEmpty) {
      msg = 'Please enter your password';
      isError = true;
    } else if (txt4.isEmpty) {
      msg = 'Please enter your confirm password';
      isError = true;
    } else if (txt5.isEmpty) {
      msg = 'Please enter your gender';
      isError = true;
    } else if (txt6.isEmpty) {
      msg = 'Please enter your civil status';
      isError = true;
    } else if (txt7.isEmpty) {
      msg = 'Please enter your birthday';
      isError = true;
    } else if (txt3 != txt4) {
      msg = 'Password does not match';
      isError = true;
    } else {
      isError = false;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Login(
            account: Account(username: txt2, password: txt3),
          ),
        ),
      );
    }
  }
}
