import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:state_agent/constants/constants.dart';

import '../../constants/appAssets.dart';
import '../../constants/appColors.dart';
import '../../property/property_ads/user_property_ad.dart';
import '../../property/property_details.dart';
import 'components/noWidgetData.dart';
import 'controller/mainScreenController.dart';

class RentProperty extends StatelessWidget {
  RentProperty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MainScreenController mainScreenController =
        Get.put(MainScreenController());
    return Obx(() {
      return Padding(
        padding: EdgeInsets.only(left: 12.w, right: 12.w),
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
                              GestureDetector(
                                onTap: () {
                                  Get.to(()=>
                                      PropertyDetails(
                                        title: mainScreenController.rentPropertyList.value.data?[index].title.toString(),
                                        bedroom: mainScreenController.rentPropertyList.value.data?[index].specification?.bedroom.toString(),
                                        location: "Location(dummy)",
                                        type: mainScreenController.rentPropertyList.value.data![index].catagery.toString(),
                                        price: int.parse(mainScreenController.rentPropertyList.value.data![index].price.toString()),
                                        ac: mainScreenController.rentPropertyList.value.data![index].specification?.aircondition.toString(),
                                        desc: mainScreenController.rentPropertyList.value.data![index].description.toString(),
                                        kitchen: mainScreenController.rentPropertyList.value.data![index].specification?.kitchen.toString(),
                                        parking: mainScreenController.rentPropertyList.value.data![index].specification?.carparking.toString(),
                                        quarters: mainScreenController.rentPropertyList.value.data![index].specification?.quarterAvailble.toString(),
                                        tap: mainScreenController.rentPropertyList.value.data![index].specification?.tapAvailable.toString(),
                                        washroom: mainScreenController.rentPropertyList.value.data![index].catagery.toString(),
                                        uid: mainScreenController.rentPropertyList.value.data![index].user?.id.toString(),
                                        visitCharges: int.parse(mainScreenController.rentPropertyList.value.data![index].price.toString()),
                                        avatar: mainScreenController.rentPropertyList.value.data![index].user?.avatar.toString(),

                                      ));
                                },
                                child: Container(
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
                                      SizedBox(
                                        height: 13.h,
                                      ),
                                      Stack(
                                          fit: StackFit.passthrough,
                                          children: [
                                            SizedBox(
                                              height: 23.h,
                                            ),
                                            Image.network(
                                              mainScreenController
                                                  .rentPropertyList
                                                  .value
                                                  .data![index]
                                                  .coverimage
                                                  .toString(),
                                              height: 200.h,
                                              width: 370.w,
                                              fit: BoxFit.fill,
                                            ),
                                            Align(
                                              alignment: Alignment.topRight,
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    top: 8.h, right: 10.w),
                                                child: SvgPicture.asset(
                                                  AppAssets
                                                      .favUnselectedIcon,
                                                ),
                                              ),
                                            ),
                                          ]),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 14.w, right: 14.w, top: 11.h),
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
                                              height: 10.h,
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 23.h,
                              ),
                            ],
                          ));
                    },
                  ),
      );
    });
  }
}

