import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';

class VerifiedServiceProviders extends StatelessWidget {
  const VerifiedServiceProviders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Verified',
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Container(
            // height: 20.h,
            // width: 100.w,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              color: AppColors.kWhite,
              boxShadow: [
                BoxShadow(
                  color: AppColors.mainBg.withOpacity(0.3),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 0.5), // changes position of shadow
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.topRight,
                      child: ConstrainedBox(
                        constraints: BoxConstraints.expand(height: 3.h,width: 10.w),
                        child: PopupMenuButton(
                          itemBuilder: (BuildContext context) {
                            return [
                              PopupMenuItem(
                                child: Text("Report"),
                              ),
                              PopupMenuItem(
                                child: Text("Block"),
                              ),
                            ];
                          },
                        ),
                      )),
                  Row(
                    children: [
                      Stack(
                        children: [
                          Image.asset(AppAssets.spGirlAvatar),
                          Positioned(
                            left: 11.w,
                            child: SvgPicture.asset(
                              AppAssets.verifiedIcon,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 3.w,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Martha Hill",
                            style: TextStyle(
                                fontSize: 18.sp,
                                fontFamily: "PoppinsMedium",
                                color: AppColors.welcomeTwiddle),
                          ),
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Cleaner",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontFamily: "PoppinsMedium",
                                  color: AppColors.kLightOrange,
                                ),
                              ),
                              SizedBox(
                                width: 28.w,
                              ),
                              Text(
                                "Ghc 62/hr",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: AppColors.mainColor,
                                ),
                              ),
                            ],
                          ),
                          // SizedBox(height: 0.1.h,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 18.sp,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 18.sp,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 18.sp,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 18.sp,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 18.sp,
                              ),
                              SizedBox(
                                width: 3.w,
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 0.3.h),
                                child: Text(
                                  "13 reviews",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: AppColors.kLightGrey,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(AppAssets.locationIcon),
                          SizedBox(
                            width: 3.w,
                          ),
                          Text(
                            "Location",
                            style: TextStyle(
                              fontSize: 16.sp,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            AppAssets.greenCheckIcon,
                            height: 2.h,
                            width: 2.w,
                          ),
                          SizedBox(
                            width: 3.w,
                          ),
                          Text(
                            "Available",
                            style: TextStyle(
                              fontSize: 16.sp,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      SvgPicture.asset(
                        AppAssets.saveIcon,
                        // height: 2.h,
                        // width: 2.w,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 1.h,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
    ;
  }
}
