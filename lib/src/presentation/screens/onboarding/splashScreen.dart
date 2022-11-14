import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:twiddle_refactored/src/core/utils/app_colors.dart';

import 'firstOnboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future _moveToOnboard() async {
    await Future.delayed(const Duration(seconds: 4),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const OnBoardingPage()));
    });
  }

  @override
  void initState() {
    _moveToOnboard();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/images/onboarding/icons/splashIcon.svg'),
          ],
        ),
      ),
    );
  }
}
