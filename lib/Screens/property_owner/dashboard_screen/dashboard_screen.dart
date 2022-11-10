import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:state_agent/Screens/bottom_navi/service_screen/dash_service.dart';
import 'package:state_agent/bottom_navigation/tenants/my_tenants.dart';
import 'package:state_agent/constants/methods.dart';

import '../../../Utilities/dialogueBox.dart';
import '../../../bottom_navigation/chat_screen/chat_screen.dart';
import '../../../bottom_navigation/dashboard/invest/invest_now.dart';
import '../../../bottom_navigation/drawer/faq/faq_screen.dart';
import '../../../bottom_navigation/drawer/favourite/favourites.dart';
import '../../../bottom_navigation/drawer/help/help.dart';
import '../../../bottom_navigation/drawer/notification/Notifications.dart';
import '../../../bottom_navigation/drawer/recent_viewed/recentlyViewed.dart';
import '../../../bottom_navigation/drawer/twiddle_inv/twiddle_inv.dart';
import '../../../constants/constants.dart';
import '../../../constants/get_date_time.dart';
import '../../../property/property_list.dart';
import '../../bottom_navi/drawer_screen/install_dash/your_install.dart';
import '../../bottom_navi/drawer_screen/setting_screen/setting_screen.dart';
import '../../bottom_navi/home_screen/dashboard_screen.dart';
import '../../bottom_navi/home_screen/homeScreen.dart';
import '../navi_ownerPro.dart';
import 'add_property.dart';

class POwnerDashboard extends StatefulWidget {
  const POwnerDashboard({Key? key}) : super(key: key);

  @override
  State<POwnerDashboard> createState() => _POwnerDashboardState();
}

class _POwnerDashboardState extends State<POwnerDashboard> {

  @override
  void initState() {
    getOwner();
    super.initState();
  }

  getOwner() async{
    QuerySnapshot UserSnap = await firestore.collection('users').where('email', isEqualTo: auth.currentUser?.email).get();
    setState(() {
      authUser = UserSnap.docs[0].data();
    });
  }

