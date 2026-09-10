import 'package:awwz_music/common/app_bar.dart';
import 'package:awwz_music/services/music_services.dart';
import 'package:flutter/material.dart';

import '../Widgets/music_controller.dart';
import '../theme/my_colors.dart';

class MusicListScreen extends StatelessWidget {
  const MusicListScreen({super.key});


  Widget songTile(BuildContext context,title, artist){
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
        child: Container(
          decoration: BoxDecoration(
            color: MyColors().lighttxtColor,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: MyColors().accentColor.withAlpha(150),

                offset: Offset(1,2),
                blurRadius: 5,
                spreadRadius: 1,
              )
            ]
          ),


          child: ListTile(
            leading: Icon(Icons.music_note,size: 38,),
            title: Text(title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: MyColors().bgColor, ),),
            subtitle: Text(artist,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: MyColors().bgColor),),
            trailing: Icon(Icons.more_vert),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => MusicController()));
            },
          ),
        ),
      );

    }

    Future<void> loadSongs() async {

    final musicServices = MusicServices();
    await musicServices.fetchAudio();

  }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: MyColors().bgColor,
        body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Music's Library",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 30,
                color: MyColors().textColor,
                fontWeight: FontWeight.bold,

              ),

            ),
            SizedBox(height: 12,),

Expanded(child: ListView(children: [
// for(int i = 0; i < 10; i++) ...[
ElevatedButton(onPressed: () async {
  await loadSongs();
}, child: Text("Click")),

  songTile(context,"Aankhon Aankhon", "Yo Yo Honey Singh"), SizedBox(height: 12),

  songTile(context,"Grind", "Emiway Bantai"), SizedBox(height: 12),
  songTile(context,"Luka Chuppi", "Seedhe Maut"), SizedBox(height: 12),
  songTile(context,"Yeh Fitoor Mera", "Arijit Singh"), SizedBox(height: 12),


        // ],
],
    ),
    ),
            ],
        ),
      ),
    );
  }
}
