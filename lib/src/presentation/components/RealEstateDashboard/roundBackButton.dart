import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:twiddle_refactored/src/core/utils/app_colors.dart';

class RoundBackButton extends StatelessWidget {
  Color color;
  double size;
  Color iconColor;
  RoundBackButton({
    this.color = AppColors.mainColor,
    this.size = 14,
    this.iconColor = AppColors.mainColor,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: (){
          Get.back();
        },
        child: Container(
          height: 5.h,
          width: 14.w,
          // padding: EdgeInsets.all(10.sp),
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.arrow_back_ios_rounded,
            color: AppColors.kWhite,
            size: 18.sp,
          ),
        )
    );
  }
}