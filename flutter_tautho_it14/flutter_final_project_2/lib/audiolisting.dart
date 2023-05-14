import 'package:flutter/material.dart';
import 'package:flutter_final_project_2/modal/audiol.dart';

class AudioListing extends StatefulWidget {
  var audioL;

  AudioListing({super.key, required this.audioL});

  @override
  State<AudioListing> createState() => _AudioListingState(audioL);
}

class _AudioListingState extends State<AudioListing> {
  final AudioL audioL;

  _AudioListingState(this.audioL);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: ListTile(
        title: Text(audioL.audioName),
        subtitle: Text(audioL.audioArtist),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            audioL.imageSource,
            fit: BoxFit.cover,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () => setState(() {
                audioL.isLiked = !audioL.isLiked ? true : false;
              }),
              icon: Icon(
                Icons.favorite,
                color: audioL.isLiked ? Colors.deepPurple : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
