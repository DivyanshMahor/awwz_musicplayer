import 'package:just_audio/just_audio.dart';
import 'package:local_audio_scan/local_audio_scan.dart';

class MusicPlayerServices {
  final AudioPlayer player = AudioPlayer();

  Future<void> loadPlaylist(List<AudioTrack> songs, int index) async {

    final audioSources = songs.map( (song) {
      return AudioSource.file(song.filePath);
    }).toList();
    
    await player.setAudioSources(audioSources, initialIndex: index,);
  }

  Future<void> loadSong(AudioTrack song) async {
    await player.setFilePath(song.filePath); //set a song file path in Player
  }

  Future<void> playSong() async {
    await player.play();
  }

  Future<void> pauseSong() async {
    await player.pause();
  }

  Future<void> oneLoop() async {
    await player.setLoopMode(LoopMode.one);
  }

  Future<void> allLoop() async {
    await player.setLoopMode(LoopMode.all);
  }

  Future<void> noLoop() async {
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
