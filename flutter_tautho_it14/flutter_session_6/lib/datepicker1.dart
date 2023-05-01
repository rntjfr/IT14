import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DatePicker1 extends StatefulWidget {
  const DatePicker1({super.key});

  @override
  State<DatePicker1> createState() => _DatePicker1State();
}

class _DatePicker1State extends State<DatePicker1> {
  DateTime dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Date Picker 1'),
      ),
      body: Center(
        child: buildDatePicker(),
      ),
    );
  }

  buildDatePicker() => CupertinoDatePicker(
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
      );
}
