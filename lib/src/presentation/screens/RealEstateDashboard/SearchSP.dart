import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:twiddle_refactored/src/core/utils/app_colors.dart';

import '../../components/RealEstateDashboard/drawer.dart';
import '../../components/RealEstateDashboard/myContainer.dart';
import '../../components/RealEstateDashboard/myDivider.dart';
import '../../components/RealEstateDashboard/myTextField.dart';

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
            verticalPadding: 5.h,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    spKey.currentState!.openDrawer();
                  },
                  child: MyContainer(
                    height: 40,
                    width: 40,
                    radius: 40,
                    horizontalPadding: 5,
                    verticalPadding: 5,
                    shadowColor: AppColors.mainColor.withOpacity(0.15),
                    color: AppColors.kWhite,
                    child: Icon(FontAwesomeIcons.barsStaggered,
                        size: 20.sp, color: AppColors.welcomeTwiddle),
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Expanded(
                  child: MyTextField(
                    color: AppColors.kWhite.withOpacity(0.5),
                    radius: 40,
                    controller: search,
                    height: 50,
                    icon: const Icon(Icons.search),
                    hint: 'Search cleaners etc..',
                  ),
                ),
                SizedBox(width: 5.w),
                MyContainer(
                    height: 40,
                    width: 40,
                    child: Icon(Icons.more_vert,
                        color: AppColors.welcomeTwiddle, size: 40.sp)),
              ],
            ),
          ),
        ),
        drawer: MyDrawer(),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyContainer(
                  color: AppColors.mainColor.withOpacity(0.1),
                  radius: 5,
                  verticalMargin: 10,
                  child: TabBar(
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColors.mainColor,
                    ),
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black,
                    tabs: [
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
                    children: [
                      MyContainer(
                        horizontalPadding: 10.w,
                        verticalPadding: 10.h,
                        color: AppColors.kWhite,
                        child: const Text(
                          'Category',
                          style: TextStyle(
                            color: AppColors.mainColor,
                          ),
                        ),
                      ),
                      MyDivider(color: AppColors.kWhite),
                      SPDropdown(
                        horizontalPadding: 10,
                        height: 40,
                      ),
                    ],
                  ),
                ),
                Height(size: 20),
                PoppinsText(
                    text: 'Service Providers',
                    size: 20,
                    fontWeight: FontWeight.bold),
                Height(size: 20),
                Expanded(
                    child: TabBarView(
                  children: [
                    AllServiceProviders(
                      profession: profession,
                    ),
                    HiredServiceProviders(),
                    VerifiedServiceProviders(),
                  ],
                )),
              ],
            ),
          ),
        ),
      ),
    );
    ;
  }
}
