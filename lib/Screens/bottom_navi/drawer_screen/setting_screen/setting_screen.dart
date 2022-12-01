import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:state_agent/Api_Services/user/login_controller.dart';
import 'package:state_agent/Screens/bottom_navi/drawer_screen/setting_screen/privacy_screen.dart';
import 'package:state_agent/Screens/bottom_navi/drawer_screen/setting_screen/term_use.dart';
import 'package:state_agent/Utilities/dialogueBox.dart';
import 'package:state_agent/bottom_navigation/drawer/faq/faq_screen.dart';
import 'package:state_agent/bottom_navigation/drawer/help/help.dart';
import 'package:state_agent/bottom_navigation/drawer/twiddle_inv/twiddle_inv.dart';
import 'package:state_agent/constants/constants.dart';

import '../../../../Utilities/comp_screen.dart';
import '../../../../bottom_navigation/drawer/faq/Submit_your_question.dart';
import '../../../../constants/get_date_time.dart';
import '../../../../constants/methods.dart';
import 'notification_screen.dart';

class MySetting extends StatefulWidget {
  const MySetting({Key? key}) : super(key: key);

  @override
  _MySettingState createState() => _MySettingState();
}

class _MySettingState extends State<MySetting> {
  // LoginController loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: Get.height,
        width: Get.width,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            Row(
              children: [
                RoundBackButton(),
                SizedBox(width: 15),
                Text(
                  "My App Settings",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
                child: ListView(
              children: [
                settingRowHome(
                    icon: "assets/notifi.svg",
                    title: "Notifications",
                    onTap: () {
                      Get.to(() => NotificationScreen());
                    }),
                SizedBox(height: 20),
                settingRowHome(
                    icon: "assets/recom.svg",
                    title: "Recommend a friend",
                    onTap: () {}),
                SizedBox(height: 20),
                settingRowHome(
                    icon: "assets/privacy.svg",
                    title: "Privacy Policy",
                    onTap: () {
                      Get.to(() => PrivacyScreen());
                    }),
                SizedBox(height: 20),
                settingRowHome(
                    icon: "assets/term.svg",
                    title: "Terms of Use",
                    onTap: () {
                      Get.to(() => TermsUseScreen());
                    }),
                SizedBox(
                    // height: authUser['accType'] == 'Service Provider' ?
                    height:20
                        // : 0
                ),
                // authUser['accType'] == 'Service Provider'
                //     ?
                settingRowHome(
                        icon: "assets/drawer/about.svg",
                        title: "About Twiddle",
                        onTap: () {
                          Get.to(() => TwiddleInv());
                        })
                //     :
                // Container()
                ,
                SizedBox(
                    height:
                    // authUser['accType'] == 'Service Provider' ?
                    20
                        // : 0
                ),
                // authUser['accType'] == 'Service Provider'
                //     ?
                // settingRowHome(
                //         icon: "assets/faq.svg",
                //         title: "FAQs",
                //         onTap: () {
                //           Get.to(() => FaqScreen());
                //         })
                //     :
                Container(),
                SizedBox(
                    height:
                    // authUser['accType'] == 'Service Provider' ?
                    20
                        // : 0
                ),
                // authUser['accType'] == 'Service Provider'
                //     ? settingRowHome(
                //         icon: "assets/submit.svg",
                //         iconColor: maincolor,
                //         height: 25,
                //         title: "Submit Your Question",
                //         onTap: () {
                //           Get.to(() => SubmitYourQuestion());
                //         })
                //     :
                Container(),
                SizedBox(height: 20),
                settingRowHome(
                    icon: "assets/helpsetting.svg",
                    title: "Help",
                    onTap: () {
                      Get.to(() => HelpDesk());
                    }),
                SizedBox(height: 20),
                Container(
                  width: 100,
                  height: 60,
                  decoration: BoxDecoration(
                      color: Color(0xff0336FF),
                      border: Border.all(width: 1, color: Color(0xff373B4D1A)),
                      borderRadius: BorderRadius.circular(10)),
                  child: InkWell(
                    onTap: () {
                      dialogBox(
                        context,
                        "Confirm Log Out?",
                        "Cancel",
                        "Yes",
                        SvgPicture.asset('assets/check.svg'),
                        () {
                          getDateTime();
                          setStatus('last seen at ${time}');
                          // loginController.logout();
                        },
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          SvgPicture.asset("assets/logout.svg",
                              width: 30, height: 30),
                          SizedBox(width: 10),
                          Text("Log Out",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

Widget settingRowHome(
    {String? icon,
    Color? iconColor,
    double? height,
    String? title,
    required VoidCallback onTap}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      width: 100,
      height: 60,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 1, color: Color(0xff373B4D1A)),
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                SvgPicture.asset(
                  icon!,
                  height: height == null ? 30 : height,
                  color: iconColor,
                ),
                SizedBox(width: 10),
                Text(title!,
                    style: TextStyle(color: Colors.black, fontSize: 15)),
              ],
            ),
            Icon(Icons.arrow_forward_ios_outlined, color: Colors.black)

            // Image.asset('assets/icons/forwardarrow.png',width: 15,height: 15,color: Colors.white,),
          ],
        ),
      ),
    ),
  );
}
