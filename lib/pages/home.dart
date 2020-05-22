import 'package:flutter/material.dart';
import 'package:music_player/pages/detailPage.dart';
import 'package:music_player/services/song.dart';
import 'package:music_player/services/songCard.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            floating: true,
            pinned: false,
            snap: true,
            backgroundColor: Colors.blueGrey,
            title: Text("Music"),
            expandedHeight: 150,
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              SongCard(playlist: playlist)
            ]),
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: GestureDetector(
          onTap: () {
            showDetailPage(context);
          },
          child: Hero(
            tag: 'dash',
            child: Card(
              margin: EdgeInsets.all(0),
              color: Colors.black,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 30.0,
                      backgroundImage: AssetImage("assets/cover.png"),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Peace Is The Mission",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                        ),
                        Text(
                          "Major Lazer",
                          style: TextStyle(
                            color: Colors.white60,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 70.0,
                    ),
                    Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                      size: 60.0,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void showDetailPage(context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => DetailPage(song: playlist[0],)));
  }
}

