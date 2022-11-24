import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../presentation/screens/RealEstateDashboard/REHome.dart';
import '../presentation/screens/RealEstateDashboard/MainDashboard/REMainDashboard.dart';
import '../presentation/screens/RealEstateDashboard/REWallet.dart';
import '../presentation/screens/RealEstateDashboard/SearchSP.dart';

class BottomNavBarController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }
  RxInt currentTab = 0.obs;

}