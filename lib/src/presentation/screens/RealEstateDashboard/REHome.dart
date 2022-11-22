import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:twiddle_refactored/src/controller/Real%20State%20Controllers/mainScreenController.dart';
import 'package:twiddle_refactored/src/core/utils/app_assets.dart';

import '../../../core/utils/app_colors.dart';
import '../../components/RealEstateDashboard/drawer.dart';
import '../../components/RealEstateDashboard/myContainer.dart';
import '../../components/RealEstateDashboard/myDivider.dart';
import '../../components/RealEstateDashboard/myTextField.dart';
import '../../components/RealEstateDashboard/propertiesDropDown.dart';
import '../../components/RealEstateDashboard/rentProperty.dart';
import '../../components/RealEstateDashboard/salesProperty.dart';
import '../../components/RealEstateDashboard/shortStayProperty.dart';

class REHome extends StatelessWidget {
  final MainScreenController mainScreenController =
  Get.put(MainScreenController());

  REHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> homeKey = GlobalKey();
    final search = TextEditingController();
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: const MyDrawer(),

        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: AppColors.kWhite,
          title: MyContainer(
            color: AppColors.transparent,
            // verticalPadding: 10.h,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    homeKey.currentState!.openDrawer();
                  },
                  child: MyContainer(
                    height: 35.h,
                    width: 35.w,
                    radius: 50.sp,
                    // horizontalPadding: 10,
                    // verticalPadding: 5,
                    shadowColor: AppColors.mainBg,
                    color: AppColors.kWhite,
                    child: Icon(FontAwesomeIcons.barsStaggered,
                        size: 16.5.sp, color: AppColors.welcomeTwiddle),
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Expanded(
                  child: MyTextField(
                    size: 16.sp,
                    color: AppColors.kWhite.withOpacity(0.5),
                    controller: search,
                    icon: const Icon(Icons.search,color: AppColors.kLightGrey,),
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                GestureDetector(
                  onTap: () {
                    // Get.to(()=> FilterScreen());
                  },
                  child: MyContainer(
                    height: 35.h,
                    width: 35.w,
                    radius: 50.sp,
                    horizontalPadding: 0.7,
                    verticalPadding: 0.7,
                    color: AppColors.mainColor,
                    child: SvgPicture.asset(
                      AppAssets.filterIcon,
                      // fit: BoxFit.fill,
                      color: AppColors.kWhite,
                      // height: 10,
                      // width: 0.2,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        key: homeKey,
        // drawer: AppBar(),
        // MyDrawer(),
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [AppColors.kWhite, AppColors.kWhite])),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: MyContainer(
                  color: AppColors.mainColor.withOpacity(0.1),
                  radius: 5.sp,
                  verticalMargin: 0.5.h,
                  child: TabBar(
                    // indicatorPadding: EdgeInsets.all(2.w),
                    // labelPadding: EdgeInsets.only(right: 1.w),
                    // padding: EdgeInsets.only(right: 2.w),
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.sp),
                      color: AppColors.mainColor,
                    ),
                    labelColor: AppColors.kWhite,
                    unselectedLabelColor: AppColors.welcomeTwiddle,
                    tabs:  [
                      Tab(text: 'Rent',),
                      // Container(color:AppColors.kWhite,width: 0.01.w,),
                      Tab(text: 'Sales'),
                      // Container(color:AppColors.kWhite,width: 0.01.w,),
                      Tab(text: 'Short Stay'),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: MyContainer(
                  shadowColor: AppColors.mainColor.withOpacity(0.1),
                  radius: 5,
                  color: AppColors.kWhite,
                  child: Column(
                    children: [
                      MyContainer(
                        color: AppColors.kWhite,
                        horizontalPadding: 1.w,
                        verticalPadding: 0.1.h,
                        child: const Text(
                          'Select Real Estate Type',
                          style: TextStyle(
                            color: AppColors.mainColor,
                          ),
                        ),
                      ),
                      Divider(),
                      PropertiesDropdown(
                        horizontalPadding: 10,
                        height: 40,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 2.h,),
               Expanded(
                  child:
                  TabBarView(
                children: [
                  RentProperty(),
                  SalesProperty(),
                  ShortStayProperty(),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}

// class Appbar extends StatelessWidget {
//   VoidCallback? onDrawerTap;
//   Appbar({Key? key, this.onDrawerTap}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final search = TextEditingController();
//     return MyContainer(
//       color: transparent,
//       verticalPadding: 10.h,
//       child: Row(
//         children: [
//
//           GestureDetector(
//             onTap: onDrawerTap,
//             child: MyContainer(
//               height: 40, width: 40, radius: 40,
//               horizontalPadding: 5, verticalPadding: 5,
//               shadowColor: shadowcolor, color: white,
//               child: Icon(FontAwesomeIcons.barsStaggered),
//             ),
//           ),
//
//           Width(size: 10),
//           Expanded(
//             child: MyTextField(
//               color: lightButton, radius: 40,
//               controller: search, height: 50,
//               icon: Icon(Icons.search),
//             ),
//           ),
//
//           Width(size: 10),
//
//           MyContainer(
//             height: 40, width: 40, radius: 40,
//             horizontalPadding: 8, verticalPadding: 8,
//             color: maincolor,
//             child: SvgPicture.asset('assets/home/filter.svg', color: white),
//           ),
//
//         ],
//       ),
//     );
//   }
// }
