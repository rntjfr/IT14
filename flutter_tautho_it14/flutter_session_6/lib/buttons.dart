import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  const Buttons({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            ElevatedButton.icon(
              // <-- ElevatedButton
              onPressed: () {},
              icon: const Icon(
                Icons.download,
                size: 24.0,
              ),
              label: const Text('Download'),
            ),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.download,
                size: 24.0,
              ),
              label: const Text('Download'),
            ),
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.download,
                size: 24.0,
              ),
              label: const Text('Download'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text('Download'),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.download,
                    size: 24.0,
                  ),
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
              ),
              child: const Text('Pill Button'),
              onPressed: () {},
            ),
            SizedBox.fromSize(
              size: const Size(56, 56),
              child: ClipOval(
                child: Material(
                  color: Colors.blue,
                  child: InkWell(
                    splashColor: Colors.green,
                    onTap: () {},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                        ),
                        Text(
                          "Buy",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                width: 240,
                height: 80,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.blue[200],
                ),
                child: const Text('Button'),
              ),
            ),
            FloatingActionButton.extended(
              label: const Text('Download'), // <-- Text
              backgroundColor: Colors.black,
              icon: const Icon(
                // <-- Icon
                Icons.download,
                size: 24.0,
              ),
              onPressed: () {},
            ),
            SizedBox(
                height: 100, //height of button
                width: 300, //width of button
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.redAccent, //background color of button
                        side: const BorderSide(
                            width: 3,
                            color: Colors.black), //border width and color
                        elevation: 3, //elevation of button
                        shape: RoundedRectangleBorder(
                            //to set border radius to button
                            borderRadius: BorderRadius.circular(30)),
                        padding: const EdgeInsets.all(
                            20) //content padding inside button
                        ),
                    onPressed: () {
                      //code to execute when this button is pressed.
                    },
                    child: const Text("Elevated Button"))),
          ],
        ),
      ),
    );
  }
}
