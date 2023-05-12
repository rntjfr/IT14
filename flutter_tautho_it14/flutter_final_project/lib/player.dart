import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:typed_data';

import 'package:flutter_final_project/modal/audiolist.dart';

class Player extends StatefulWidget {
  Player({super.key});

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  int maxduration = 100;
  int currentpos = 0;
  String currentpostlabel = "00:00";
  String maxpostlabel = "00:00";
  String audioasset = "assets/audio/setmefree.mp3";
  bool isplaying = false;
  bool audioplayed = false;
  late Uint8List audiobytes;

  AudioPlayer player = AudioPlayer();

  void initState() {
    Future.delayed(Duration.zero, () async {
      ByteData bytes =
          await rootBundle.load(audioasset); //load audio from assets
      audiobytes =
          bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
      //convert ByteData to Uint8List

      player.onDurationChanged.listen((Duration d) {
        //get the duration of audio
        maxduration = d.inMilliseconds;

        setState(() {
          //refresh the UI
        });
      });

      player.onAudioPositionChanged.listen((Duration p) {
        currentpos =
            p.inMilliseconds; //get the current position of playing audio

        //generating the duration label
        int chours = Duration(milliseconds: currentpos).inHours;
        int cminutes = Duration(milliseconds: currentpos).inMinutes;
        int cseconds = Duration(milliseconds: currentpos).inSeconds;

        int crhours = chours;
        int crminutes = cminutes - (chours * 60);
        int crseconds = cseconds - (cminutes * 60 + chours * 60 * 60);

        currentpostlabel =
            "${crminutes.toString().padLeft(2, '0')}:${crseconds.toString().padLeft(2, '0')}";

        //generating the duration label
        int mhours = Duration(milliseconds: maxduration).inHours;
        int mminutes = Duration(milliseconds: maxduration).inMinutes;
        int mseconds = Duration(milliseconds: maxduration).inSeconds;

        int mrhours = mhours;
        int mrminutes = mminutes - (mhours * 60);
        int mrseconds = mseconds - (mminutes * 60 + mhours * 60 * 60);

        maxpostlabel =
            "${mrminutes.toString().padLeft(2, '0')}:${mrseconds.toString().padLeft(2, '0')}";

        setState(() {
          //refresh the UI
        });
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(35),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset(
                      'assets/image/setmefree.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const Text(
                  'Set Me Free - TWICE',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Slider(
                  value: double.parse(currentpos.toString()),
                  min: 0,
                  max: double.parse(maxduration.toString()),
                  divisions: maxduration,
                  label: currentpostlabel,
                  onChanged: (double value) async {
                    int seekval = value.round();
                    int result =
                        await player.seek(Duration(milliseconds: seekval));
                    if (result == 1) {
                      //seek successful
                      currentpos = seekval;
                    } else {
                      print("Seek unsuccessful.");
                    }
                  },
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        currentpostlabel,
                        style: const TextStyle(fontSize: 15),
                      ),
                      Text(
                        maxpostlabel,
                        style: const TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox.fromSize(
                      size: const Size(45, 45),
                      child: ClipOval(
                        child: Material(
                          color: Colors.deepPurple,
                          child: InkWell(
                            splashColor: Colors.purple,
                            onTap: () {},
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.skip_previous,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    SizedBox.fromSize(
                      size: const Size(60, 60),
                      child: ClipOval(
                        child: Material(
                          color: Colors.deepPurple,
                          child: InkWell(
                            splashColor: Colors.purple,
                            onTap: () async {
                              if (!isplaying && !audioplayed) {
                                int result = await player.playBytes(audiobytes);
                                if (result == 1) {
                                  //play success
                                  setState(() {
                                    isplaying = true;
                                    audioplayed = true;
                                  });
                                } else {
                                  print("Error while playing audio.");
                                }
                              } else if (audioplayed && !isplaying) {
                                int result = await player.resume();
                                if (result == 1) {
                                  //resume success
                                  setState(() {
                                    isplaying = true;
                                    audioplayed = true;
                                  });
                                } else {
                                  print("Error on resume audio.");
                                }
                              } else {
                                int result = await player.pause();
                                if (result == 1) {
                                  //pause success
                                  setState(() {
                                    isplaying = false;
                                  });
                                } else {
                                  print("Error on pause audio.");
                                }
                              }
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  isplaying ? Icons.pause : Icons.play_arrow,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    SizedBox.fromSize(
                      size: const Size(45, 45),
                      child: ClipOval(
                        child: Material(
                          color: Colors.deepPurple,
                          child: InkWell(
                            splashColor: Colors.purple,
                            onTap: () {},
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.skip_next,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  stopMusic() => Wrap(
        spacing: 10,
        children: [
          ElevatedButton.icon(
              onPressed: () async {
                int result = await player.stop();
                currentpostlabel = "00:00";
                maxpostlabel = "00:00";
                if (result == 1) {
                  //stop success
                  setState(() {
                    isplaying = false;
                    audioplayed = false;
                    currentpos = 0;
                  });
                } else {
                  print("Error on stop audio.");
                }
              },
              icon: const Icon(Icons.stop),
              label: const Text("Stop")),
        ],
      );
}
