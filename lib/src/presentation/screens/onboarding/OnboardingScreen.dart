import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/onBoardingController.dart';
import '../../components/onboarding/onboardingBody.dart';

class OnboardingPage extends StatelessWidget {

  OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final OnboardingController onboardController = Get.put(OnboardingController());
    return Scaffold(
      body: Obx(() => PageView.builder(
          itemCount: onboardController.pages.length,
          controller: onboardController.pageController.value,
          onPageChanged: (index){
            // setState(() {
            onboardController.selectedIndex.value = index;
            // });
          },
          itemBuilder: (context,index) {
            return OnboardBody(
                text1: onboardController.pages[index].text1,
                text2: onboardController.pages[index].text2,
                image: onboardController.pages[index].image
            );
          }),)

    );
  }
}
