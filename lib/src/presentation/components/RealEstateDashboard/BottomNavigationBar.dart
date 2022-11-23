import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:twiddle_refactored/src/core/utils/app_assets.dart';
import 'package:twiddle_refactored/src/core/utils/app_colors.dart';
import 'package:twiddle_refactored/src/presentation/screens/RealEstateDashboard/REWallet.dart';
import '../../../controller/Real State Controllers/mainScreenController.dart';
import '../../../controller/bottomNavigationBarController.dart';
import '../../screens/RealEstateDashboard/REHome.dart';
import '../../screens/RealEstateDashboard/REMainDashboard.dart';
import '../../screens/RealEstateDashboard/SearchSP.dart';

class BottomNav extends StatelessWidget {
  final MainScreenController mainScreenController =
  Get.put(MainScreenController());
  final List screens = [
    REHome(),
    const REMainDashboard(),
     SearchSP(),
     REWallet()
  ];

  Widget currentScreen = REHome();
  final PageStorageBucket bucket = PageStorageBucket();
  final BottomNavBarController bottomNavBarController = Get.put(BottomNavBarController());

  @override
  Widget build(BuildContext context) {
    return Obx(()=> WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
          backgroundColor: AppColors.kWhite,
          body: PageStorage(
            bucket: bucket,
            child: currentScreen,
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: AppColors.mainBg.withOpacity(1),
                  spreadRadius: 10,
                  blurRadius: 10,
                  offset: const Offset(0, 9),
                )
              ],
            ),
            child: BottomAppBar(
              shape: const CircularNotchedRectangle(),
              notchMargin: 10,
              child: Container(
                height: 65,
                color: AppColors.kWhite,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        currentScreen = REHome();
                        bottomNavBarController.currentTab.value = 0;
                      },
                      child: SvgPicture.asset(AppAssets.bottomHome,
                          color: bottomNavBarController.currentTab.value == 0
                              ? AppColors.mainColor
                              : AppColors.mainBg,
                          width: 25,
                          height: 25),
                    ),
                    InkWell(
                      onTap: () {
                       currentScreen =  const REMainDashboard();
                        bottomNavBarController.currentTab.value = 1;
                      },
                      child: SvgPicture.asset(AppAssets.bottomProfile,
                          color: bottomNavBarController.currentTab.value == 1
                              ? AppColors.mainColor
                              : AppColors.mainBg,
                          width: 25,
                          height: 25),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    InkWell(
                      onTap: () {
                        currentScreen =  SearchSP();
                        bottomNavBarController.currentTab.value = 2;
                      },
                      child: SvgPicture.asset(AppAssets.bottomSP,
                          color: bottomNavBarController.currentTab.value == 2
                              ? AppColors.mainColor
                              : AppColors.mainBg,
                          width: 25,
                          height: 25),
                    ),
                    InkWell(
                      onTap: () {
                      currentScreen =  REWallet();
                        bottomNavBarController.currentTab.value = 3;
                      },
                      child: SvgPicture.asset(AppAssets.bottomPay,
                          color: bottomNavBarController.currentTab.value == 3
                              ? AppColors.mainColor
                              : AppColors.mainBg,
                          width: 25,
                          height: 25),
                    ),
                  ],
                ),
              ),
            ),
          ),
          floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              // Get.to(()=> PropertyAdd());
            },
            backgroundColor: AppColors.mainColor,
            child: Container(
              decoration: const BoxDecoration(
                  color: AppColors.kWhite, shape: BoxShape.circle),
              padding: EdgeInsets.all(5.sp),
              child: const Icon(
                Icons.add,
                color: AppColors.mainColor,
              ),
            ),
          ),
        ))
        );
  }
}
