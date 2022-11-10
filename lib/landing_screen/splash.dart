import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'onboardingpage.dart';


class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    _navHome();
    super.initState();

  }

  Future _navHome() async {
    await Future.delayed(Duration(seconds: 4),(){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OnBoardingPage()));
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Color(0xFF0336FF),
       body: Center(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.center,
           children: [
             SvgPicture.asset('assets/splash.svg'),
           ],
         ),
       ),
     );
  }
}
