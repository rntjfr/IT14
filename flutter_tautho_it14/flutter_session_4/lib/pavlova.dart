import 'package:flutter/material.dart';
import 'package:flutter_session_4/reviews.dart';
import 'package:flutter_session_4/tabdisplay.dart';

class Pavlova extends StatelessWidget {
  Pavlova({super.key});

  String description = 'Pavlova is a meringue-based '
      'dessert named after the Russian '
      'ballerina Ana Pavlova. Pavlova '
      'features a crisp crust and soft, '
      'light inside, topped with fruit '
      'and whipped cream';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Pavlova')),
      ),
      body: ListView(
        children: [
          column1(),
          column2(),
        ],
      ),
    );
  }

  column1() => Image.asset('assets/pavlova.jpeg');
  column2() => Column(
        children: [
          title(),
          descriptionText(),
          Reviews(reviewcount: 1000, star: 4),
          tabs(),
        ],
      );
  title() => Container(
        padding: const EdgeInsets.all(15),
        child: const Text(
          'Strawberry Pavlova',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
  descriptionText() => Container(
        margin: const EdgeInsets.all(10),
        child: Text(
          description,
          textAlign: TextAlign.justify,
          style: const TextStyle(
            fontSize: 25,
          ),
        ),
      );
  tabs() => Container(
        margin: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TabDisplay(
              iconval: Icons.kitchen,
              text1: 'PREP',
              text2: '25 min',
            ),
            TabDisplay(
              iconval: Icons.timer,
              text1: 'COOK',
              text2: '1 hr',
            ),
            TabDisplay(
              iconval: Icons.restaurant,
              text1: 'FEEDS',
              text2: '4 - 6',
            ),
          ],
        ),
      );
}
