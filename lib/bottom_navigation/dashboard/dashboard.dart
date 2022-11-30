import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:state_agent/constants/constants.dart';

import '../../Drawer/settings.dart';
import '../../constants/hive/hive.dart';
import '../chat_screen/chat_screen.dart';
import '../drawer.dart';
import '../drawer/notification/Notifications.dart';
import '../home/controller/mainScreenController.dart';
import '../home/home_body.dart';
import 'dashboard_body.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MainScreenController mainScreenController =
    Get.put(MainScreenController());
    final GlobalKey<ScaffoldState> dashboardKey = GlobalKey();
    return Scaffold(
      key: dashboardKey,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: maincolor,
        title: MyContainer(
          color: transparent,
          verticalPadding: 10.h,
          child: Row(
            children: [

              GestureDetector(
                onTap: (){
                  dashboardKey.currentState!.openDrawer();
                },
                child: MyContainer(
                  height: 40, width: 40, radius: 40,
                  horizontalPadding: 5, verticalPadding: 5,
                  color: white,
                  child: Icon(FontAwesomeIcons.barsStaggered, color: black, size: 16.sp),
                ),
              ),

              Expanded(child: Container()),

              GestureDetector(
                onTap: () => Get.to(()=> Setting()),
                child: MyContainer(
                  height: 40, width: 40, radius: 40,
                  horizontalPadding: 8, verticalPadding: 8,
                  color: white,
                  child: SvgPicture.asset('assets/drawer/setting.svg', color: maincolor),
                ),
              ),
              Width(size: 10),

              GestureDetector(
             //   onTap: () => Get.to(()=> NotificationScreen()),
                  onTap: () => Get.to(()=> Notifications()),
                child: MyContainer(
                  height: 40, width: 40, radius: 40,
                  horizontalPadding: 8, verticalPadding: 8,
                  color: white,
                  child: SvgPicture.asset('assets/drawer/notification.svg', color: maincolor),
                ),
              ),

              Width(size: 10),

              GestureDetector(
                onTap: () => Get.to(()=> ChatScreen()),
                child: MyContainer(
                  height: 40, width: 40, radius: 40,
                  horizontalPadding: 8, verticalPadding: 8,
                  color: white,
                  child: SvgPicture.asset('assets/chat.svg', color: maincolor),
                ),
              ),

            ],
          ),
        ),
      ),
      drawer: MyDrawer(),
      // Tab Controller for property cards
      body: DefaultTabController(
        length: 3,
        child: SafeArea(
          child: Container(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                DashboardHeader(
                  name: mainScreenController.rentPropertyList.value.data![0].user!.firstname.toString().capitalize!,
                  image:  mainScreenController.rentPropertyList.value.data![0].user!.avatar.toString().toString(),
                ),
                Height(size: 20),
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 20.0),
                //   child: PoppinsText(text: 'My Listed Properties', size: 16, fontWeight: FontWeight.w500),
                // ),

                // Card here this will remove letter this calling through firebase
                Expanded(
                    child: TabBarView(
                      children: [
                        RentProperty(),
                        SalesProperty(),
                        ShortStayProperty(),
                      ],
                    )
                ),
                Height(size: 15),
                //
                // Expanded(
                //   child: ProfileProperty(
                //     currentUserId: authUser['uid']//FirebaseAuth.instance.currentUser?.uid,
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

