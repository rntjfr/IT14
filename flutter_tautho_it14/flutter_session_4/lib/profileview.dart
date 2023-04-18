import 'package:flutter/material.dart';
import 'package:flutter_session_4/model/post.dart';
import 'package:flutter_session_4/profileviewdetails.dart';

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
              postData(context, post1),
              const Divider(
                height: 5,
              ),
              const SizedBox(
                height: 10,
              ),
              postData(context, post2),
              const Divider(
                height: 5,
              ),
              const SizedBox(
                height: 10,
              ),
              postData(context, post3),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  countSection() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            '125',
            style: txtStyle1,
          ),
          Text(
            '126',
            style: txtStyle1,
          ),
          Text(
            '300',
            style: txtStyle1,
          ),
        ],
      );

  countLabel() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          Text('Followers'),
          Text('Posts'),
          Text('Following'),
        ],
      );

  profileFriends(img, name) => Card(
        child: Container(
          padding: const EdgeInsets.all(5),
          child: Column(
            children: [
              Image.asset(
                img,
                height: 110,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                name,
                style: txtStyle1,
              ),
            ],
          ),
        ),
      );

  listofFriends1() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          profileFriends(
            'assets/genshin/ayaka.jpg',
            'Kamisato Ayaka',
          ),
          profileFriends(
            'assets/genshin/ayato.jpg',
            'Kamisato Ayato',
          ),
          profileFriends(
            'assets/genshin/kazuha.jpg',
            'Kaedehara Kazuha',
          ),
        ],
      );
  listofFriends2() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          profileFriends(
            'assets/genshin/ei.jpg',
            'Raiden Shogun',
          ),
          profileFriends(
            'assets/genshin/itto.jpg',
            'Arataki Itto',
          ),
          profileFriends(
            'assets/genshin/kuki.jpg',
            'Kuki Shinobu',
          ),
        ],
      );
  postData(context, Post post) => GestureDetector(
        onTap: () {
          gotoProfileDetails(context, post);
        },
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(5),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(
                      post.profileimg,
                    ),
                    radius: 20,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          post.profilename,
                          style: txtStyle1,
                        ),
                        Row(
                          children: [
                            Text(
                              post.time,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Icon(
                              Icons.people,
                              size: 15,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                children: [
                  Text(
                    post.description,
                    style: txtStyle1,
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(5),
              child: Image.asset(
                post.img,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('${post.numcomments} comments'),
                  const Text(' . '),
                  Text('${post.numshares} shares'),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton.icon(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.grey,
                  ),
                  onPressed: () {},
                  icon: const Icon(Icons.thumb_up),
                  label: const Text('Like'),
                ),
                TextButton.icon(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.grey,
                  ),
                  onPressed: () {
                    gotoProfileDetails(context, post);
                  },
                  icon: const Icon(Icons.chat_bubble),
                  label: const Text('Comment'),
                ),
                TextButton.icon(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.grey,
                  ),
                  onPressed: () {},
                  icon: const Icon(Icons.forward_rounded),
                  label: const Text('Like'),
                ),
              ],
            )
          ],
        ),
      );
  var txtStyle1 = const TextStyle(fontWeight: FontWeight.bold);
  gotoProfileDetails(context, Post post) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProfileViewDetails(
          post: post,
        ),
      ),
    );
  }

  Post post1 = Post(
    profileimg: 'assets/genshin/ayato.jpg',
    profilename: 'Kamisato Ayato',
    time: '1 min ago',
    description: 'Kamisato Qiqi is our youngest',
    img: 'assets/genshin/qiqi.jpg',
    numcomments: '200',
    numshares: '300',
  );

  Post post2 = Post(
    profileimg: 'assets/genshin/ei.jpg',
    profilename: 'Raiden Shogun',
    time: '5 hours ago',
    description: 'Mapanaket',
    img: 'assets/products/img_plant_3.jpg',
    numcomments: '128',
    numshares: '125',
  );

  Post post3 = Post(
    profileimg: 'assets/genshin/klee.jpg',
    profilename: 'Klee',
    time: '1 day ago',
    description: 'What if?',
    img: 'assets/products/image_30.jpg',
    numcomments: '12',
    numshares: '36',
  );
}
