import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:twiddle_refactored/src/core/utils/app_assets.dart';

import '../../../../core/utils/app_colors.dart';
import '../iconButton.dart';
import '../myContainer.dart';

class TwHeader extends StatelessWidget {
  final amount;

  TwHeader({Key? key, this.amount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyContainer(
      horizontalPadding: 6,
      color: AppColors.mainColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 2.h,
          ),
          Text(
            'Total Available Amount',
            style: TextStyle(fontSize: 16.sp, color: AppColors.kWhite),
          ),
          SizedBox(height: 3.h,),
          Text(
            'Ghc $amount',
            style: GoogleFonts.quicksand(
                fontSize: 26.sp, color: AppColors.kWhite, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 2.h),
          Row(
            children: [
              Expanded(
                  child: Iconbutton(
                    width: 50.w,
                // padding: 5,
                size: 14.5.sp,
                // myIconsSize: 20,
                height: 35.h,
                MyIcon: SvgPicture.asset(AppAssets.walletIcon),
                buttonColor: AppColors.kWhite,
                color: AppColors.mainColor,
                text: 'Withdraw Money',
              )),
              SizedBox(
                width: 5.w,
              ),
              Expanded(
                  child: Iconbutton(
                onTap: () {
                  // Get.to(() => TopUpWallet());
                },
                // padding: 5,
                size: 14.5.sp,
                // myIconsSize: 20,
                height: 35.h,
                MyIcon: SvgPicture.asset(
                  AppAssets.drawerInvest,
                  color: AppColors.mainColor,
                ),
                buttonColor: AppColors.kWhite,
                color: AppColors.mainColor,
                text: 'Top-Up Balance',
              )),
            ],
          ),
          SizedBox(
              height: 4.h,
          ),
          Row(
            children: [
              Expanded(
                  child: Iconbutton(
                onTap: () {
                  // Get.to(() => DashboardInvest());
                },
                // padding: 5,
                size: 14.5.sp,
                // myIconsSize: 20,
                height: 35.h,
                MyIcon: SvgPicture.asset(AppAssets.walletInvest),
                buttonColor: AppColors.kWhite,
                color: AppColors.mainColor,
                text: 'Invest Dashboard',
              )),
              SizedBox(width: 5.w,
              ),
              Expanded(
                  child: Iconbutton(
                onTap: () {
                  // Get.to(() => RentDashboard());
                },
                // padding: 5,
                size: 14.5.sp,
                // myIconsSize: 20,
                height: 35.h,
                MyIcon: SvgPicture.asset(AppAssets.walletRent),
                buttonColor: AppColors.kWhite,
                color: AppColors.mainColor,
                text: 'Rent Dashboard',
              )),
            ],
          ),
          SizedBox(
            height: 7.h,
          ),
        ],
      ),
    );
  }
}
