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

  Song currentSong = Song(name: "asset2",
        fileLocation: "assets/asset2.mp3",
        imageLocation: "assets/cover.png");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueGrey,
        child: CircleAvatar(
          radius: 25.0,
          backgroundColor: Colors.black,
          backgroundImage: AssetImage(currentSong.getImageLocation()),
        ),
        onPressed: () {
          showDetailPage(context);
        },
        
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
            delegate: SliverChildListDelegate(
              [
                buildSongCard(context),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 4.0,
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  Column buildSongCard(BuildContext context) {
    return Column(
                  children: playlist
                      .map((song) => GestureDetector(
                            onTap: () {
                              setState(() {
                                currentSong = song;
                              });
                            },
                            child: Card(
                              margin: EdgeInsets.all(1),
                              child: Container(
                                color: Colors.black,
                                height:
                                    MediaQuery.of(context).size.height * 0.09,
                                width: MediaQuery.of(context).size.width,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    CircleAvatar(
                                      radius: 30.0,
                                      backgroundImage:
                                          AssetImage(song.getImageLocation()),
                                    ),
                                    SizedBox(
                                      width: 20.0,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          '${song.getName()}',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.0),
                                        ),
                                        Text(
                                          '${song.getArtist()}',
                                          style: TextStyle(
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 180,
                                    ),
                                    Icon(Icons.more_vert)
                                  ],
                                ),
                              ),
                            ),
                          ))
                      .toList());
  }

  void showDetailPage(context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DetailPage(
                  song: currentSong,
                )));
  }
}
