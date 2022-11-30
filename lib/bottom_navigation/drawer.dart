import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:state_agent/Api_Services/user/login_controller.dart';

import '../Screens/bottom_navi/drawer_screen/install_dash/your_install.dart';
import '../Screens/bottom_navi/drawer_screen/setting_screen/setting_screen.dart';
import '../Utilities/dialogueBox.dart';
import '../constants/constants.dart';
import '../constants/get_date_time.dart';
import '../constants/methods.dart';
import 'bottom_navigation.dart';
import 'dashboard/invest/invest_now.dart';
import 'drawer/faq/faq_screen.dart';
import 'drawer/favourite/favourites.dart';
import 'drawer/help/help.dart';
import 'drawer/notification/Notifications.dart';
import 'drawer/recent_viewed/recentlyViewed.dart';
import 'drawer/twiddle_inv/twiddle_inv.dart';

class MyDrawer extends StatelessWidget {
  MyDrawer({Key? key}) : super(key: key);

  // LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Drawer(

      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SizedBox(height: 60),
              Text("Hello!", style: TextStyle(fontFamily: "PoppinsBold", fontSize: 16, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text("Good Morning", style: TextStyle(fontFamily: "PoppinsRegular", fontSize: 16)),

              SizedBox(height: 15),
              Container(width: Get.width*0.5, height: 0.8, color: Colors.black26),

              SizedBox(height: 15),
              InkWell(
                onTap: (){
                  Get.to(()=> InvestNow());
                },
                child: Container(
                  height: 40,
                  width: Get.width*0.52,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.blue.withOpacity(1), width: 4),
                    color: maincolor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/drawer/invest.svg'),
                      SizedBox(width: 10),
                      Text('Invest Now', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600,),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 25),
              InkWell(
                  onTap: (){
                    // if(user['accType'] == 'Property Owner' || user['accType'] == 'Real Estate Agent'){
                    //   Get.to(()=>NaviOwnerPro());
                    // }
                    // else{
                    //   Get.to(()=>BottomNav());
                    // }
                    Get.to(()=>BottomNav());
                  },
                  child:drawerItem("Home", "assets/drawer/homeDra.svg")
              ),
              SizedBox(height: 15),
              Container(width: Get.width*0.5, height: 1, color: Colors.black26),
              SizedBox(height: 15),
              InkWell(
                onTap: () {
                  Get.to(()=>Notifications());
                },
                child: drawerItem("Notifications", "assets/drawer/notification.svg"),

              ),
              SizedBox(height: 15),
              Container(width: Get.width*0.5, height: 1, color: Colors.black26),
              SizedBox(height: 15),
              InkWell(
                onTap: () {
                  Get.to(()=>RecentlyViewed());
                },
                child: drawerItem("Recently Viewed", "assets/drawer/recent.svg",
                ),
              ),
              SizedBox(height: 15),
              Container(width: Get.width*0.5, height: 1, color: Colors.black26),
              SizedBox(height: 15),
              InkWell(
                onTap: () {
                  Get.to(()=>Favourites());
                },
                child: drawerItem("My Favorites", "assets/drawer/favourites.svg"),
              ),
              SizedBox(height: 15),
              Container(width: Get.width*0.5, height: 1, color: Colors.black26),
              SizedBox(height: 15),
              InkWell(
                onTap: () {
                  Get.to(()=>RenterInstall());
                },
                child: drawerItem("Instalment Dashboard", "assets/drawer/install.svg"),

              ),
              SizedBox(height: 15),
              Container(width: Get.width*0.5, height: 1, color: Colors.black26),
              SizedBox(height: 15),
              InkWell(
                onTap: (){
                  Get.to(()=>HelpDesk());
                },
                child: drawerItem("Help", "assets/drawer/help.svg"),
              ),
              SizedBox(height: 15),
              Container(width: Get.width*0.5, height: 1, color: Colors.black26),
              SizedBox(height: 15),
              InkWell(
                onTap: (){
                  Get.to(()=>FaqScreen());
                },
                child: drawerItem("FAQs", "assets/drawer/faq.svg"),
              ),
              SizedBox(height: 15),
              Container(width: Get.width*0.5, height: 1, color: Colors.black26),
              SizedBox(height: 15),
              InkWell(
                onTap: (){
                  Get.to(()=>TwiddleInv());
                },
                child: drawerItem("About Twiddle INV", "assets/drawer/about.svg"),
              ),
              SizedBox(height: 15),
              Container(width: Get.width*0.5, height: 1, color: Colors.black26),
              SizedBox(height: 15),
              InkWell(
                onTap: (){
                  Get.to(()=>MySetting());
                },
                child: drawerItem("Settings","assets/drawer/setting.svg"),
              ),
              SizedBox(height: 15),
              Container(width: Get.width*0.5, height: 1, color: Colors.black26),
              SizedBox(height: 15),
              InkWell(
                child: drawerItem("Log Out", "assets/drawer/logout.svg",),
                onTap: ( ) => dialogBox(
                  context,
                  "Confirm Log Out?",
                  "Cancel",
                  "Yes",
                  SvgPicture.asset('assets/check.svg'),
                      () {
                    // getDateTime();
                    // setStatus('last seen at ${time}');
                    // loginController.logout();
                  },
                ),
              ),
              SizedBox(height: 20)

            ],
          ),
        ),
      ),

    );
  }
  Widget drawerItem(String text, String image) {
    final textColor = Color(0xFF2E3034);
    return Row(
      children: [
        SvgPicture.asset(image),
        Width(size: 20),
        Text(text, style: TextStyle(color: textColor)),


      ],
    );

  }
}