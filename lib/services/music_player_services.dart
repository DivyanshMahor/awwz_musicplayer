import 'package:just_audio/just_audio.dart';
import 'package:local_audio_scan/local_audio_scan.dart';

class MusicPlayerServices {
  final AudioPlayer player = AudioPlayer();

  Future<void> loadSong(AudioTrack song) async{
    //set song file path in Player
    await player.setFilePath(song.filePath);

  }
  Future<void> playSong() async{
    await player.play();
  }

  Future<void> pauseSong() async{
    await player.pause();
  }

  Future<void> oneLoop() async{
    await player.setLoopMode(LoopMode.one);
  }

  Future<void> allLoop() async{
    await player.setLoopMode(LoopMode.all);
  }
  Future<void> noLoop() async{
    await player.setLoopMode(LoopMode.off);
  }

  Future<void> shuffleSongs() async {
    await player.setShuffleModeEnabled(true);
  }

  Future<void> songDuration(Duration position) async {
    await player.seek(position);
  }

  Future<void> dispose() async {
    await player.dispose();
  }

}