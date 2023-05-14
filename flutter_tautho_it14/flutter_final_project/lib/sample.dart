import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_final_project/audiolisting.dart';
import 'package:flutter_final_project/modal/audiol.dart';

class Dummy extends StatefulWidget {
  const Dummy({super.key});

  @override
  State<Dummy> createState() => _DummyState();
}

class _DummyState extends State<Dummy> {
  int maxduration = 100;
  int currentpos = 0;
  String currentpostlabel = "00:00";
  String maxpostlabel = "00:00";
  String? audioasset;
  String? title;
  String? artist;
  String? image;
  bool isplaying = false;
  bool audioplayed = false;

  late Uint8List audiobytes;

  AudioPlayer player = AudioPlayer();

  @override
  void initState() {
    audioasset = audio0.audioSource.toString();
    image = audio0.imageSource;
    title = audio0.audioName;
    artist = audio0.audioArtist;

    Future.delayed(Duration.zero, () async {
      ByteData bytes =
          await rootBundle.load(audioasset!); //load audio from assets
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

        int crminutes = cminutes - (chours * 60);
        int crseconds = cseconds - (cminutes * 60 + chours * 60 * 60);

        currentpostlabel =
            "${crminutes.toString().padLeft(2, '0')}:${crseconds.toString().padLeft(2, '0')}";

        //generating the duration label
        int mhours = Duration(milliseconds: maxduration).inHours;
        int mminutes = Duration(milliseconds: maxduration).inMinutes;
        int mseconds = Duration(milliseconds: maxduration).inSeconds;

        int mrminutes = mminutes - (mhours * 60);
        int mrseconds = mseconds - (mminutes * 60 + mhours * 60 * 60);

        maxpostlabel =
            "${mrminutes.toString().padLeft(2, '0')}:${mrseconds.toString().padLeft(2, '0')}";

        setState(() {
          //refresh the UI
        });
      });
    });
    player.onPlayerCompletion.listen((event) {
      playNextAudio();
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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        centerTitle: true,
        title: const Text(
          'MUSIC PLAYER',
          style: TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.w900,
            fontSize: 25,
          ),
        ),
        leading: IconButton(
          onPressed: () async {
            await player.stop();
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.logout,
            color: Colors.deepPurple,
          ),
        ),
      ),
      body: ListView(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(30),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset(
                    image!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                '$title - $artist',
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
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
                      style: const TextStyle(fontSize: 12),
                    ),
                    Text(
                      maxpostlabel,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // IconButton(
                  //     onPressed: () {
                  //       setState(() {
                  //         currentpos - 600;
                  //       });
                  //     },
                  //     icon: const Icon(
                  //       Icons.replay_10,
                  //       size: 30,
                  //       color: Colors.deepPurple,
                  //     )),
                  SizedBox.fromSize(
                    size: const Size(45, 45),
                    child: ClipOval(
                      child: Material(
                        color: Colors.deepPurple,
                        child: InkWell(
                          splashColor: Colors.purple,
                          onTap: () {
                            playPrevAudio();
                          },
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
                          onTap: () {
                            playNextAudio();
                          },
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
                  // IconButton(
                  //     onPressed: () {},
                  //     icon: const Icon(
                  //       Icons.forward_10,
                  //       size: 30,
                  //       color: Colors.deepPurple,
                  //     )),
                ],
              ),
            ],
          ),
          const SizedBox(height: 40),
          GestureDetector(
            onTap: () => playAudio(audio0),
            child: AudioListing(audioL: audio0),
          ),
          GestureDetector(
            onTap: () => playAudio(audio1),
            child: AudioListing(audioL: audio1),
          ),
          GestureDetector(
            onTap: () => playAudio(audio2),
            child: AudioListing(audioL: audio2),
          ),
          GestureDetector(
            onTap: () => playAudio(audio3),
            child: AudioListing(audioL: audio3),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  AudioL audio0 = AudioL(
    index: 0,
    audioName: 'Set Me Free',
    audioArtist: 'TWICE',
    audioSource: 'assets/audio/setmefree.mp3',
    imageSource: 'assets/image/setmefree.jpg',
    isLiked: false,
  );
  AudioL audio1 = AudioL(
    index: 1,
    audioName: 'Hare Hare',
    audioArtist: 'TWICE',
    audioSource: 'assets/audio/harehare.mp3',
    imageSource: 'assets/image/harehare.jpg',
    isLiked: false,
  );
  AudioL audio2 = AudioL(
    index: 2,
    audioName: 'Flower',
    audioArtist: 'Jisoo',
    audioSource: 'assets/audio/flower.mp3',
    imageSource: 'assets/image/flower.jpg',
    isLiked: false,
  );
  AudioL audio3 = AudioL(
    index: 3,
    audioName: 'MPL',
    audioArtist: 'Mommy Oni',
    audioSource: 'assets/audio/mpl.mp3',
    imageSource: 'assets/image/mpl.jpg',
    isLiked: false,
  );

  playAudio(audio) async {
    int result = await player.stop();
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
    isplaying = false;
    audioplayed = false;
    currentpos = 0;
    audioasset = audio.audioSource.toString();
    title = audio.audioName;
    artist = audio.audioArtist;
    image = audio.imageSource;

    loadPlay();
  }

  playNextAudio() async {
    await player.stop();
    if (audioasset == audio0.audioSource) {
      isplaying = false;
      audioplayed = false;
      currentpos = 0;
      audioasset = audio1.audioSource.toString();
      title = audio1.audioName;
      artist = audio1.audioArtist;
      image = audio1.imageSource;
      loadPlay();
    } else if (audioasset == audio1.audioSource) {
      isplaying = false;
      audioplayed = false;
      currentpos = 0;
      audioasset = audio2.audioSource.toString();
      title = audio2.audioName;
      artist = audio2.audioArtist;
      image = audio2.imageSource;
      loadPlay();
    } else if (audioasset == audio2.audioSource) {
      isplaying = false;
      audioplayed = false;
      currentpos = 0;
      audioasset = audio3.audioSource.toString();
      title = audio3.audioName;
      artist = audio3.audioArtist;
      image = audio3.imageSource;
      loadPlay();
    } else if (audioasset == audio3.audioSource) {
      isplaying = false;
      audioplayed = false;
      currentpos = 0;
      audioasset = audio0.audioSource.toString();
      title = audio0.audioName;
      artist = audio0.audioArtist;
      image = audio0.imageSource;
      loadPlay();
    }
  }

  playPrevAudio() async {
    await player.stop();
    if (audioasset == audio0.audioSource) {
      isplaying = false;
      audioplayed = false;
      currentpos = 0;
      audioasset = audio3.audioSource.toString();
      title = audio3.audioName;
      artist = audio3.audioArtist;
      image = audio3.imageSource;
      loadPlay();
    } else if (audioasset == audio3.audioSource) {
      isplaying = false;
      audioplayed = false;
      currentpos = 0;
      audioasset = audio2.audioSource.toString();
      title = audio2.audioName;
      artist = audio2.audioArtist;
      image = audio2.imageSource;
      loadPlay();
    } else if (audioasset == audio2.audioSource) {
      isplaying = false;
      audioplayed = false;
      currentpos = 0;
      audioasset = audio1.audioSource.toString();
      title = audio1.audioName;
      artist = audio1.audioArtist;
      image = audio1.imageSource;
      loadPlay();
    } else if (audioasset == audio1.audioSource) {
      isplaying = false;
      audioplayed = false;
      currentpos = 0;
      audioasset = audio0.audioSource.toString();
      title = audio0.audioName;
      artist = audio0.audioArtist;
      image = audio0.imageSource;
      loadPlay();
    }
  }

  loadPlay() {
    Future.delayed(Duration.zero, () async {
      ByteData bytes =
          await rootBundle.load(audioasset!); //load audio from assets
      audiobytes =
          bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
      //convert ByteData to Uint8List

      player.onDurationChanged.listen((Duration d) {
        //get the duration of audio
        maxduration = d.inMilliseconds;
      });

      player.onAudioPositionChanged.listen((Duration p) {
        currentpos =
            p.inMilliseconds; //get the current position of playing audio

        //generating the duration label
        int chours = Duration(milliseconds: currentpos).inHours;
        int cminutes = Duration(milliseconds: currentpos).inMinutes;
        int cseconds = Duration(milliseconds: currentpos).inSeconds;

        int crminutes = cminutes - (chours * 60);
        int crseconds = cseconds - (cminutes * 60 + chours * 60 * 60);

        currentpostlabel =
            "${crminutes.toString().padLeft(2, '0')}:${crseconds.toString().padLeft(2, '0')}";

        //generating the duration label
        int mhours = Duration(milliseconds: maxduration).inHours;
        int mminutes = Duration(milliseconds: maxduration).inMinutes;
        int mseconds = Duration(milliseconds: maxduration).inSeconds;

        int mrminutes = mminutes - (mhours * 60);
        int mrseconds = mseconds - (mminutes * 60 + mhours * 60 * 60);

        maxpostlabel =
            "${mrminutes.toString().padLeft(2, '0')}:${mrseconds.toString().padLeft(2, '0')}";
      });
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
    });
  }
}
