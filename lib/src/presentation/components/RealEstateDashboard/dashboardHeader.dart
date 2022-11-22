import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';
import 'iconButton.dart';
import 'myContainer.dart';

class DashboardHeader extends StatelessWidget {
  String image;
  String name;
  VoidCallback? onDrawerTap;

  DashboardHeader(
      {Key? key, this.name = 'John Recardo', this.onDrawerTap, this.image = ''})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(30),
              bottomLeft: Radius.circular(30)),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [AppColors.mainColor, AppColors.darkblue])),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(AppAssets.profileAvatar),
          ),
          SizedBox(
            height: 2.h,
          ),
          Text(name,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.kWhite,
              )),
          SizedBox(
            height: 2.h,
          ),
          MyContainer(
            // horizontalMargin: 10,
            color: AppColors.transparent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 12.5.w,),
                    Iconbutton(
                        onTap: () {
                          // Get.to(()=> InvestNow());
                        },
                        height: 45.h,
                        width: 130.w,
                        shadowColor: AppColors.transparent,
                        radius: 10,
                        buttonColor: AppColors.kGreenAccent,
                        myIconsSize: 20,
                        MyIcon: SvgPicture.asset(AppAssets.drawerInvest),
                        text: 'Invest Now'),
                    SizedBox(
                      width: 5.w,
                    ),
                    Iconbutton(
                        onTap: () {
                          // Get.to(()=> TwiddleWallet());
                        },
                        height: 45.h,
                        width: 130.w,
                        shadowColor: AppColors.transparent,
                        radius: 10,
                        buttonColor: AppColors.kWhite,
                        color: AppColors.mainColor,
                        MyIcon: SvgPicture.asset(AppAssets.walletIcon),
                        myIconsSize: 25,
                        text: 'My Wallet')
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                Iconbutton(
                    onTap: () {
                      // Get.to(()=> TenantsList());
                    },
                    radius: 15,
                    shadowColor: AppColors.transparent,
                    myIconsSize: 20,
                    buttonColor: AppColors.kWhite,
                    color: AppColors.mainColor,
                    height: 45.h,
                    width: 280.w,
                    MyIcon: SvgPicture.asset(AppAssets.tenantIcon),
                    text: 'My Tenants'),
                SizedBox(
                  height: 3.h,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
