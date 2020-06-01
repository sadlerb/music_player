import 'package:flutter/material.dart';
import 'package:music_player/pages/detailPage.dart';
import 'package:music_player/services/player.dart';
import 'package:music_player/services/song.dart';
import 'package:music_player/services/songCard.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Song> playlist = [
    Song(
        name: "asset1",
        fileLocation: "assets/asset1.mp3",
        imageLocation: "assets/img.jpg"),
    Song(
        name: "asset2",
        fileLocation: "assets/asset2.mp3",
        imageLocation: "assets/cover.png")
  ];
  Song currentSong = Song(
      name: "asset2",
      fileLocation: "assets/asset2.mp3",
      imageLocation: "assets/cover.png");

    Player player;

    bool playing = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SlidingUpPanel(
        onPanelClosed: () {
          setState(() {
            
          });
        },
        maxHeight: MediaQuery.of(context).size.height,
        panel: DetailPage(
          player: player,
          playing: playing,
          song: currentSong,
        ),
        collapsed: Container(
          decoration: BoxDecoration(color: Colors.blueGrey),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              CircleAvatar(
                radius: 30.0,
                backgroundImage: AssetImage(currentSong.getImageLocation()),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "${currentSong.getName()}",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    "${currentSong.getArtist()}",
                    style: TextStyle(
                      color: Colors.black54,
                    ),
                  )
                ],
              ),
              IconButton(
                iconSize: 60.0,
                icon: Icon(playing ? Icons.pause: Icons.play_arrow),
                onPressed: () {
                  setState(() {
                    playing = !playing;
                  });
                },
              )
            ],
          ),
        ),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Colors.grey,
              expandedHeight: 150.0,
              title: Text("Music"),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Column(
                      children: playlist
                          .map(
                            (song) => GestureDetector(
                              onTap: () {
                                setState(() {
                                  currentSong = song;
                                });
                              },
                              child: SongCard(song: song),
                            ),
                          ).toList()),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
