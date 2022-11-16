import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:twiddle_refactored/src/core/utils/app_assets.dart';
import 'package:twiddle_refactored/src/core/utils/app_colors.dart';

import '../../components/Welcome/panelButtons.dart';
import '../../components/Welcome/welcomeTemplate.dart';
import '../Login/AccountSelection.dart';


class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WelcomeTemplate(
        paneltopMargin: 0.40,
        backbuttonVisibility: false,
        child: Column(
          children: [
            SizedBox(height: 5.h),
            SvgPicture.asset(AppAssets.welPanelIcon),
            SizedBox(height: 2.h),
            Text(
              "Welcome to Twiddle",
              style:
                  TextStyle(fontSize: 18.sp, color: AppColors.welcomeTwiddle),
            ),
            SizedBox(height: 5.h),
            PanelButtons(
              buttonText: 'Sign In',
              buttonColor: AppColors.mainColor,
              textColor: AppColors.kWhite,
              onTap: () {
                Get.to(() => AccountSelection());
              }, borderColor: AppColors.mainColor,
            ),
            SizedBox(
              height: 2.h,
            ),
            PanelButtons(
                buttonText: 'Create an Account',
                borderColor: AppColors.mainColor,
                buttonColor: AppColors.kWhite,
                textColor: AppColors.mainColor,
                onTap: () {}),
          ],
        ),
      ),
    );
  }
}
