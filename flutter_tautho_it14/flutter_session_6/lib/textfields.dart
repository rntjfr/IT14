import 'package:flutter/material.dart';

class TextFields extends StatelessWidget {
  const TextFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter a search term',
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Enter your username',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30),
                child: Center(
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: 'KindaCode.com',
                        contentPadding: const EdgeInsets.all(15),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30))),
                    onChanged: (value) {
                      // do something
                    },
                  ),
                ),
              ),
              Container(
                width: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                        width: 1,
                        color: Color.fromARGB(255, 21, 13, 22),
                        style: BorderStyle.solid)),
                child: TextField(
                  decoration: const InputDecoration(
                      hintText: 'Type something here',
                      contentPadding: EdgeInsets.all(15),
                      border: InputBorder.none),
                  onChanged: (value) {
                    // Do something
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                        width: 1,
                        color: Colors.purple,
                        style: BorderStyle.solid)),
                child: TextField(
                  minLines: 10,
                  maxLines: 20,
                  decoration: const InputDecoration(
                      hintText: 'Type something here',
                      contentPadding: EdgeInsets.all(15),
                      border: InputBorder.none),
                  onChanged: (value) {},
                ),
              ),
              const TextField(
                  decoration: InputDecoration(
                labelText: "Username",
                icon: Icon(Icons.people), //icon at head of input
              )),
              const TextField(
                  decoration: InputDecoration(
                      icon: Icon(Icons.lock), //icon at head of input
                      //prefixIcon: Icon(Icons.people), //you can use prefixIcon property too.
                      labelText: "Password",
                      suffixIcon:
                          Icon(Icons.remove_red_eye) //icon at tail of input
                      )),
            ],
          ),
        ),
      ],
    ));
  }
}
