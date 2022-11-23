import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';

class HiredServiceProviders extends StatelessWidget {
  const HiredServiceProviders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hired',
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
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                      alignment: Alignment.topRight,
                      child: ConstrainedBox(
                        constraints: BoxConstraints.expand(height: 3.h,width: 10.w),
                        child: PopupMenuButton(
                          itemBuilder: (BuildContext context) {
                            return [
                              const PopupMenuItem(
                                child: Text("Report"),
                              ),
                              const PopupMenuItem(
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
                            AppAssets.orangeCheckIcon,
                            height: 2.h,
                            width: 2.w,
                          ),
                          SizedBox(
                            width: 3.w,
                          ),
                          Text(
                            "Hired",
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
                  SizedBox(height: 1.5.h,),
                  Padding(
                    padding: EdgeInsets.only(left: 4.2.w),
                    child: RichText(
                      text: TextSpan(
                        text: "Scheduled",
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: AppColors.kLightGrey,
                        ),
                        children: [
                          TextSpan(
                            text: " in progress",
                            style: TextStyle(
                              fontSize: 15.sp,
                              color: AppColors.mainColor,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5.w),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Date",
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: AppColors.welcomeTwiddle,
                              ),
                            ),
                            SizedBox(
                              height: 0.5.h,
                            ),
                            Text(
                              "08-07-2020",
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  color: AppColors.welcomeTwiddle,
                                  fontFamily: "PoppinsBold"),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Text(
                              "Start Time",
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: AppColors.welcomeTwiddle,
                              ),
                            ),
                            SizedBox(
                              height: 0.5.h,
                            ),
                            Text(
                              "08:30 AM",
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  color: AppColors.welcomeTwiddle,
                                  fontFamily: "PoppinsBold"),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Total Hours",
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: AppColors.welcomeTwiddle,
                              ),
                            ),
                            SizedBox(
                              height: 0.5.h,
                            ),
                            Text(
                              "02 Hours",
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  color: AppColors.welcomeTwiddle,
                                  fontFamily: "PoppinsBold"),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Text(
                              "End Time",
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: AppColors.welcomeTwiddle,
                              ),
                            ),
                            SizedBox(
                              height: 0.5.h,
                            ),
                            Text(
                              "10:30 AM",
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  color: AppColors.welcomeTwiddle,
                                  fontFamily: "PoppinsBold"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 4.5.w),
                    height: 5.h,
                    width: 38.w,
                    decoration: const BoxDecoration(
                      color: AppColors.kGreenAccent,
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          20,
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 1.w,),
                        SvgPicture.asset(AppAssets.greenCheckIcon,
                            color: AppColors.kWhite, height: 3.h),
                         SizedBox(width: 1.w,),
                         Text(
                          "Mark as Completed",
                          style: TextStyle(
                            color: AppColors.kWhite,
                            fontSize: 14.sp
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
