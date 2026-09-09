import 'package:awwz_music/Screens/music_list_screen.dart';
import 'package:awwz_music/Screens/splash_screen.dart';
import 'package:awwz_music/Widgets/music_controller.dart';
import 'package:awwz_music/helper/app_bar.dart';
import 'package:awwz_music/helper/my_colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors().bgColor,
      appBar: AppBar(title: MyAppBar(), backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 4),
        child: MusicListScreen(),
      )



    );
  }
}
