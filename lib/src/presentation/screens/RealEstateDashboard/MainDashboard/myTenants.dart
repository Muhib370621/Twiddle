import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../components/topWithblueBackButton.dart';

class MyTenants extends StatelessWidget {
  const MyTenants({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TopWithBackButton(
                text: 'My Tenants',
              ),
            ],
          ),
          SizedBox(
            height: 4.h,
          ),
          Container(
            height: 7.5.h,
            width: 90.w,
            // color: Colors.green,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    AppColors.pink,
                    AppColors.violet,
                  ],
                )
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(
                    width: 4.w,
                  ),
                  Image.asset(
                    AppAssets.spGirlAvatar,
                    scale: 1.6,
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Text(
                    "Megan Men.",
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.kWhite,
                    ),
                  ),
                  SizedBox(
                    width: 27.w,
                  ),
                  Container(
                    height: 4.h,
                    width: 20.w,
                    decoration: const BoxDecoration(
                      color: AppColors.kWhite,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Contact",
                        style: TextStyle(fontSize: 14.sp),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
