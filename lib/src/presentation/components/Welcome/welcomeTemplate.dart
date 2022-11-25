import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:twiddle_refactored/src/core/utils/app_assets.dart';
import 'package:twiddle_refactored/src/core/utils/app_colors.dart';



class WelcomeTemplate extends StatelessWidget {
  Widget child;
  num paneltopMargin;
  bool backbuttonVisibility;
  WelcomeTemplate({Key? key, required this.child, required this.paneltopMargin,required this.backbuttonVisibility})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            top: 0,
            child: Stack(children: [
              SizedBox(
                width: Get.width,
                height: Get.height * 0.66,
                child: Image.asset(AppAssets.welPanelBg, fit: BoxFit.fill),
              ),
              Visibility(
                visible: backbuttonVisibility,
                child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    height: 5.h,
                    width: 10.w,
                    margin: EdgeInsets.only(left: 5.w, top: 5.h),
                    decoration: const BoxDecoration(
                      color: AppColors.mainBg,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: const Icon(Icons.arrow_back_ios_new),
                  ),
                ),
              )
            ])),
        Positioned.fill(
          top: Get.height * paneltopMargin,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              height: Get.height * 1.1,
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
                  child,
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
