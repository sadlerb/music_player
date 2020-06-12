import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:music_player/services/song.dart';

class Player {
  
  Song song;
  final AssetsAudioPlayer _audioPlayer = AssetsAudioPlayer();

  void open(Song song){
    _audioPlayer.open(Audio(song.getFileLocation()));
  }

  void play(){
    _audioPlayer.play();
  }

  void pause(){
    _audioPlayer.pause();
  }
  

}