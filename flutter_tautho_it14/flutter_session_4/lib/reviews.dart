import 'package:flutter/material.dart';

class Reviews extends StatelessWidget {
  Reviews({
    super.key,
    required this.reviewcount,
    required this.star,
  });

  int reviewcount;
  int star;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          displayStars(star),
          const SizedBox(
            width: 15,
          ),
          Text(
            '$reviewcount Reviews',
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  displayStars(star) => Row(
        children: [
          for (int i = 1; i <= star; i++)
            const Icon(
              Icons.star,
              color: Colors.pink,
            ),
          for (int i = star; i < 5; i++)
            const Icon(
              Icons.star_border_outlined,
            ),
        ],
      );
}
