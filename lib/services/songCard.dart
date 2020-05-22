import 'package:flutter/material.dart';
import 'package:music_player/services/song.dart';

class SongCard extends StatelessWidget {
  const SongCard({
    Key key,
    @required this.playlist,
  }) : super(key: key);

  final List<Song> playlist;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: playlist
          .map((song) => Card(
                margin: EdgeInsets.all(1),
                child: Container(
                  color: Colors.black,
                  height: MediaQuery.of(context).size.height * 0.09,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 30.0,
                        backgroundImage: AssetImage(song.getImageLocation()),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '${song.getName()}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0
                            ),
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
              ))
          .toList(),
    );
  }
}
