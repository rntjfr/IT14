import 'package:flutter/material.dart';

class ImageSample extends StatelessWidget {
  const ImageSample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Sample'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: Image.asset(
                'assets/photo_cat_2.jpg',
                height: 150,
                width: 150,
              ),
            ),
            Expanded(
              flex: 3,
              child: Image.asset(
                'assets/photo_cat_3.jpg',
                height: 150,
                width: 150,
              ),
            ),
            Expanded(
              flex: 3,
              child: Image.asset(
                'assets/photo_cat_1.jpg',
                height: 150,
                width: 150,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
