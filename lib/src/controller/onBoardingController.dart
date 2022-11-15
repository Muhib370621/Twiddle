import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twiddle_refactored/src/core/utils/app_assets.dart';
import 'package:twiddle_refactored/src/model/onboarding/onBoardModel.dart';

class OnboardingController extends GetxController{
  final List <OnBoard> pages = [
    OnBoard("Rent & Buy", "Home",AppAssets.rentBuyIcon),
    OnBoard("Secure", "Payment", AppAssets.securePaymentIcon),
    OnBoard("Invest In", "Real Estate", AppAssets.investInRealIcon),
  ].obs;
  Rx<PageController> pageController = PageController().obs;
  RxInt selectedIndex = 0.obs;
}