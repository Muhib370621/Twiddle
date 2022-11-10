import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:state_agent/bottom_navigation/home/home_body.dart';

import '../../constants/constants.dart';
import '../../constants/dropdowns.dart';
import '../drawer.dart';
import 'filters.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> homeKey = GlobalKey();
    final search = TextEditingController();
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            backgroundColor: shadowcolor,
            title: MyContainer(
              color: transparent,
              verticalPadding: 10.h,
              child: Row(
                children: [

                  GestureDetector(
                    onTap: (){
                      homeKey.currentState!.openDrawer();
                    },
                    child: MyContainer(
                      height: 40, width: 40, radius: 40,
                      horizontalPadding: 5, verticalPadding: 5,
                      shadowColor: shadowcolor, color: white,
                      child: Icon(FontAwesomeIcons.barsStaggered, size: 20.sp, color: black),
                    ),
                  ),

                  Width(size: 10),
                  Expanded(
                    child: MyTextField(
                      color: lightButton.withOpacity(0.5),
                      radius: 40, height: 50,
                      controller: search,
                      icon: Icon(Icons.search),
                    ),
                  ),

                  Width(size: 10),

                  GestureDetector(
                    onTap: (){
                      Get.to(()=> FilterScreen());
                    },
                    child: MyContainer(
                      height: 40, width: 40, radius: 40,
                      horizontalPadding: 8, verticalPadding: 8,
                      color: maincolor,
                      child: SvgPicture.asset('assets/home/filter.svg', color: white),
                    ),
                  ),

                ],
              ),
            ),
          ),
          key: homeKey,
          drawer: MyDrawer(),
          body: SafeArea(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      shadowcolor, white
                ])
              ),
              child: Column(
                children: [

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: MyContainer(
                      color: maincolor.withOpacity(0.1),
                      radius: 5.r,
                      verticalMargin: 10,
                      child: TabBar(
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.r),
                          color: maincolor,
                        ),
                        labelColor: Colors.white,
                        unselectedLabelColor: Colors.black,

                        tabs: [

                          Tab(text: 'Rent'),
                          Tab(text: 'Sales'),
                          Tab(text: 'Short Stay'),

                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: MyContainer(
                      shadowColor: maincolor.withOpacity(0.1),
                      radius: 5, color: white,
                      child: Column(
                        children: [
                          MyContainer(
                            color: white,
                            horizontalPadding: 10,
                            verticalPadding: 10,
                            child: PoppinsText(text: 'Select Real Estate Type', color: maincolor),
                          ),
                          MyDivider(color: lightButton),
                          PropertiesDropdown(
                            horizontalPadding: 10,
                            height: 40,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Height(size: 20),

                  Expanded(
                      child: TabBarView(
                        children: [
                          RentProperty(),
                          SalesProperty(),
                          ShortStayProperty(),
                        ],
                      )
                  ),

                ],
              ),
            ),
          ),

        ),
      ),
    );
  }
}

class Appbar extends StatelessWidget {
  VoidCallback? onDrawerTap;
  Appbar({Key? key, this.onDrawerTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final search = TextEditingController();
    return MyContainer(
      color: transparent,
      verticalPadding: 10.h,
      child: Row(
        children: [

          GestureDetector(
            onTap: onDrawerTap,
            child: MyContainer(
              height: 40, width: 40, radius: 40,
              horizontalPadding: 5, verticalPadding: 5,
              shadowColor: shadowcolor, color: white,
              child: Icon(FontAwesomeIcons.barsStaggered),
            ),
          ),

          Width(size: 10),
          Expanded(
            child: MyTextField(
              color: lightButton, radius: 40,
              controller: search, height: 50,
              icon: Icon(Icons.search),
            ),
          ),

          Width(size: 10),

          MyContainer(
            height: 40, width: 40, radius: 40,
            horizontalPadding: 8, verticalPadding: 8,
            color: maincolor,
            child: SvgPicture.asset('assets/home/filter.svg', color: white),
          ),

        ],
      ),
    );
  }
}
