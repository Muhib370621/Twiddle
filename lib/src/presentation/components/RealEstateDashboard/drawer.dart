import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:twiddle_refactored/src/core/utils/app_assets.dart';
import 'package:twiddle_refactored/src/core/utils/app_colors.dart';
import 'package:twiddle_refactored/src/presentation/components/RealEstateDashboard/BottomNavigationBar.dart';

class MyDrawer extends StatelessWidget {
  MyDrawer({Key? key}) : super(key: key);

  // LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 6.h),
            Text("Hello!",
                style: TextStyle(
                    fontFamily: "PoppinsBold",
                    fontSize: 16,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text("Good Morning",
                style: TextStyle(fontFamily: "PoppinsRegular", fontSize: 16)),
            SizedBox(height: 15),
            Container(
              width: Get.width * 0.5,
              height: 0.8,
              color: Colors.black26,
            ),
            SizedBox(height: 15),
            InkWell(
              onTap: () {
                // Get.to(()=> InvestNow());
              },
              child: Container(
                height: 40,
                width: Get.width * 0.52,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border:
                      Border.all(color: Colors.blue.withOpacity(1), width: 4),
                  color: AppColors.mainColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/drawer/invest.svg'),
                    SizedBox(width: 10),
                    Text(
                      'Invest Now',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 25),
            InkWell(
                onTap: () {
                  // if(user['accType'] == 'Property Owner' || user['accType'] == 'Real Estate Agent'){
                  //   Get.to(()=>NaviOwnerPro());
                  // }
                  // else{
                  //   Get.to(()=>BottomNav());
                  // }
                  Get.to(() => BottomNav());
                },
                child: drawerItem("Home", "assets/drawer/homeDra.svg")),
            SizedBox(height: 15),
            Container(width: Get.width * 0.5, height: 1, color: Colors.black26),
            SizedBox(height: 15),
            InkWell(
              onTap: () {
                // Get.to(()=>Notifications());
              },
              child:
                  drawerItem("Notifications", AppAssets.drawer_notification),
            ),
            SizedBox(height: 15),
            Container(width: Get.width * 0.5, height: 1, color: Colors.black26),
            SizedBox(height: 15),
            InkWell(
              onTap: () {
                // Get.to(()=>RecentlyViewed());
              },
              child: drawerItem(
                "Recently Viewed",
                AppAssets.drawer_recent,
              ),
            ),
            SizedBox(height: 15),
            Container(width: Get.width * 0.5, height: 1, color: Colors.black26),
            SizedBox(height: 15),
            InkWell(
              onTap: () {
                // Get.to(()=>Favourites());
              },
              child: drawerItem("My Favorites", AppAssets.drawer_favourites),
            ),
            SizedBox(height: 15),
            Container(width: Get.width * 0.5, height: 1, color: Colors.black26),
            SizedBox(height: 15),
            InkWell(
              onTap: () {
                // Get.to(()=>RenterInstall());
              },
              child: drawerItem(
                  "Instalment Dashboard", "assets/drawer/install.svg"),
            ),
            SizedBox(height: 15),
            Container(width: Get.width * 0.5, height: 1, color: Colors.black26),
            SizedBox(height: 15),
            InkWell(
              onTap: () {
                // Get.to(()=>HelpDesk());
              },
              child: drawerItem("Help", "assets/drawer/help.svg"),
            ),
            SizedBox(height: 15),
            Container(width: Get.width * 0.5, height: 1, color: Colors.black26),
            SizedBox(height: 15),
            InkWell(
              onTap: () {
                // Get.to(()=>FaqScreen());
              },
              child: drawerItem("FAQs", "assets/drawer/faq.svg"),
            ),
            SizedBox(height: 15),
            Container(width: Get.width * 0.5, height: 1, color: Colors.black26),
            SizedBox(height: 15),
            InkWell(
              onTap: () {
                // Get.to(()=>TwiddleInv());
              },
              child: drawerItem("About Twiddle INV", "assets/drawer/about.svg"),
            ),
            SizedBox(height: 15),
            Container(width: Get.width * 0.5, height: 1, color: Colors.black26),
            SizedBox(height: 15),
            InkWell(
              onTap: () {
                // Get.to(()=>MySetting());
              },
              child: drawerItem("Settings", "assets/drawer/setting.svg"),
            ),
            SizedBox(height: 15),
            Container(width: Get.width * 0.5, height: 1, color: Colors.black26),
            SizedBox(height: 15),
            InkWell(
                child: drawerItem(
                  "Log Out",
                  "assets/drawer/logout.svg",
                ),
                onTap: () {}
                //     dialogBox(
                //   context,
                //   "Confirm Log Out?",
                //   "Cancel",
                //   "Yes",
                //   SvgPicture.asset('assets/check.svg'),
                //       () {
                //     // getDateTime();
                //     // setStatus('last seen at ${time}');
                //     // loginController.logout();
                //   },
                // ),
                ),
            SizedBox(height: 20)
          ],
        ),
      ),
    );
  }

  Widget drawerItem(String text, String image) {
    final textColor = Color(0xFF2E3034);
    return Row(
      children: [
        SvgPicture.asset(image),
        SizedBox(
          width: 5.w,
        ),
        Text(
          text,
          style: TextStyle(
            color: textColor,
          ),
        ),
      ],
    );
  }
}
