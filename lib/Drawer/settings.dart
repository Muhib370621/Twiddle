import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:state_agent/Api_Services/user/login_controller.dart';
import 'package:state_agent/Drawer/settings/profile.dart';
import 'package:state_agent/Screens/bottom_navi/drawer_screen/setting_screen/setting_screen.dart';
import 'package:state_agent/bottom_navigation/drawer/help/help.dart';
import 'package:state_agent/constants/constants.dart';

import '../Utilities/dialogueBox.dart';

class Setting extends StatelessWidget {
  Setting({Key? key}) : super(key: key);

  LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BackButtonText(text: 'Settings', size: 26),
            GestureDetector(
              onTap: ()=> dialogBox(context,
                "Confirm Log Out?",
                "Cancel",
                "Yes",
                SvgPicture.asset('assets/check.svg'),
                    () {
                  loginController.logout();
                },
              ),
                child: PoppinsText(text: 'Log Out', size: 14, color: maincolor, fontWeight: FontWeight.w700))
          ],
        ),
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: transparent,
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Height(size: 15),
              Push(
                onTap: ()=> Get.to(()=> Profile()),
                text: 'My Profile'
              ),

              Height(size: 15),
              GestureDetector(
                onTap: (){},
                child: MyContainer(
                  height: 55, radius: 50,
                  horizontalPadding: 20,
                  color: maincolor,
                  child: Row(
                    children: [

                      MyContainer(
                        width: 30,
                        child: Icon(Icons.person_rounded, color: white),
                      ),
                      Width(size: 10),
                      Expanded(
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            PoppinsText(text: 'Identity Verified', size: 14, fontWeight: FontWeight.w500, color: white),
                            Icon(Icons.check_circle, color: white, size: 20.sp)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              
              
              Height(size: 20),
              PoppinsText(text: 'Other', size: 26, fontWeight: FontWeight.w500),

              Height(size: 15),
              Push(
                  //onTap: ()=> Get.to(()=> Profile()),
                text: 'Your GPS Location'
              ),

              Height(size: 15),
              Push(
                  onTap: ()=> Get.to(()=> HelpDesk()),
                  text: 'Help & Support'
              ),

              Height(size: 15),
              Push(
                  onTap: ()=> Get.to(()=> MySetting()),
                  text: 'App Settings'
              )

            ],
          ),
        ),
      ),
    );
  }
}

class Push extends StatelessWidget {
  String? text; VoidCallback? onTap;
  Push({Key? key,
    this.text, this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: MyContainer(
        height: 55, radius: 50,
        borderColor: lightButton,
        horizontalPadding: 20,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            PoppinsText(text: text!, size: 14, fontWeight: FontWeight.w500,),
            Icon(Icons.arrow_forward, color: maincolor, size: 20.sp)

          ],
        ),
      ),
    );
  }
}
