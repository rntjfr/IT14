import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DatePicker2 extends StatefulWidget {
  const DatePicker2({super.key});

  @override
  State<DatePicker2> createState() => _DatePicker2State();
}

class _DatePicker2State extends State<DatePicker2> {
  DateTime dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Date Picker 2'),
      ),
      body: Center(
        child: buildDatePicker(),
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
              },
            );
          },
        ),
      );
}
