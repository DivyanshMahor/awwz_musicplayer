import 'package:flutter/material.dart';

import 'my_colors.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar ({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
backgroundColor: Colors.transparent,
      centerTitle: true,
      title: Text("AwwZ", style:
      TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: MyColors().textColor

      ),),


    );
  }
}
