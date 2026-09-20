import 'dart:ui';

import 'package:awwz_music/common/app_bar.dart';
import 'package:awwz_music/services/music_list_services.dart';
import 'package:flutter/material.dart';
import 'package:local_audio_scan/local_audio_scan.dart';

import 'music_player.dart';

import '../theme/my_colors.dart';

class MusicListScreen extends StatefulWidget {
  const MusicListScreen({super.key});

  @override
  State<MusicListScreen> createState() => _MusicListScreenState();
}

class _MusicListScreenState extends State<MusicListScreen> {
  List<AudioTrack> songs = [];
  int selectedIndex = 0;

  Future<void> _loadSongs() async {
    final musicServices = MusicServices();
    final result = await musicServices.fetchAudio();

    setState(() {
      songs = result;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadSongs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
 backgroundColor: Colors.transparent,

      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [


          // Text(
          //   "Music's Library",
          //   textAlign: TextAlign.left,
          //   style: TextStyle(
          //     fontSize: 30,
          //     color: MyColors().textColor,
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),
          //
          // SizedBox(height: 12),

          //Music actual list
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),

              child: ListWheelScrollView.useDelegate(
                itemExtent: 110,
                diameterRatio: 2.5,
                perspective: 0.0015,
                squeeze: 1.4 ,
                physics: const FixedExtentScrollPhysics(),

                onSelectedItemChanged: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },

                childDelegate: ListWheelChildBuilderDelegate(
                  childCount: songs.length,
                builder: (context,index) {
                  final song = songs[index];

                  return songTile(
                        context,
                        song.title.trim(),
                        song.artist,
                        song.artwork,
                    index,
                      );
                },
              ),
            ),
            ),
          ),
        ],
      ),
    );
  }

  //Song Tile
  Widget songTile(BuildContext context, title, artist, artwork, int index) {

    final distance = (index - selectedIndex).abs();

    final opacity = distance == 0
        ? 1.0
        : distance == 1
        ? 0.95
        : 0.85;



    return Column(
        children: [
    AnimatedOpacity(
    duration: const Duration(milliseconds: 180),
    opacity: opacity,

    child: SizedBox(
    height: 76,

            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
               child:  ClipRRect(
                  borderRadius: BorderRadius.circular(20),

                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 12,
                      sigmaY: 12,
                    ),

                    child: Container(
                      decoration: BoxDecoration(

                        //trans glass
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors:[
                            MyColors().accentColor.withAlpha(175),
                            MyColors().glassWhite.withAlpha(90),
                            MyColors().glassPurple.withAlpha(165),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(20),

                        //glass border
                        border: Border.all(
                          color: MyColors().glassWhite.withAlpha(95),
                          width: 1.5,
                        ),

                        boxShadow: [

                          BoxShadow(
                            color: Colors.red.withAlpha(90),
                            blurRadius: 20,
                            spreadRadius: 1,
                            offset: const Offset(0, 6),
                          ),

                          BoxShadow(
                            color: MyColors().glassPurple.withAlpha(18),
                            blurRadius: 20,
                            spreadRadius: 1,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),

                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 12),

                        leading: artwork == null
                            ? Container(
                          height: 50,
                          width: 50,
                            decoration: BoxDecoration(
                              color: MyColors().accentColor.withAlpha(100),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: Colors.white.withAlpha(40),
                              ),
                                ),
                          child: Icon(Icons.music_note, size: 20, color: Colors.white,),
                        )
                            : ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.memory(
                            artwork,
                            height: 50,
                            width: 50,
                            fit: BoxFit.cover,
                          ),
                        ),

                        title: Text( //song name
                          title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: MyColors().lighttxtColor,
                          ),
                        ),

                        subtitle: Text( //artist
                          artist,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: MyColors().lighttxtColor.withAlpha(170),
                          ),
                        ),

                        //three dot 3

                        trailing: Icon(
                          Icons.more_vert,
                          color: MyColors().lighttxtColor.withAlpha(180),
                        ),

                        //navigation
                        onTap: () {
                          Navigator.push(
                            context,

                            MaterialPageRoute(builder: (context) => MusicController(
                              song: songs[index],
                              index: index,
                              songs: songs,
                            )),
                          );
                        },
                      ),
                    ),
                  ),
                )

        ),

        ),
        // SizedBox(height: 12,),
    ),
    ],

    ) ;
  }
}
