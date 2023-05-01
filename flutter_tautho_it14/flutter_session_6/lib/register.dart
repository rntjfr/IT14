import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session_6/login.dart';
import 'package:intl/intl.dart';

class Register1 extends StatefulWidget {
  const Register1({super.key});

  @override
  State<Register1> createState() => _Register1State();
}

class _Register1State extends State<Register1> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController cpasswordcontroller = TextEditingController();
  TextEditingController gendercontroller = TextEditingController();
  TextEditingController civilstatuscontroller = TextEditingController();
  TextEditingController birthdatecontroller = TextEditingController();
  String errmsg = '';
  bool isError = false;
  DateTime dateTime = DateTime.now();

  final gender = [
    'Male',
    'Female',
  ];
  final civilstatus = [
    'Single',
    'Married',
    'Separated',
    'Widowed',
  ];

  @override
  void initState() {
    super.initState();
    gendercontroller = TextEditingController(text: gender[0]);
    civilstatuscontroller = TextEditingController(text: civilstatus[0]);
    birthdatecontroller =
        TextEditingController(text: DateFormat('MM/dd/yyyy').format(dateTime));
  }

  @override
  void dispose() {
    super.dispose();
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'REGISTER',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: TextField(
                    controller: namecontroller,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter name',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: TextField(
                    controller: emailcontroller,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter email',
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
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: TextField(
                    obscureText: true,
                    controller: cpasswordcontroller,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter confirm password',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: TextField(
                    readOnly: true,
                    onTap: () {
                      showCupertinoModalPopup(
                        context: context,
                        builder: (context) => CupertinoActionSheet(
                          actions: [buildgenderpicker()],
                          cancelButton: CupertinoActionSheetAction(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Cancel'),
                          ),
                        ),
                      );
                    },
                    controller: gendercontroller,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter gender',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: TextField(
                    readOnly: true,
                    onTap: () {
                      showCupertinoModalPopup(
                        context: context,
                        builder: (context) => CupertinoActionSheet(
                          actions: [buildcivilstatuspicker()],
                          cancelButton: CupertinoActionSheetAction(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Cancel'),
                          ),
                        ),
                      );
                    },
                    controller: civilstatuscontroller,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter civil status',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: TextField(
                    readOnly: true,
                    onTap: () {
                      showCupertinoModalPopup(
                        context: context,
                        builder: (context) => CupertinoActionSheet(
                          actions: [buildDatePicker()],
                          cancelButton: CupertinoActionSheetAction(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Cancel'),
                          ),
                        ),
                      );
                    },
                    controller: birthdatecontroller,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter birthdate',
                    ),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: ElevatedButton(
                    onPressed: () {
                      validate();
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                    ),
                    child: const Text(
                      'REGISTER',
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
                    gotoLogin('', '');
                  },
                  child: const Text(
                    'Login Instead',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  gotoLogin(username, password) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Login(
          username: username,
          password: password,
        ),
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
  validate() {
    setState(() {
      String name = namecontroller.text;
      String email = emailcontroller.text;
      String password = passwordcontroller.text;
      String cpassword = cpasswordcontroller.text;
      String gender = gendercontroller.text;
      String civilstatus = civilstatuscontroller.text;
      String birthdate = birthdatecontroller.text;

      if (name == "" || name == null) {
        errmsg = "Please enter your name";
        isError = true;
      } else if (email == "" || email == null) {
        errmsg = "Please enter your email address";
        isError = true;
      } else if (password == "" || password == null) {
        errmsg = "Please enter your password";
        isError = true;
      } else if (cpassword == "" || cpassword == null) {
        errmsg = "Please enter your confirm password";
        isError = true;
      } else if (gender == "" || gender == null) {
        errmsg = "Please enter your gender";
        isError = true;
      } else if (civilstatus == "" || civilstatus == null) {
        errmsg = "Please enter your civil status";
        isError = true;
      } else if (birthdate == "" || birthdate == null) {
        errmsg = "Please enter your birthdate";
        isError = true;
      } else if (password != cpassword) {
        errmsg = "Both passwords must be the same";
        isError = true;
      } else {
        isError = false;
        errmsg = '';
        gotoLogin(email, password);
      }
    });
  }

  buildgenderpicker() => SizedBox(
        height: 180,
        child: StatefulBuilder(
          builder: (context, setState) => CupertinoPicker(
            looping: false,
            itemExtent: 64,
            onSelectedItemChanged: (index) {
              setState(
                () {
                  final selectedgender = gender[index];
                  print('Selected gender: $selectedgender');
                  gendercontroller.text = selectedgender;
                },
              );
            },
            children: List.generate(gender.length, (index) {
              final selectedgender = gender[index];
              return Center(
                child: Text(
                  selectedgender,
                ),
              );
            }),
          ),
        ),
      );
  buildcivilstatuspicker() => SizedBox(
        height: 180,
        child: StatefulBuilder(
          builder: (context, setState) => CupertinoPicker(
            looping: false,
            itemExtent: 64,
            onSelectedItemChanged: (index) {
              setState(
                () {
                  final selectedsivilstatus = civilstatus[index];
                  print('Selected civil status: $selectedsivilstatus');
                  civilstatuscontroller.text = selectedsivilstatus;
                },
              );
            },
            children: List.generate(civilstatus.length, (index) {
              final selectedsivilstatus = civilstatus[index];
              return Center(
                child: Text(
                  selectedsivilstatus,
                ),
              );
            }),
          ),
        ),
      );

  buildDatePicker() => SizedBox(
        height: 180,
        child: CupertinoDatePicker(
          mode: CupertinoDatePickerMode.date,
          initialDateTime: dateTime,
          minimumYear: 1990,
          maximumYear: dateTime.year,
          onDateTimeChanged: (selectedDate) {
            setState(
              () {
                dateTime = selectedDate;
                final value = DateFormat('MM/dd/yyyy').format(dateTime);
                birthdatecontroller.text = value;
              },
            );
          },
        ),
      );
}
