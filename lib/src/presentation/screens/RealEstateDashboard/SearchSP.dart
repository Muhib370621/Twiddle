import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:twiddle_refactored/src/core/utils/app_colors.dart';

import '../../components/RealEstateDashboard/drawer.dart';
import '../../components/RealEstateDashboard/myContainer.dart';
import '../../components/RealEstateDashboard/myDivider.dart';
import '../../components/RealEstateDashboard/myTextField.dart';
import '../../components/RealEstateDashboard/spDropDown.dart';
import '../../components/searchSP/allServiceProviders.dart';
import '../../components/searchSP/hiredServiceProvider.dart';
import '../../components/searchSP/verifiedServiceProvider.dart';

class SearchSP extends StatelessWidget {
  String? profession;
  final search = TextEditingController();

  SearchSP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> spKey = GlobalKey();
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        key: spKey,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: AppColors.transparent,
          title: MyContainer(
            color: AppColors.transparent,
            // verticalPadding: 5.h,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    spKey.currentState!.openDrawer();
                  },
                  child: MyContainer(
                    height: 35.h,
                    width: 35.w,
                    radius: 50.sp,
                    horizontalPadding: 0.7,
                    verticalPadding: 0.7,
                    shadowColor: AppColors.mainColor.withOpacity(0.15),
                    color: AppColors.kWhite,
                    child: Icon(FontAwesomeIcons.barsStaggered,
                        size: 16.sp, color: AppColors.welcomeTwiddle),
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Expanded(
                  child: MyTextField(
                    size: 16.sp,
                    color: AppColors.kWhite.withOpacity(0.5),
                    radius: 50.sp,
                    controller: search,
                    // height: 35.h,
                    icon: const Icon(
                      Icons.search,
                    ),
                    hint: 'Search cleaners etc..',
                  ),
                ),
                SizedBox(width: 5.w),
                GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) => Padding(
                          padding: EdgeInsets.only(top: 4.h),
                          child: Dialog(
                            alignment: Alignment.topRight,
                            child: MyContainer(
                              horizontalPadding: 5,
                              verticalPadding: 2,
                              width: 150,
                              child: ListView(
                                shrinkWrap: true,
                                children: [
                                  const Text(
                                    'More Menu',
                                    style: TextStyle(
                                        color: AppColors.mainColor, fontSize: 14),
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      // Get.to(()=> PayInstallment());
                                    },
                                    child: const Text(
                                      'View Your Investment Dashboard',
                                      style: TextStyle(
                                        color: AppColors.kLightGrey,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      // Get.to(() => RentDashboard());
                                    },
                                    child: const Text(
                                      'View Your Rent Dashboard',
                                      style: TextStyle(
                                        color: AppColors.kLightGrey,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        // Get.to(() => TopUpWallet());
                                      },
                                      child: const Text('Top-Up Your Twiddle Balance',
                                          style: TextStyle(color: AppColors.kLightGrey))),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  GestureDetector(
                                    onTap: () {

                                    },
                                    child: const Text(
                                      'See Your Twiddle Wallet Id',
                                      style: TextStyle(color: AppColors.kLightGrey),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ));
                  },
                  child: MyContainer(
                    height: 35.h,
                    width: 35.w,
                    child: Icon(
                      Icons.more_vert,
                      color: AppColors.welcomeTwiddle,
                      size: 24.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        drawer: const MyDrawer(),
        body: Builder(
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyContainer(
                    color: AppColors.mainColor.withOpacity(0.1),
                    radius: 5,
                    verticalMargin: 0.5.h,
                    child: TabBar(
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColors.mainColor,
                      ),
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.black,
                      tabs: const [
                        Tab(text: 'All'),
                        Tab(text: 'Hired'),
                        Tab(text: 'Verified'),
                      ],
                    ),
                  ),
                  MyContainer(
                    shadowColor: AppColors.mainColor.withOpacity(0.1),
                    radius: 5,
                    color: AppColors.kWhite,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        MyContainer(
                          horizontalPadding: 0.9.w,
                          verticalPadding: 0.09.h,
                          color: AppColors.kWhite,
                          child: const Text(
                            'Category',
                            style: TextStyle(
                              color: AppColors.mainColor,
                            ),
                          ),
                        ),
                        MyDivider(color: AppColors.kLightGrey),
                        SPDropdown(
                          horizontalPadding: 1.w,
                          height: 4.h,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Expanded(
                      child: TabBarView(
                          children: [
                          AllServiceProviders(
                              // profession: profession,
                              ),
                          const HiredServiceProviders(),
                          const VerifiedServiceProviders(),
                    ],
                  ),),
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}
