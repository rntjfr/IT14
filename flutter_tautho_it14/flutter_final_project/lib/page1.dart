import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:typed_data';

import 'package:flutter_final_project/modal/audiolist.dart';
import 'package:flutter_final_project/player.dart';
import 'package:flutter_final_project/playlist.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  int _selectedIndex = 0;

  AudioPlayer player = AudioPlayer();

  final screens = [
    Player(),
    //Playlist(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        centerTitle: true,
        title: const Text(
          'MUSIC',
          style:
              TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
            player.stop();
          },
          icon: const Icon(
            Icons.logout,
            color: Colors.deepPurple,
          ),
        ),
      ),
      body: screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.music_note),
            label: 'Player',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Playlist',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      print(index);
    });
  }

  buildAudioList(BuildContext context, List audioList, int index) => Card(
        child: ListTile(
          title: Text(audioList[index]['audioname']),
          subtitle: Text(audioList[index]['audiosrc']),
          leading: CircleAvatar(
            backgroundImage: AssetImage(audioList[index]['imgsrc'].toString()),
            radius: 30,
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.play_arrow),
            ],
          ),
        ),
      );
}
