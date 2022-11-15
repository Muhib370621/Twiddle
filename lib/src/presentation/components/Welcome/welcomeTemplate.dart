import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:twiddle_refactored/src/core/utils/app_assets.dart';
import 'package:twiddle_refactored/src/presentation/components/Welcome/panelButtons.dart';

import '../../../core/utils/app_colors.dart';

class WelcomeTemplate extends StatelessWidget {
  Widget? child;

  WelcomeTemplate({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            top: 0,
            child: SizedBox(
              width: Get.width,
              height: Get.height * 0.66,
              child: Image.asset(AppAssets.welPanelBg, fit: BoxFit.cover),
            )),
        Positioned.fill(
          top: Get.height * 0.40,
          child: Container(
            height: Get.height * 0.6,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),
            child: Column(
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.w),
                    child: child,
                  ),
                ),
                PanelButtons(buttonText: 'Sign In',),
                SizedBox(height: 2.h,),
                PanelButtons(buttonText: 'Create an Account',),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
