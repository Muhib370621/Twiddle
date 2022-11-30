import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:state_agent/Screens/user_auth/CreateAccount/createAcount.dart';
import 'package:state_agent/Screens/user_auth/loginScreen.dart';
import 'package:state_agent/Screens/user_auth/signUpController.dart';
import 'package:state_agent/service_provider/bottom_navigation/dashboard/sp_dashboard.dart';

import '../../bottom_navigation/bottom_navigation.dart';
import '../../constants/appColors.dart';
import '../../constants/hive/hive.dart';
import '../../landing_screen/welcome_page.dart';
import 'components/panelButtons.dart';
import 'components/radioButton.dart';
import 'components/welcomeTemplate.dart';
import 'loginController.dart';

class AccountSelection extends StatelessWidget {
  AccountSelection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SignUpController signUpController = Get.put(SignUpController());
    final LoginController loginController = Get.put(LoginController());
    return Scaffold(
      body: WelcomeTemplate(
        paneltopMargin: 0.59,
        backbuttonVisibility: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 48.h),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 22.w),
                child: Text(
                  "Login Type :",
                  style: TextStyle(
                    fontSize: 22.sp,
                    color: AppColors.welcomeTwiddle,
                    fontFamily: "PoppinsBold",
                  ),
                  // textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(height: 13.h),
            Column(
              children: [
                RadioButton(
                  labelText: 'Real Estate',
                ),
                RadioButton(
                  labelText: 'FSP (Financial Service Provider)',
                ),
                RadioButton(
                  labelText: 'Service Provider',
                ),
                SizedBox(height: 42.h),
                PanelButtons(
                  buttonText: "Continue",
                  buttonColor: AppColors.mainColor,
                  textColor: AppColors.mainBg,
                  onTap: () {
                    loginController.radioValue.value == "Real Estate"
                        ? signUpController.isSignUp.value == true
                            ? Get.to(() => CreateAccount())
                            : Get.to(() => LoginScreen())
                        : Get.bottomSheet(
                            Container(
                              height: 50.h,
                              color: AppColors.mainBg,
                              child: const Center(
                                child: Text(
                                  "Please select 'Real Estate' Type",
                                  style: TextStyle(fontSize: 22),
                                ),
                              ),
                            ),
                          );
                    print(loginController.radioValue.value);
                  },
                  borderColor: AppColors.mainColor,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
