import 'package:awwz_music/common/app_bar.dart';
import 'package:awwz_music/theme/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class MusicController extends StatefulWidget {
  const MusicController({super.key});

  @override
  State<MusicController> createState() => _MusicControllerState();
}

class _MusicControllerState extends State<MusicController> {
  late final screenWidth = MediaQuery.of(context).size.width;
  bool isPlaying = false; // play button
  int isRepeat = 0; // repeat button
  bool isShuffle = false; // shuffle button


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
                value: 10,
                min: 0,
                max: 100,
                onChanged: (value) {
      
                },
      
              ),
      
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
      //Duration // TimeStamp
                  Text("00:00",style: TextStyle(fontSize: 20,color: MyColors().textColor,fontWeight: FontWeight.bold),),
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
                      child: buildMusicButton(onPressed: (){
                        setState(() {
                         isPlaying = !isPlaying;
                        });
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
  required IconData icon,
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