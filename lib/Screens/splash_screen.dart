// import 'package:flutter/material.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';
// import 'package:splashscreen/splashscreen.dart';
//
// import '../helper/my_colors.dart';
// import 'home_screen.dart';
//
// class SplashScreens extends StatefulWidget {
//   const SplashScreens({super.key});
//
//   @override
//   State<SplashScreens> createState() => _SplashScreensState();
// }
//
// class _SplashScreensState extends State<SplashScreens> {
//   @override
//   Widget build(BuildContext context) {
//     return FlutterNativeSplash(
// image: Image.asset("icon/awwz_icon.png"),
//       title: new Text(
//         "AwwZ",
//         style: TextStyle(
//           fontStyle: FontStyle.italic,
//           fontWeight: FontWeight.w500,
//           color: Colors.white,
//           fontSize: 23,
//         ),
//       ),
//       backgroundColor: MyColors().bgColor,
//       seconds: 6,
//       loadingText: Text("Waiting..."),
//       loadingTextPadding: EdgeInsets.all(20),
//       useLoader: false,
//       navigateAfterSeconds: HomeScreen(), styleTextUnderTheLoader:
//       TextStyle(fontStyle: FontStyle.italic,
//         fontWeight: FontWeight.w500,
//         color: Colors.white,
//         fontSize: 23,),
//     );
//   }
// }
