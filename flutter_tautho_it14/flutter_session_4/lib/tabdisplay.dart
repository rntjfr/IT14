import 'package:flutter/material.dart';

class TabDisplay extends StatelessWidget {
  TabDisplay({
    super.key,
    required this.iconval,
    required this.text1,
    required this.text2,
  });

  IconData iconval;
  String text1;
  String text2;

  var txtbold = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(5),
          child: Icon(
            iconval,
            size: 30,
            color: Colors.pink,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(5),
          child: Text(
            text1,
            style: txtbold,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(5),
          child: Text(
            text2,
            style: txtbold,
          ),
        ),
      ],
    );
  }
}
