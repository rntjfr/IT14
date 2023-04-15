import 'package:flutter/material.dart';
import 'package:flutter_session_4/functions.dart';

class ProfileView extends StatelessWidget {
  ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Profile View')),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              const CircleAvatar(
                backgroundImage: AssetImage('assets/genshin/kleee.jpg'),
                radius: 50,
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'REXDAN TAUTHO',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              const Text('tauthorex@gmail.com'),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                height: 5,
              ),
              const SizedBox(
                height: 10,
              ),
              countSection(),
              countLabel(),
              const SizedBox(
                height: 20,
              ),
              const Divider(
                height: 5,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: Text(
                      'Friends',
                      style: txtStyle1,
                    ),
                  ),
                ],
              ),
              listofFriends1(),
              listofFriends2(),
              const SizedBox(
                height: 20,
              ),
              const Divider(
                height: 5,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: Text(
                      'Posts',
                      style: txtStyle1,
                    ),
                  ),
                ],
              ),
              postData(
                context,
                'assets/genshin/ayato.jpg',
                'Kamisato Ayato',
                '1 min ago',
                'Kamisato Qiqi is our youngest',
                'assets/genshin/qiqi.jpg',
                '200',
                '300',
              ),
              const Divider(
                height: 5,
              ),
              const SizedBox(
                height: 10,
              ),
              postData(
                context,
                'assets/genshin/ei.jpg',
                'Raiden Shogun',
                '5 hours ago',
                'Mapanaket',
                'assets/products/img_plant_3.jpg',
                '128',
                '125',
              ),
              const Divider(
                height: 5,
              ),
              const SizedBox(
                height: 10,
              ),
              postData(
                context,
                'assets/genshin/klee.jpg',
                'Klee',
                '1 day ago',
                'What if?',
                'assets/products/image_30.jpg',
                '12',
                '36',
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
