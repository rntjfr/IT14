import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_final_project_2/login.dart';
import 'package:flutter_final_project_2/modal/validate.dart';
import 'package:intl/intl.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> with InputValidationMix {
  final formGlobalKey = GlobalKey<FormState>();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController cpasswordcontroller = TextEditingController();
  TextEditingController gendercontroller = TextEditingController();
  TextEditingController civilstatuscontroller = TextEditingController();
  TextEditingController birthdatecontroller = TextEditingController();
  DateTime dateTime = DateTime.now();

  final gender = [
    '',
    'Male',
    'Female',
  ];
  final civilstatus = [
    '',
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
    birthdatecontroller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Center(
            child: Column(
              children: [
                const SizedBox(height: 20),
                const Text(
                  'REGISTER',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                      color: Colors.deepPurple),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Form(
                    key: formGlobalKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 8),
                          child: TextFormField(
                            validator: (name) {
                              if (isNameValid(name!)) {
                                return null;
                              } else {
                                return 'Please enter your name';
                              }
                            },
                            controller: namecontroller,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              labelText: 'Enter your name',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 8),
                          child: TextFormField(
                            validator: (email) {
                              if (isEmailValid(email!)) {
                                return null;
                              } else {
                                return 'Please enter a valid email';
                              }
                            },
                            controller: emailcontroller,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              labelText: 'Enter your email',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 8),
                          child: TextFormField(
                            validator: (password) {
                              if (!isPasswordsSame(
                                  password!, cpasswordcontroller.text)) {
                                return 'Both password must be the same';
                              } else if (isPasswordValid(password)) {
                                return null;
                              } else {
                                return 'Please enter a valid password';
                              }
                            },
                            controller: passwordcontroller,
                            obscureText: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              labelText: 'Enter password',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 8),
                          child: TextFormField(
                            validator: (cpassword) {
                              if (!isPasswordsSame(
                                  passwordcontroller.text, cpassword!)) {
                                return 'Both password must be the same';
                              } else if (isPasswordValid(cpassword)) {
                                return null;
                              } else {
                                return 'Please enter a valid password';
                              }
                            },
                            controller: cpasswordcontroller,
                            obscureText: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              labelText: 'Enter confirm password',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 8),
                          child: TextFormField(
                            validator: (gender) {
                              if (isGenderValid(gender!)) {
                                return null;
                              } else {
                                return 'Please select gender';
                              }
                            },
                            readOnly: true,
                            onTap: () {
                              showCupertinoModalPopup(
                                context: context,
                                builder: (context) => CupertinoActionSheet(
                                  actions: [buildGenderPicker()],
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
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              labelText: 'Select gender',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 8),
                          child: TextFormField(
                            validator: (civilstatus) {
                              if (isCivilStatusValid(civilstatus!)) {
                                return null;
                              } else {
                                return 'Please select civil status';
                              }
                            },
                            readOnly: true,
                            onTap: () {
                              showCupertinoModalPopup(
                                context: context,
                                builder: (context) => CupertinoActionSheet(
                                  actions: [buildCivilStatusPicker()],
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
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              labelText: 'Select civil status',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 8),
                          child: TextFormField(
                            validator: (birthdate) {
                              if (isBirthdateValid(birthdate!)) {
                                return null;
                              } else {
                                return 'Please select birthdate';
                              }
                            },
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
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              labelText: 'Select birthdate',
                            ),
                          ),
                        ),
                      ],
                    ),
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
                        gotoLogin(
                          emailcontroller.text,
                          passwordcontroller.text,
                        );
                      }
                    },
                    child: const Text(
                      'REGISTER',
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
                    gotoLogin('', '');
                  },
                  child: const Center(
                    child: Text(
                      'Login Instead',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurpleAccent),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  gotoLogin(email, password) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Login(
          email: email,
          password: password,
        ),
      ),
    );
  }

  buildGenderPicker() => SizedBox(
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
  buildCivilStatusPicker() => SizedBox(
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
          //initialDateTime: dateTime,
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
