/*

import 'package:flutter/material.dart';
import 'package:flutter_final_project/modal/audiolist.dart';
import 'package:flutter_final_project/player.dart';

class Playlist extends StatefulWidget {
  const Playlist({super.key});

  @override
  State<Playlist> createState() => _PlaylistState();
}

class _PlaylistState extends State<Playlist> with AudioList {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: ListView.builder(
            itemCount: audioList.length,
            itemBuilder: (BuildContext context, int index) {
              return buildList(context, audioList, index);
            },
          ),
        ),
      ),
    );
  }

  buildList(BuildContext context, List audioList, int index) {
    bool isLiked = audioList[index]['isLiked'];
    return ListTile(
      title: Text(audioList[index]['audioname']),
      subtitle: Text(audioList[index]['artist']),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          audioList[index]['imgsrc'].toString(),
          fit: BoxFit.cover,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () => setState(() {
              isLiked = !isLiked ? true : false;
            }),
            icon: Icon(
              Icons.favorite,
              color: isLiked ? Colors.deepPurple : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

*/