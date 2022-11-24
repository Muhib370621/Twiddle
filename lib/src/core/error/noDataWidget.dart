import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../utils/app_assets.dart';
import '../utils/app_colors.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(AppAssets.noData),
        SizedBox(
          height: 2.h,
        ),
        Text(
          "No data Found",
          style: TextStyle(
            fontSize: 15.sp,
            color: AppColors.kLightGrey,
          ),
        ),
      ],
    );
  }
}
