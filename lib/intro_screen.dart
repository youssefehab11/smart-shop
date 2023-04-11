
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:graduationproject/auth_screen.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splashIconSize: 500,
      backgroundColor: Colors.black54,
      splash: Lottie.asset("assets/lotties/welcome-animation.json"),
    animationDuration:const Duration(seconds: 1),
     nextScreen: AuthScreen());
  }
}
