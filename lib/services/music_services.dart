import 'package:on_audio_query_pluse/on_audio_query.dart';
// import 'package:on_audio_query_pluse/widget/query_artwork_widget.dart';
class MusicServices {
  final OnAudioQuery _audioQuery = OnAudioQuery();

  Future<void> fetchAudio() async {
    print("FETCH AUDIO START");
    final permission =  await _audioQuery.permissionsRequest();

    print("PERMISSION: $permission");

    if(!permission) {
      print("audio permis granted");
      return;
    }
      final songs =  await _audioQuery.querySongs();

      print("SONGS FOUND: ${songs.length}");
      for(var song in songs){
        print('Title: ${song.title}');
        print('Artist: ${song.artist}');
        print('Duration: ${song.duration}');
        print('Path: ${song.uri}');

    }

  }
}