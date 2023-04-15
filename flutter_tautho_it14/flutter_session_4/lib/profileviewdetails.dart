import 'package:flutter/material.dart';

class ProfileViewDetails extends StatelessWidget {
  ProfileViewDetails({
    super.key,
    required this.time,
    required this.description,
    required this.image,
    required this.likes,
    required this.shares,
    required this.profileimg,
    required this.profilename,
  });

  final String profileimg;
  final String profilename;
  final String time;
  final String description;
  final String image;
  final String likes;
  final String shares;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          bottomOpacity: 0.0,
          elevation: 0.0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.grey,
            ),
          )),
      body: Column(
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
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
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
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(5),
            child: Image.asset(
              image,
            ),
          ),
          /*
          Container(
            margin: const EdgeInsets.only(right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text('200 comments'),
                const Text(' . '),
                const Text('300 shares'),
              ],
            ),
          ),
          */
          const SizedBox(
            height: 10,
          ),
          const Divider(
            height: 5,
          ),
          buttons(),
          const Divider(),
          Container(
            padding: const EdgeInsets.all(5),
            child: Row(
              children: [
                Text(
                  'Mary Shaw and $likes others',
                  style: txtbold,
                ),
              ],
            ),
          ),
          const Divider(),
          Container(
            padding: const EdgeInsets.all(5),
            child: Row(
              children: [
                Text(
                  '$shares Shares',
                  style: txtbold,
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(5),
            child: Row(
              children: [
                Text(
                  'All comments',
                  style: txtbold,
                ),
                const Icon(Icons.arrow_drop_down),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage(
                    'assets/products/photo_female_1.jpg',
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(35, 158, 158, 158),
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          )),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Mary Shaw',
                            style: txtbold,
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            'Wow! Nice photo. Ikamusta ko kay papa nimo gang ha.',
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      child: Row(
                        children: const [
                          Text('1m'),
                          SizedBox(
                            width: 10,
                          ),
                          Text('Like'),
                          SizedBox(
                            width: 10,
                          ),
                          Text('Reply '),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  buttons() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextButton.icon(
            style: txtcolor,
            onPressed: () {},
            icon: const Icon(Icons.thumb_up),
            label: const Text('Like'),
          ),
          TextButton.icon(
            style: txtcolor,
            onPressed: () {},
            icon: const Icon(Icons.chat_bubble),
            label: const Text('Comment'),
          ),
          TextButton.icon(
            style: txtcolor,
            onPressed: () {},
            icon: const Icon(Icons.forward_rounded),
            label: const Text('Share'),
          ),
        ],
      );
  var txtcolor = TextButton.styleFrom(foregroundColor: Colors.grey);
  var txtbold = const TextStyle(fontWeight: FontWeight.bold);
}