  @override
  Widget build(BuildContext context) {
    var scaffoldKey = GlobalKey<ScaffoldState>();
    if(authUser == null){
      return Scaffold(
        body: Container(
          width: Get.width, height: Get.height,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    }
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: authUser['accType'] == 'Property Owner'? maincolor : Color(0xff8E2DE2),
        automaticallyImplyLeading: false,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        actions: <Widget>[
          SizedBox(width: 10),
          InkWell(
            onTap:() => scaffoldKey.currentState!.openDrawer(),
            child:  Container(
              width: Get.width*0.10,
              height: Get.height*0.10,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [BoxShadow(
                    color: authUser['accType'] == 'Property Owner'? maincolor : Color(0xff8E2DE2),
                    spreadRadius: 10,
                    blurRadius: 10,
                    offset: Offset(0, 2),
                  )]
              ),
              child: Icon(FontAwesomeIcons.barsStaggered, color: Colors.black, size: 22),

            ),
          ),
          Spacer(),

          InkWell(
            onTap:() {Get.to(()=>Notifications());},
            child:  Container(
              width: Get.width*0.10,
              height: Get.height*0.10,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [BoxShadow(
                    color: authUser['accType'] == 'Property Owner'? maincolor : Color(0xff8E2DE2),
                    spreadRadius: 10,
                    blurRadius: 10,
                    offset: Offset(0, 2),
                  )],
                  image: DecorationImage(
                      image: AssetImage("assets/other1.png")
                  )
              ),


            ),
          ),

          SizedBox(width: 20),
          InkWell(
            onTap:() {Get.to(()=>ChatScreen());},
            child:  Container(
              width: Get.width*0.10,
              height: Get.height*0.10,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [BoxShadow(
                    color: authUser['accType'] == 'Property Owner'? maincolor : Color(0xff8E2DE2),
                    spreadRadius: 10,
                    blurRadius: 10,
                    offset: Offset(0, 2),
                  )],
                  image: DecorationImage(
                      image: AssetImage("assets/chat1.png")
                  )
              ),
            ),
          ),

          SizedBox(width: 10)

        ],
      ),
      drawer: Drawer(

        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [



                SizedBox(height: 60),
                Text("Hello!", style: TextStyle(fontFamily: "PoppinsBold", fontSize: 16, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Text("Good Morning", style: TextStyle(fontFamily: "PoppinsRegular", fontSize: 16)),

                SizedBox(height: 15),
                Container(width: Get.width*0.5, height: 0.8, color: Colors.black26),

                SizedBox(height: 15),
                InkWell(
                  onTap: (){
                    Get.to(InvestNow());
                  },
                  child: Container(
                    height: 40,
                    width: Get.width*0.52,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.blue.withOpacity(1), width: 4),
                      color: maincolor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/invest.svg'),
                        SizedBox(width: 10),
                        Text('Invest Now', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600,),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 25),
                InkWell(
                    onTap: (){
                      if(authUser['accType'] == 'Property Owner' || authUser['accType'] == 'Real Estate Agent'){
                        Get.to(()=>NaviOwnerPro());
                      }
                      else{
                        Get.to(()=>Dashboard());
                      }
                    },
                    child:drawerItem("Home", "assets/homeDra.svg")
                ),
                SizedBox(height: 15),
                Container(width: Get.width*0.5, height: 1, color: Colors.black26),
                SizedBox(height: 15),
                InkWell(
                  onTap: () {
                    Get.to(()=>Notifications());
                  },
                  child: drawerItem("Notifications", "assets/notification.svg"),

                ),
                SizedBox(height: 15),
                Container(width: Get.width*0.5, height: 1, color: Colors.black26),
                SizedBox(height: 15),
                InkWell(
                  onTap: () {
                    Get.to(()=>RecentlyViewed());
                  },
                  child: drawerItem("Recently Viewed", "assets/recent.svg",
                  ),
                ),
                SizedBox(height: 15),
                Container(width: Get.width*0.5, height: 1, color: Colors.black26),
                SizedBox(height: 15),
                InkWell(
                  onTap: () {
                    Get.to(()=>Favourites());
                  },
                  child: drawerItem("My Favorites", "assets/favourites.svg"),
                ),
                SizedBox(height: 15),
                Container(width: Get.width*0.5, height: 1, color: Colors.black26),
                SizedBox(height: 15),
                InkWell(
                  onTap: () {
                    Get.to(()=>RenterInstall());
                  },
                  child: drawerItem("Instalment Dashboard", "assets/install.svg"),

                ),
                SizedBox(height: 15),
                Container(width: Get.width*0.5, height: 1, color: Colors.black26),
                SizedBox(height: 15),
                InkWell(
                  onTap: (){
                    Get.to(()=>HelpDesk());
                  },
                  child: drawerItem("Help", "assets/help.svg"),
                ),
                SizedBox(height: 15),
                Container(width: Get.width*0.5, height: 1, color: Colors.black26),
                SizedBox(height: 15),
                InkWell(
                  onTap: (){
                    Get.to(()=>FaqScreen());
                  },
                  child: drawerItem("FAQs", "assets/faq.svg"),
                ),
                SizedBox(height: 15),
                Container(width: Get.width*0.5, height: 1, color: Colors.black26),
                SizedBox(height: 15),
                InkWell(
                  onTap: (){Get.to(()=>TwiddleInv());},
                  child: drawerItem("About Twiddle INV", "assets/about.svg"),
                ),
                SizedBox(height: 15),
                Container(width: Get.width*0.5, height: 1, color: Colors.black26),
                SizedBox(height: 15),
                InkWell(
                  onTap: (){Get.to(()=>MySetting());},
                  child: drawerItem("Settings","assets/setting.svg"),
                ),
                SizedBox(height: 15),
                Container(width: Get.width*0.5, height: 1, color: Colors.black26),
                SizedBox(height: 15),
                InkWell(
                  child: drawerItem("Log Out", "assets/faq.svg",),
                  onTap: ( ) => dialogBox(
                    context,
                    "Confirm Log Out?",
                    "Cancel",
                    "Yes",
                    SvgPicture.asset('assets/check.svg'),
                        () {
                          getDateTime();
                          setStatus('last seen at ${time}');
                          logout();
                    },
                  ),
                ),
                SizedBox(height: 20)

              ],
            ),
          ),
        ),

      ),
      body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: Get.width,

                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        authUser['accType'] == 'Property Owner'? maincolor : Color(0xff8E2DE2),
                        authUser['accType'] == 'Property Owner'? darkblue : Color(0xff4A00E0),
                  ]),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)
                  )
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15,right: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      ProfilePic(
                        pic: authUser['profilePic'],
                        size: 80, borderWidth: 3, borderColor: white,
                      ),


                      PoppinsText(
                          text: authUser['name'],
                          color: Colors.white,
                          size: 18,
                          fontWeight: FontWeight.w500
                      ),
                      SizedBox(height: 5),
                      PoppinsText(
                          text: authUser['accType'],
                          color: authUser['accType'] == 'Property Owner' ? Color(0xff819BFF) : Colors.white54,
                          size: 12
                      ),

                      Height(size: 30),

                      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: (){
                              Get.to(()=> PropertyList());
                            },
                            child: Container(
                              height: Get.height/(812/110).h, width: Get.width/(375/100).w,
                              padding: EdgeInsets.all(10.sp),
                              decoration: BoxDecoration(
                                  color: white,
                                  borderRadius: BorderRadius.circular(30.r),
                              ),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    PoppinsText(text: 'My Listed Properties', textAlign: TextAlign.center, color: orange),
                                    PoppinsText(text: '06', color: orange, size: 18, fontWeight: FontWeight.bold,),
                                  ]
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              Get.to(() => AddProperty());
                            },
                            child: Container(
                              height: Get.height/(812/110).h, width: Get.width/(375/100).w,
                              padding: EdgeInsets.all(10.sp),
                              decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.circular(30.r),
                              ),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    PoppinsText(text: 'Add New Property', textAlign: TextAlign.center, color: maincolor),

                                    Container(
                                      padding: EdgeInsets.all(8.sp),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: maincolor
                                      ),
                                      child: PoppinsText(text: '+', size: 18, color: white),
                                    )
                                  ]
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              Get.to(()=> TenantsList());
                            },
                            child: Container(
                              height: Get.height/(812/110).h, width: Get.width/(375/100).w,
                              padding: EdgeInsets.all(10.sp),
                              decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.circular(30.r),
                              ),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    PoppinsText(text: 'My Total Tenants', textAlign: TextAlign.center, color: active),
                                    PoppinsText(text: '02', color: active, size: 18, fontWeight: FontWeight.bold,),
                                  ]
                              ),
                            ),
                          ),
                        ],
                      ),
                      Height(size: 40),
                    ],
                  ),
                ),
              ),







              Height(size: 20,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconTextBox(
                      onTap: (){
                        Get.to(()=>InvestNow());
                      },
                      text: 'Invest Now',
                      icon: 'top',
                      textAlign: TextAlign.center,
                      iconHeight: 30,
                      color: white,
                      textColor: maincolor,
                      shadowColor: shadowcolor,
                    ),
                    IconTextBox(
                      onTap: (){
                        Get.to(()=>DashService());
                      },
                      text: 'Service Providers',
                      icon: 'person',
                      iconHeight: 30,
                      textAlign: TextAlign.center,
                      iconColor: white,
                      textColor: white,
                      shadowColor: shadowcolor,
                    ),
                    IconTextBox(
                      onTap: (){
                        Get.to(()=>Favourites());
                      },
                      text: 'My Favorites',
                      icon: 'heart',
                      color: white,
                      iconHeight: 30,
                      textColor: maincolor,
                      shadowColor: shadowcolor,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),

              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PoppinsText(text: "Payments", size: 16,),

                    Height(size: 15),

                    Payment(),

                    Height(size: 15),


                    Height(size: 30),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        PoppinsText(text: "Recent Transactions", size: 16,),
                        PoppinsText(text: "See all", color: maincolor, )
                      ],
                    ),

                    Height(size: 15,),

                    RecentTransaction(),

                    Height(size: 30),



                  ],
                ),
              ),
            ],
          )
      ),
    );
  }
}

