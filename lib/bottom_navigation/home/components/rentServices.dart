import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../constants/appColors.dart';
import '../controller/mainScreenController.dart';
import 'noWidgetData.dart';

class RentProperty extends StatelessWidget {
  RentProperty({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final MainScreenController mainScreenController =
    Get.put(MainScreenController());
    return Obx(() {
      return Padding(
        padding: EdgeInsets.only(left: 7.w, right: 6.w),
        child: mainScreenController.isLoading.value == true
            ? const Center(
          child: CircularProgressIndicator(
            color: AppColors.mainColor,
          ),
        )
            : mainScreenController.rentPropertyList.value.data == null
            ? const NoDataWidget()
            : ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.only(bottom: 2.h),
          itemCount: mainScreenController
              .rentPropertyList.value.data?.length ??
              0,
          itemBuilder: (context, index) {
            return Obx(() => Column(
              children: [
                Container(
                  // height: 35.h,
                  // width: 85.w,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 0.5,
                        blurRadius: 4,
                        offset: const Offset(
                            0, 10), // changes position of shadow
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
                      Image.network(
                        mainScreenController.rentPropertyList
                            .value.data![index].coverimage
                            .toString(),
                        height: 20.h,
                        width: 100.w,
                        fit: BoxFit.fitHeight,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 4.w, right: 4.w, top: 1.h),
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${mainScreenController.rentPropertyList.value.data?[index].specification?.bedroom} BEDROOM TOWNHOUSE FOR SALE AT OYARIFA",
                              style: TextStyle(fontSize: 18.sp),
                            ),
                            RichText(
                              text: TextSpan(
                                  text:
                                  "GHC ${mainScreenController.rentPropertyList.value.data?[index].price} /",
                                  style: TextStyle(
                                      fontSize: 20.sp,
                                      fontFamily: "PoppinsBold",
                                      color: AppColors
                                          .welcomeTwiddle),
                                  children: [
                                    TextSpan(
                                      text: "month",
                                      style: TextStyle(
                                          color: AppColors
                                              .kLightGrey,
                                          fontSize: 16.sp,
                                          fontFamily:
                                          "PoppinsMedium"),
                                    ),
                                  ]),
                            ),
                            Text(
                              "${mainScreenController.rentPropertyList.value.data?[index].fullAddress}",
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
            ));
          },
        ),
      );
    });
  }
}