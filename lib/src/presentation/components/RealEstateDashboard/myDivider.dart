import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:twiddle_refactored/src/core/utils/app_colors.dart';

class MyDivider extends StatelessWidget {
  Color color; double opacity; double? width;
  MyDivider({this.color = AppColors.kSilver, this.opacity = 0.5, this.width = double.infinity,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width, height: 1.h,
      color: color.withOpacity(opacity),
    );
  }
}