class Payment extends StatelessWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: shadowcolor,
              blurRadius: 10,
              offset: Offset(0, 7),
            ),]
      ),
      child: ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage("assets/johan.png"),
          ),
          title: Payment2()

      )
    );
  }
}

class Payment2 extends StatelessWidget {
  const Payment2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center,
      children: [

        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                PoppinsText(text: "Megan Men.", size: 10, fontWeight: FontWeight.w500),
                Width(),
                PoppinsText(text: "(Tenant)", color: bluetext, size: 10)
              ],
            ),
            PoppinsText(text: "GHC 2,350", size: 14, fontWeight: FontWeight.bold)
          ],
        ),

        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset("assets/mpayment.svg"),
                Width(),
                PoppinsText(text: "Overdue", color: redtext, fontWeight: FontWeight.w500,),
              ],
            ),
            PoppinsText(text: "3 days ago", size: 10, color: redtext,)
          ],
        )

      ],
    );
  }
}

class RecentTransaction extends StatelessWidget {
  const RecentTransaction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 20.h),
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: shadowcolor,
              blurRadius: 10,
              offset: Offset(0, 7),
            ),]
      ),
      child: Center(
        child: ListTile(
          leading: SvgPicture.asset("assets/greenarrow.svg"),
          title: RecentTransaction2(),
        ),
      )
    );
  }
}

class RecentTransaction2 extends StatelessWidget {
  const RecentTransaction2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PoppinsText(text: "Bank Transfer", size: 10, fontWeight: FontWeight.w500),
            PoppinsText(text: "Successfully Transferred.", size: 9, color: hinttext,),
            Row(
              children: [
                PoppinsText(text: "Date: ", size: 9),
                Width(size: 10,),
                PoppinsText(text: "Time: ", size: 9)
              ],
            ),


          ],
        ),


        PoppinsText(text: "GHC 3,000", size: 14, fontWeight: FontWeight.bold, color: Color(0xffFF4D4D),)

      ],);
  }
}