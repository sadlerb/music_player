import 'package:flutter/material.dart';
import 'package:music_player/services/player.dart';
import 'package:music_player/services/song.dart';

class DetailPage extends StatefulWidget {
  final Player player;
  bool playing;
  final List<Song> playlist;
  int index;

  DetailPage(
      {@required this.player,
      @required this.playing,
      @required this.playlist,
      @required this.index,
      Key key})
      : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();

  List onClose() {
    return [playing,index];
    
  }
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Colors.black,
      child: SafeArea(
        child: GestureDetector(
          child: Container(
            color: Colors.black,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    IconButton(
                      padding: EdgeInsets.only(right: 40),
                      enableFeedback: false,
                      onPressed: () {},
                      icon: Icon(
                        Icons.more_vert,
                        size: 27.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50.0),
                Stack(
                  alignment: Alignment.topRight,
                  children: <Widget>[
                    Card(
                      color: Colors.white,
                      elevation: 1.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Container(
                            width: 250.0,
                            height: 250.0,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(widget.playlist
                                    .elementAt(widget.index)
                                    .getImageLocation()),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: -20.0,
                      top: -15.0,
                      child: ClipOval(
                        child: Container(
                          height: 40.0,
                          width: 40.0,
                          color: Colors.white,
                          child: Icon(
                            Icons.favorite,
                            color: Colors.pink[300],
                          ),
                        ),
                      ),
                    ),
                  ],
                  overflow: Overflow.visible,
                ),
                SizedBox(height: 25.0),
                Text(
                  "${widget.playlist.elementAt(widget.index).getName()}",
                  style: TextStyle(fontSize: 25.0, color: Colors.white),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  "${widget.playlist.elementAt(widget.index).getArtist()}",
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 70,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    IconButton(
                      iconSize: 30.0,
                      icon: Icon(Icons.shuffle),
                      color: Colors.white,
                      onPressed: () {},
                    ),
                    IconButton(
                      iconSize: 30.0,
                      icon: Icon(Icons.skip_previous),
                      color: Colors.white,
                      onPressed: () {
                        setState(() {
                          if (widget.index == 0){
                            widget.index = widget.playlist.length - 1;
                            widget.player.open(widget.playlist.elementAt(widget.index));
                            widget.playing = true;
                          }else if(widget.index > 0){
                            widget.index--;
                            widget.player.open(widget.playlist.elementAt(widget.index));
                            widget.playing = true;
                          }

                        });
                      },
                    ),
                    IconButton(
                      iconSize: 90.0,
                      icon:
                          Icon(widget.playing ? Icons.pause : Icons.play_arrow),
                      color: Colors.white,
                      onPressed: () {
                        setState(() {
                          widget.playing = !widget.playing;
                          widget.playing
                              ? widget.player.play()
                              : widget.player.pause();
                        });
                      },
                    ),
                    IconButton(
                      iconSize: 30.0,
                      icon: Icon(Icons.skip_next),
                      color: Colors.white,
                      onPressed: () {
                        print(widget.index);
                        print(widget.playlist.length);
                        setState(() {
                          if (widget.index > widget.playlist.length - 2) {
                            widget.index = 0;
                            widget.player
                                .open(widget.playlist.elementAt(widget.index));
                            widget.playing = true;
                          } else if (widget.index <=
                              widget.playlist.length - 2) {
                            widget.index++;
                            widget.player
                                .open(widget.playlist.elementAt(widget.index));
                            widget.playing = true;
                          }
                        });
                      },
                    ),
                    IconButton(
                      iconSize: 30.0,
                      icon: Icon(Icons.repeat),
                      color: Colors.white,
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
