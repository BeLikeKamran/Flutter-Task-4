import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'Calculator.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

// This Page is for splash screen
// package importing =>    import 'package:animated_splash_screen/animated_splash_screen.dart';
// also this =>  import 'package:page_transition/page_transition.dart';
//  check dependencies for boths  =>> animated_splash_screen: ^1.1.0

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Clean Code',
        home: AnimatedSplashScreen(
          duration: 3000, // in miliseconds (3 sec)
          splash: 'assets/App Store.png',
          splashTransition: SplashTransition.fadeTransition,
          pageTransitionType: PageTransitionType.rightToLeft,
          backgroundColor: Colors.blue,
          nextScreen: Calculator(),
        ));
  }
}
