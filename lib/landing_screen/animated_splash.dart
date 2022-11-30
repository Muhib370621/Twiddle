import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:state_agent/constants/constants.dart';
import 'package:state_agent/constants/hive/hive.dart';

import 'onboardingpage.dart';


class AnimatedSplash extends StatefulWidget {

  @override
  State<AnimatedSplash> createState() => _AnimatedSplashState();
}

class _AnimatedSplashState extends State<AnimatedSplash> {


  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
            duration: 3000,
            splash: Image.asset("assets/logo.png"),
            nextScreen:  OnBoardingPage(),
            splashIconSize: 400.sp,
            splashTransition: SplashTransition.fadeTransition,
            pageTransitionType: PageTransitionType.fade,
            backgroundColor: maincolor);
  }
}