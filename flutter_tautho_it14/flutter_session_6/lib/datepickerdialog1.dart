import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePickerDialog1 extends StatefulWidget {
  const DatePickerDialog1({super.key});

  @override
  State<DatePickerDialog1> createState() => _DatePickerDialog1State();
}

class _DatePickerDialog1State extends State<DatePickerDialog1> {
  DateTime dateTime = DateTime.now();
  late TextEditingController datecontroller;

  @override
  void initState() {
    super.initState();
    datecontroller = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    datecontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Date Picker Dialog 1'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            child: CupertinoTextField(
              controller: datecontroller,
              readOnly: true,
              enableInteractiveSelection: false,
              textAlign: TextAlign.center,
              decoration: BoxDecoration(
                border: Border.all(width: 2),
                borderRadius: BorderRadius.circular(12),
              ),
              style: const TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20),
          CupertinoButton.filled(
            child: const Text('Open Date Picker'),
            onPressed: () {
              showCupertinoModalPopup(
                context: context,
                builder: (context) => CupertinoActionSheet(
                  actions: [buildDatePicker()],
                  cancelButton: CupertinoActionSheetAction(
                    child: const Text('Cancel'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

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
                datecontroller.text = value;
              },
            );
          },
        ),
      );
}
