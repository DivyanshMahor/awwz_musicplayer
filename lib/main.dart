import 'package:awwz_music/Screens/home_screen.dart';
import 'package:flutter/material.dart';

import 'theme/my_colors.dart';

void main(){
  runApp(const AwwZ());
}

class AwwZ extends StatelessWidget {
  const AwwZ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AwwZ - Music player',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
