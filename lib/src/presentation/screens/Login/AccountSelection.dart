import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:twiddle_refactored/src/presentation/components/Welcome/panelButtons.dart';
import 'package:twiddle_refactored/src/presentation/screens/Login/RealEstateLogin.dart';

import '../../../controller/loginController.dart';
import '../../../controller/signUpController.dart';
import '../../../core/utils/app_colors.dart';
import '../../components/Welcome/welcomeTemplate.dart';
import '../../components/login/radioButton.dart';
import '../SignUp/SignUpScreen.dart';

class AccountSelection extends StatelessWidget {
  final SignUpController signUpController = Get.put(SignUpController());
  final LoginController loginController = Get.put(LoginController());

  AccountSelection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WelcomeTemplate(
        paneltopMargin: 0.55,
        backbuttonVisibility: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5.h),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 6.w),
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
            SizedBox(height: 3.h),
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
                SizedBox(height: 6.h),
                PanelButtons(
                  buttonText: "Continue",
                  buttonColor: AppColors.mainColor,
                  textColor: AppColors.mainBg,
                  onTap: () {
                    loginController.radioValue.value == "Real Estate"
                        ? signUpController.isSignUp.value == true
                            ? Get.to(() => SignUpScreen())
                            : Get.to(() => RealEstateLogin())
                        : Get.bottomSheet(Container(
                            height: 10.h,
                            color: AppColors.mainBg,
                            child: const Center(
                                child: Text(
                              "Please select 'Real Estate' Type",
                              style: TextStyle(fontSize: 22),
                            )),
                          ));

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
