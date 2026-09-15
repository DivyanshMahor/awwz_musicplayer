
import 'package:local_audio_scan/local_audio_scan.dart';

class MusicServices {
  final LocalAudioScanner _scanner = LocalAudioScanner();
  
  Future<List<AudioTrack>> fetchAudio() async {
    
    final permission = await _scanner.requestPermission();


    if(!permission) {
      return [];
    }

    final tracks = await _scanner.scanTracks(filterJunkAudio: true);
  return tracks;

  }
}