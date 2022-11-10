import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:state_agent/bottom_navigation/drawer.dart';

import '../../constants/constants.dart';
import '../../constants/dropdowns.dart';
import 'sp_list.dart';

class ServiceProviders extends StatefulWidget {
  ServiceProviders({Key? key}) : super(key: key);

  @override
  State<ServiceProviders> createState() => _ServiceProvidersState();
}

String? profession;
final search = TextEditingController();


class _ServiceProvidersState extends State<ServiceProviders> {

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
          backgroundColor: transparent,
          title: MyContainer(
            color: transparent,
            verticalPadding: 10.h,
            child: Row(
              children: [

                GestureDetector(
                  onTap: (){
                    spKey.currentState!.openDrawer();
                  },
                  child: MyContainer(
                    height: 40, width: 40, radius: 40,
                    horizontalPadding: 5, verticalPadding: 5,
                    shadowColor: maincolor.withOpacity(0.15), color: white,
                    child: Icon(FontAwesomeIcons.barsStaggered, size: 20.sp, color: black),
                  ),
                ),

                Width(size: 10),
                Expanded(
                  child: MyTextField(
                    color: lightButton.withOpacity(0.5),
                    radius: 40, controller: search,
                    height: 50, icon: Icon(Icons.search),
                    hint: 'Search cleaners etc..',
                  ),
                ),

                Width(size: 10),

                MyContainer(
                  height: 40, width: 40,
                  child: Icon(Icons.more_vert, color: black, size: 40.sp)
                ),

              ],
            ),
          ),
        ),
        drawer: MyDrawer(),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                MyContainer(
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
                      Tab(text: 'All'),
                      Tab(text: 'Hired'),
                      Tab(text: 'Verified'),

                    ],
                  ),
                ),
                MyContainer(
                  shadowColor: maincolor.withOpacity(0.1),
                  radius: 5,color: white,
                  child: Column(
                    children: [
                      MyContainer(
                        horizontalPadding: 10.w,
                        verticalPadding: 10.h,
                        color: white,
                        child: PoppinsText(text: 'Category', color: maincolor),
                      ),
                      MyDivider(color: lightButton),
                      SPDropdown(
                        horizontalPadding: 10,
                        height: 40,
                      ),
                    ],
                  ),
                ),
                Height(size: 20),
                PoppinsText(text: 'Service Providers', size: 20, fontWeight: FontWeight.bold),
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
                    )
                ),

              ],
            ),
          ),
        ),

      ),
    );
  }
}