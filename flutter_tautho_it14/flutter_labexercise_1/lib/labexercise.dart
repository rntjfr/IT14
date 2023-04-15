import 'package:flutter/material.dart';

class LabExercise extends StatelessWidget {
  const LabExercise({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Task 1'),
        ),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            child: Image.asset(
              'assets/photo_male_2.jpg',
              height: 100,
              width: 100,
            ),
          ),
          const Expanded(
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'My name is ',
                    style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontSize: 18,
                    ),
                  ),
                  TextSpan(
                    text: 'Rexdan N. Tautho ',
                    style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  TextSpan(
                    text: 'a 3rd year BSIT student of ',
                    style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontSize: 18,
                    ),
                  ),
                  TextSpan(
                    text: 'University of Mindanao. ',
                    style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  TextSpan(
                    text: 'My current subject is ',
                    style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontSize: 18,
                    ),
                  ),
                  TextSpan(
                    text:
                        'IT14/L - IT Professional Track 5 (Mobile Programming.) ',
                    style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  TextSpan(
                    text: 'The name of my teacher is ',
                    style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontSize: 18,
                    ),
                  ),
                  TextSpan(
                    text: 'Prof. Reban Cliff Fajardo ',
                    style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
