import 'package:flutter/material.dart';
import 'package:flutter_session_4/profileviewdetails.dart';

var txtStyle1 = const TextStyle(fontWeight: FontWeight.bold);

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
postData(context, profileimg, profilename, time, description, img, numcomments,
        numshares) =>
    GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProfileViewDetails(
                profileimg: profileimg,
                profilename: profilename,
                time: time,
                description: description,
                image: img,
                likes: numcomments,
                shares: numshares),
          ),
        );
      },
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(5),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(
                    profileimg,
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
                        profilename,
                        style: txtStyle1,
                      ),
                      Row(
                        children: [
                          Text(
                            time,
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
                  description,
                  style: txtStyle1,
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(5),
            child: Image.asset(
              img,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('$numcomments comments'),
                const Text(' . '),
                Text('$numshares shares'),
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfileViewDetails(
                          profileimg: profileimg,
                          profilename: profilename,
                          time: time,
                          description: description,
                          image: img,
                          likes: numcomments,
                          shares: numshares),
                    ),
                  );
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
