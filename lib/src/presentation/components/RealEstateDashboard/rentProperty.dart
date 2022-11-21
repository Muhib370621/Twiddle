import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:twiddle_refactored/src/core/utils/app_assets.dart';
import 'package:twiddle_refactored/src/core/utils/app_colors.dart';

import '../../../controller/Real State Controllers/mainScreenController.dart';

class RentProperty extends StatelessWidget {
  final MainScreenController mainScreenController =
  Get.put(MainScreenController());

  RentProperty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhite,
      body: Padding(
          padding: EdgeInsets.only(left: 7.w, right: 6.w),
          child:
          ListView.builder(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.only(bottom: 2.h),
            itemCount: 5,
            itemBuilder: (context, index) {
              return Obx(() => GestureDetector(
                onTap: () {
                  print( mainScreenController.propertList.value.user?.email);
                },
                child: Column(
                  children: [
                    Container(
                      height: 35.h,
                      width: 85.w,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 0.5,
                            blurRadius: 4,
                            offset:
                            const Offset(0, 10), // changes position of shadow
                          ),
                        ],
                        color: AppColors.kWhite,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Stack(fit: StackFit.passthrough, children: [
                              Image.asset(
                                AppAssets.cardBG,
                                fit: BoxFit.fitWidth,
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      top: 1.h, right: 2.w),
                                  child: SvgPicture.asset(AppAssets.saveIcon),
                                ),
                              ),
                            ]),
                          ),
                          // Container(
                          //   height: 2.h,
                          //   width: 15.w,
                          //   decoration: const BoxDecoration(
                          //     color: AppColors.kOrange,
                          //     borderRadius: BorderRadius.all(
                          //       Radius.circular(8),
                          //     ),
                          //   ),
                          //   child:  Center(child: Text("Rent",style: TextStyle(fontSize: 15.sp,color: AppColors.kWhite),)),
                          // ),
                          Padding(
                            padding:
                            EdgeInsets.only(left: 4.w, right: 4.w, top: 1.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Text(
                                  "${mainScreenController.propertList.value
                                      .specification
                                      ?.bedroom} BEDROOM TOWNHOUSE FOR SALE AT OYARIFA",
                                  style: TextStyle(fontSize: 18.sp),
                                ),
                                RichText(
                                  text: TextSpan(
                                      text: "GHC ${mainScreenController
                                          .propertList.value.price} /",
                                      style: TextStyle(
                                          fontSize: 20.sp,
                                          fontFamily: "PoppinsBold",
                                          color: AppColors.welcomeTwiddle),
                                      children: [
                                        TextSpan(
                                          text: "month",
                                          style: TextStyle(
                                              color: AppColors.kLightGrey,
                                              fontSize: 16.sp,
                                              fontFamily: "PoppinsMedium"),
                                        ),
                                      ]),
                                ),
                                Text(
                                  "${mainScreenController.propertList.value
                                      .fullAddress}",
                                  style: TextStyle(
                                      color: AppColors.kLightGrey,
                                      fontSize: 16.sp,
                                      fontFamily: "PoppinsMedium"),
                                ),
                                SizedBox(
                                  height: 1.h,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    )
                  ],
                ),
              ));

            },
          )),
    );
  }
}