class SalesProperty extends StatelessWidget {
  SalesProperty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MainScreenController mainScreenController =
        Get.put(MainScreenController());
    return Obx(() => Scaffold(
          backgroundColor: AppColors.kWhite,
          body: Padding(
              padding: EdgeInsets.only(left: 12.w, right: 12.w),
              child: mainScreenController.isLoading.value == true
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.mainColor,
                      ),
                    )
                  : mainScreenController.salesPropertyList.value.data == []
                      ? const NoDataWidget()
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          padding: EdgeInsets.only(bottom: 2.h),
                          itemCount: mainScreenController
                                  .salesPropertyList.value.data?.length ??
                              0,
                          itemBuilder: (context, index) {
                            return Obx(() => GestureDetector(
                              onTap: () {
                                Get.to(()=>
                                    PropertyDetails(
                                      title: mainScreenController.salesPropertyList.value.data?[index].title.toString(),
                                      bedroom: mainScreenController.salesPropertyList.value.data?[index].specification?.bedroom.toString(),
                                      location: "Location(dummy)",
                                      type: mainScreenController.salesPropertyList.value.data![index].catagery.toString(),
                                      price: int.parse(mainScreenController.salesPropertyList.value.data![index].price.toString()),
                                      ac: mainScreenController.salesPropertyList.value.data![index].specification?.aircondition.toString(),
                                      desc: mainScreenController.salesPropertyList.value.data![index].description.toString(),
                                      kitchen: mainScreenController.salesPropertyList.value.data![index].specification?.kitchen.toString(),
                                      parking: mainScreenController.salesPropertyList.value.data![index].specification?.carparking.toString(),
                                      quarters: mainScreenController.salesPropertyList.value.data![index].specification?.quarterAvailble.toString(),
                                      tap: mainScreenController.salesPropertyList.value.data![index].specification?.tapAvailable.toString(),
                                      washroom: mainScreenController.salesPropertyList.value.data![index].catagery.toString(),
                                      uid: mainScreenController.salesPropertyList.value.data![index].user?.id.toString(),
                                      visitCharges: int.parse(mainScreenController.salesPropertyList.value.data![index].price.toString()),
                                      avatar: mainScreenController.salesPropertyList.value.data![index].user?.avatar.toString(),

                                    ));
                              },
                              child: Column(
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
                                            Stack(
                                                fit: StackFit.passthrough,
                                                children: [
                                                  SizedBox(
                                                    height: 23.h,
                                                  ),
                                                  Image.network(
                                                    mainScreenController
                                                        .salesPropertyList
                                                        .value
                                                        .data![index]
                                                        .coverimage
                                                        .toString(),
                                                    height: 200.h,
                                                    width: 370.w,
                                                    fit: BoxFit.fill,
                                                  ),
                                                  Align(
                                                    alignment: Alignment.topRight,
                                                    child: Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 8.h, right: 10.w),
                                                      child: SvgPicture.asset(
                                                        AppAssets
                                                            .favUnselectedIcon,
                                                      ),
                                                    ),
                                                  ),
                                                ]),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 4.w,
                                                  right: 4.w,
                                                  top: 1.h),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "${mainScreenController.salesPropertyList.value.data?[index].specification?.bedroom} BEDROOM TOWNHOUSE FOR SALE AT OYARIFA",
                                                    style: TextStyle(
                                                        fontSize: 18.sp),
                                                  ),
                                                  RichText(
                                                    text: TextSpan(
                                                        text:
                                                            "GHC ${mainScreenController.salesPropertyList.value.data?[index].price} /",
                                                        style: TextStyle(
                                                            fontSize: 20.sp,
                                                            fontFamily:
                                                                "PoppinsBold",
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
                                                    "${mainScreenController.salesPropertyList.value.data?[index].fullAddress}",
                                                    style: TextStyle(
                                                        color:
                                                            AppColors.kLightGrey,
                                                        fontSize: 16.sp,
                                                        fontFamily:
                                                            "PoppinsMedium"),
                                                  ),
                                                  SizedBox(
                                                    height: 10.h,
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 23.h,
                                      ),
                                    ],
                                  ),
                            ));
                          },
                        )),
        ));
  }
}

class ShortStayProperty extends StatelessWidget {

  ShortStayProperty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MainScreenController mainScreenController =
    Get.put(MainScreenController());
    return Obx(() => Scaffold(
      backgroundColor: AppColors.kWhite,
      body: Padding(
          padding: EdgeInsets.only(left: 12.w, right: 12.w),
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
              return Obx(() => GestureDetector(
                onTap: () {
                  Get.to(()=>
                      PropertyDetails(
                    title: mainScreenController.shortStayPropertyList.value.data?[index].title.toString(),
                    bedroom: mainScreenController.shortStayPropertyList.value.data?[index].specification?.bedroom.toString(),
                    location: "Location(dummy)",
                    type: mainScreenController.shortStayPropertyList.value.data![index].catagery.toString(),
                    price: int.parse(mainScreenController.shortStayPropertyList.value.data![index].price.toString()),
                    ac: mainScreenController.shortStayPropertyList.value.data![index].specification?.aircondition.toString(),
                    desc: mainScreenController.shortStayPropertyList.value.data![index].description.toString(),
                    kitchen: mainScreenController.shortStayPropertyList.value.data![index].specification?.kitchen.toString(),
                    parking: mainScreenController.shortStayPropertyList.value.data![index].specification?.carparking.toString(),
                    quarters: mainScreenController.shortStayPropertyList.value.data![index].specification?.quarterAvailble.toString(),
                    tap: mainScreenController.shortStayPropertyList.value.data![index].specification?.tapAvailable.toString(),
                    washroom: mainScreenController.shortStayPropertyList.value.data![index].catagery.toString(),
                    uid: mainScreenController.shortStayPropertyList.value.data![index].user?.id.toString(),
                    visitCharges: int.parse(mainScreenController.shortStayPropertyList.value.data![index].price.toString()),
                        avatar: mainScreenController.shortStayPropertyList.value.data![index].user?.avatar.toString(),

                  ));
                },
                child: Column(
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
                          Stack(
                              fit: StackFit.passthrough,
                              children: [
                                Image.network(
                                  mainScreenController
                                      .shortStayPropertyList
                                      .value
                                      .data![index]
                                      .coverimage
                                      .toString(),
                                  height: 200.h,
                                  width: 370.w,
                                  fit: BoxFit.fill,
                                ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: 8.h, right: 10.w),
                                    child: SvgPicture.asset(
                                        AppAssets.favUnselectedIcon),
                                  ),
                                ),
                              ]),
                          Column(
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
                                height: 23.h,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 23.h,
                    )
                  ],
                ),
              ));
            },
          )),
    ));
  }
}
