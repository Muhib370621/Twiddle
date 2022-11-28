import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:twiddle_refactored/src/core/utils/app_assets.dart';
import 'package:twiddle_refactored/src/core/utils/app_colors.dart';

import '../../../components/RealEstateDashboard/dashboardHeader.dart';
import '../../../components/RealEstateDashboard/drawer.dart';
import '../../../components/RealEstateDashboard/myContainer.dart';
import '../../../components/RealEstateDashboard/rentProperty.dart';


class REMainDashboard extends StatelessWidget {
  const REMainDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> dashboardKey = GlobalKey();
    return Scaffold(
      key: dashboardKey,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(5.h),
          child: AppBar(
            elevation: 0,
            automaticallyImplyLeading: false,
            backgroundColor: AppColors.mainColor,
            title: MyContainer(
              color: AppColors.transparent,
              // verticalPadding: 5.h,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      dashboardKey.currentState!.openDrawer();
                    },
                    child: Container(
                      height: 5.h,
                      width: 12.w,
                      decoration: const BoxDecoration(

                          color: AppColors.kWhite,
                          shape: BoxShape.circle

                      ),
                      // shape: BoxShape.circle,
                      // radius: 100,
                      // horizontalPadding: 10,
                      // verticalPadding: 5,
                      // shadowColor: AppColors.mainBg,

                      child: Icon(FontAwesomeIcons.barsStaggered,
                          size: 16.5.sp, color: AppColors.welcomeTwiddle),
                    ),
                  ),
                  Expanded(child: Container()),
                  GestureDetector(
                    onTap: () {
                      // Get.to(() => Setting());
                    },
                    child: Container(
                      padding: EdgeInsets.all(6),
                      height: 5.h,
                      width: 10.w,
                      decoration: const BoxDecoration(
                          color: AppColors.kWhite,
                          shape: BoxShape.circle

                      ),
                      // shape: BoxShape.circle,
                      // radius: 100,
                      // horizontalPadding: 10,
                      // verticalPadding: 5,
                      // shadowColor: AppColors.mainBg,

                      child: SvgPicture.asset(
                        AppAssets.drawerSetting,
                        color: AppColors.mainColor,
                      ),
                    ),

                  ),
                  SizedBox(width: 4.w),
                  GestureDetector(
                    //   onTap: () => Get.to(()=> NotificationScreen()),
                    onTap: () {
                      // Get.to(() => Notifications());
                    },
                    child: Container(
                      padding: EdgeInsets.all(6),
                      height: 5.h,
                      width: 10.w,
                      decoration: const BoxDecoration(
                          color: AppColors.kWhite,
                          shape: BoxShape.circle
                      ),
                      // shape: BoxShape.circle,
                      // radius: 100,
                      // horizontalPadding: 10,
                      // verticalPadding: 5,
                      // shadowColor: AppColors.mainBg,

                      child: SvgPicture.asset(
                        AppAssets.drawerNotification,
                        color: AppColors.mainColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  GestureDetector(
                    onTap: () {
                      // Get.to(() => ChatScreen());
                    },
                    child:  Container(
                      padding: EdgeInsets.all(10),
                      height: 5.h,
                      width: 10.w,
                      decoration: const BoxDecoration(
                          color: AppColors.kWhite,
                          shape: BoxShape.circle

                      ),
                      // shape: BoxShape.circle,
                      // radius: 100,
                      // horizontalPadding: 10,
                      // verticalPadding: 5,
                      // shadowColor: AppColors.mainBg,

                      child: SvgPicture.asset(
                        AppAssets.chatIcon,
                        color: AppColors.mainColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),

      drawer: const MyDrawer(),
      // Tab Controller for property cards
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DashboardHeader(),
          SizedBox(
            height: 2.h,
          ),
          const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: Text(
                'My Listed Properties (6)',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              )),
          SizedBox(
            height: 4.h,
          ),

          // Card here this will remove letter this calling through firebase
          Expanded(
              child:
              RentProperty(),

          ),

          //
          // Expanded(
          //   child: ProfileProperty(
          //     currentUserId: authUser['uid']//FirebaseAuth.instance.currentUser?.uid,
          //   ),
          // ),
        ],
      ),
    );
  }
}
