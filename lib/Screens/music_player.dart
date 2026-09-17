import 'package:awwz_music/common/app_bar.dart';
import 'package:awwz_music/services/music_player_services.dart';
import 'package:awwz_music/theme/my_colors.dart';
import 'package:flutter/material.dart';

import 'package:local_audio_scan/local_audio_scan.dart';
import 'dart:async';

class MusicController extends StatefulWidget {
  final AudioTrack song;
  final int index;
final List<AudioTrack> songs;

  const MusicController({super.key, required this.song, required this.index, required this.songs});

  @override
  State<MusicController> createState() => _MusicControllerState();
}

class _MusicControllerState extends State<MusicController> {
  final MusicPlayerServices _playerService = MusicPlayerServices();

  @override
  void initState(){
    super.initState();
    _loadSong();
  }

  Future<void> _loadSong() async{

    await _playerService.loadPlaylist(widget.songs,widget.index);

    await _playerService.playSong();

    setState(() {
      duration = _playerService.player.duration ?? Duration.zero;
      isPlaying = true;
    });

    _timer = Timer.periodic(const Duration(milliseconds: 500),

        (timer) {
      if (mounted){
        setState(() {
          position = _playerService.player.position;
        });
      }
        }
    );
  }

  @override
  void dispose(){
    _timer?.cancel();
    _playerService.dispose();
    super.dispose();
  }

  late final screenWidth = MediaQuery.of(context).size.width;

  bool isPlaying = false;
  int isRepeat = 0; // repeat button
  bool isShuffle = false; // shuffle button
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  Timer? _timer; // for duration


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar:
      AppBar(
          automaticallyImplyLeading: false,
          title:
          MyAppBar(),
          backgroundColor: Colors.transparent
      ),
      backgroundColor: MyColors().bgColor,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
      
              Container(
                height: screenWidth * 0.8,
                width: screenWidth * 0.8,
                decoration: BoxDecoration(
                  color: MyColors().appBarColor,
      
                  borderRadius: BorderRadius.circular(22),
                    boxShadow: [
                      BoxShadow(
                        color: MyColors().accentColor.withAlpha(150),

                        offset: Offset(1,2),
                        blurRadius: 5,
                        spreadRadius: 1,
                      )
                    ]
                ),
      
      
              ),
              SizedBox(height: 22),
      
              Text(
                "Khali Panna",
                style: TextStyle(
                    fontSize: 28,
                    color: MyColors().textColor,fontWeight: FontWeight.bold),
              ),
      
              Text(
                "Natkhat",
                style: TextStyle(
                    fontSize: 18,
                    color: MyColors().accentColor,fontWeight: FontWeight.w600),
              ),
      
      
              Slider.adaptive(
                value: position.inMilliseconds.toDouble().clamp(0, duration.inMilliseconds.toDouble()),
                min: 0,
                max: duration.inMilliseconds.toDouble() > 0 ? duration.inMilliseconds.toDouble() : 1,
                onChanged: (value) {
                  setState(() {
                    position = Duration(milliseconds: value.toInt());
                  });

                },

                onChangeEnd: (value) async {
                  await _playerService.songDuration(Duration(milliseconds: value.toInt(),));
                },

              ),
      
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
      //Duration // TimeStamp
                  Text(
  "",

                    style: TextStyle(fontSize: 20,color: MyColors().textColor,fontWeight: FontWeight.bold),),
                  Text("02:23",style: TextStyle(fontSize: 20,color: MyColors().textColor,fontWeight: FontWeight.bold),),
                ],
              ),
      
              SizedBox(height: 40,),
      
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
      
                children: [
                  //Shuffle
                  buildMusicButton(onPressed: (){
                    setState(() {
                      isShuffle = !isShuffle;
                      _playerService.shuffleSongs();
                    });
                  },
                    icon: isShuffle ? Icons.shuffle_outlined : Icons.shuffle_on , size: 40,


                  ),
      
                  //Previous Song
                  buildMusicButton(onPressed: (){},
                    icon: Icons.skip_previous,
                  ),
      
                  //Play/Pause
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                    child: Container(
                      height: 80,
                      width: 80,
      
                      decoration: BoxDecoration(
                        // shape: BoxShape.circle,
                        borderRadius: BorderRadius.circular(20),
      
      
                        color: MyColors().accentColor,
                          boxShadow: [
                            BoxShadow(
                              color: MyColors().accentColor.withAlpha(150),

                              offset: Offset(1,2),
                              blurRadius: 5,
                              spreadRadius: 1,
                            )
                          ]
                      ),

                      child: buildMusicButton(
                        onPressed: () async {

                          if (isPlaying) {
                          await _playerService.pauseSong();

                          setState(() {
                             isPlaying = false;
                          });

                      }else{
                          await _playerService.playSong();
                          setState(() {
                             isPlaying = true;
                          });
                        }
                        },

                        icon:  isPlaying ?   Icons.pause
                            : Icons.play_arrow ,
      
                      ),
                    ),
                  ),
      
                  //Next Song
                  buildMusicButton(onPressed: (){},
                    icon: Icons.skip_next,
                  ),
                  // SizedBox(width: 20,),
                  //Repeat
                  IconButton(onPressed: (){
                    setState(() {
                      isRepeat = (isRepeat + 1) % 3;
                    });
                  },
                    icon:
                        AnimatedRotation(
                          duration: Duration(milliseconds: 38),
                    turns: isRepeat.toDouble(),
                   child: Icon(isRepeat == 0 ? Icons.repeat :
                   isRepeat == 1 ? Icons.repeat_one : Icons.trending_neutral_sharp,
                     key: ValueKey(isRepeat),size: 40,color: MyColors().lighttxtColor,
                   ) ,
                  ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );


  }
}


Widget buildMusicButton({
  required IconData? icon,
  required VoidCallback onPressed,
  double size = 60,

}){
  return IconButton(onPressed: onPressed, icon:
  Icon(
    icon,
    size: size,
    color: MyColors().lighttxtColor,
  ),
  );

}