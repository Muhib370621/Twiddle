import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../core/utils/app_colors.dart';

class PanelButtons extends StatelessWidget {
  String buttonText;
   PanelButtons({Key? key,required this.buttonText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5.h,
      width: 80.w,
      decoration: const BoxDecoration(
        color: AppColors.mainColor,
        borderRadius: BorderRadius.all(Radius.circular(22)),),
      child: Center(child: Text(buttonText, style: TextStyle(color: AppColors.mainBg,fontSize: 16.sp),)),
    );
  }
}
