import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../controller/Real State Controllers/mainScreenController.dart';
import '../../../core/error/noDataWidget.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';

class ShortStayProperty extends StatelessWidget {
  final MainScreenController mainScreenController =
  Get.put(MainScreenController());
   ShortStayProperty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      backgroundColor: AppColors.kWhite,
      body: Padding(
          padding: EdgeInsets.only(left: 7.w, right: 6.w),
          child: mainScreenController.isLoading.value == true
              ? const Center(
            child: CircularProgressIndicator(
              color: AppColors.mainColor,
            ),
          )
              : mainScreenController.shortStayPropertyList.value.data == []
              ? const NoDataWidget()
              : ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.only(bottom: 2.h),
            itemCount: mainScreenController
                .shortStayPropertyList.value.data?.length ??
                0,
            itemBuilder: (context, index) {
              return Obx(() => Column(
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
                          offset: const Offset(0,
                              10), // changes position of shadow
                        ),
                      ],
                      color: AppColors.kWhite,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Stack(
                              fit: StackFit.passthrough,
                              children: [
                                Image.network(
                                  mainScreenController
                                      .shortStayPropertyList
                                      .value
                                      .data![index]
                                      .coverimage
                                      .toString(),
                                  fit: BoxFit.fill,
                                ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: 1.h, right: 2.w),
                                    child: SvgPicture.asset(
                                        AppAssets.saveIcon),
                                  ),
                                ),
                              ]),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 4.w, right: 4.w, top: 1.h),
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${mainScreenController.shortStayPropertyList.value.data?[index].specification?.bedroom} BEDROOM TOWNHOUSE FOR SALE AT OYARIFA",
                                style: TextStyle(fontSize: 18.sp),
                              ),
                              RichText(
                                text: TextSpan(
                                    text:
                                    "GHC ${mainScreenController.shortStayPropertyList.value.data?[index].price} /",
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
                                "${mainScreenController.shortStayPropertyList.value.data?[index].fullAddress}",
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
          )),
    ));
  }
}
