import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PanelButtons extends StatelessWidget {
  String buttonText;
  Color? buttonColor;
  void Function()? onTap;
  Color? textColor;
  Color borderColor;

  PanelButtons({Key? key,required this.buttonText, required this.buttonColor, required this.textColor, required this.onTap, required this.borderColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40.h,
        width: 280.w,
        decoration:  BoxDecoration(
          color: buttonColor,
          border: Border.all(color: borderColor,width: 0.5.w),
          borderRadius: BorderRadius.all(Radius.circular(22)),),
        child: Center(child: Text(buttonText.toString(), style: TextStyle(color: textColor,fontSize: 16.sp),)),
      ),
    );
  }
}