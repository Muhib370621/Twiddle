import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:state_agent/constants/methods.dart';
import '../constants/constants.dart';
import '../constants/get_date_time.dart';
import '../property/property_add.dart';
import 'dashboard/dashboard.dart';
import 'home/homepage.dart';
import 'service_providers/sp.dart';
import 'twiddle_wallet/twiddle_wallet.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> with WidgetsBindingObserver {
  // getUser() async{
  //   QuerySnapshot UserSnap = await firestore.collection('users').where('email', isEqualTo: auth.currentUser?.email).get();
  //   setState(() {
  //     authUser = UserSnap.docs[0].data();
  //   });
  // }
  int currentTab = 0;
  final List<Widget> screens = [
    HomePage(),
    Dashboard(),
    ServiceProviders(),
    TwiddleWallet()
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = HomePage();
  // Future<bool> _onWillPop() async {
  //   return false;
  // }

  // @override
  // void setStatus(String status) async{
  //   await firestore.collection('users').doc(auth.currentUser?.uid).update({
  //     'status': status
  //   });
  // }
  @override
  void initState() {
    // getUser();
    // WidgetsBinding.instance.addObserver(this);
    // setStatus('online');
    super.initState();
  }
  // @override
  // void didChangeAppLifecycleState(AppLifecycleState state) {
  //   super.didChangeAppLifecycleState(state);
  //   if (state == AppLifecycleState.resumed){
  //     setStatus('online');
  //   }
  //   else{
  //     getDateTime();
  //     setStatus('Last seen at ${time}');
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          body: PageStorage(
            child: currentScreen,
            bucket: bucket,
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color(0xffF2F6FE).withOpacity(1),
                  spreadRadius: 10,
                  blurRadius: 10,
                  offset: Offset(0, 9),
                )
              ],
            ),
            child: BottomAppBar(
              shape: CircularNotchedRectangle(),
              notchMargin: 10,
              child: Container(
                height: 65,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        setState(() {
                          currentScreen = HomePage();
                          currentTab = 0;
                        });
                      },
                      child: SvgPicture.asset("assets/home.svg",
                          color: currentTab == 0
                              ? Color(0xff0336FF)
                              : Color(0xffcdd7ff),
                          width: 25,
                          height: 25),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          currentScreen = Dashboard();
                          currentTab = 1;
                        });
                      },
                      child: SvgPicture.asset("assets/user.svg",
                          color: currentTab == 1
                              ? Color(0xff0336FF)
                              : Color(0xffcdd7ff),
                          width: 25,
                          height: 25),
                    ),
                    Width(),
                    InkWell(
                      onTap: () {
                        setState(() {
                          currentScreen = ServiceProviders();
                          currentTab = 2;
                        });
                      },
                      child: SvgPicture.asset(
                        "assets/service.svg",
                        color: currentTab == 2
                            ? Color(0xff0336FF)
                            : Color(0xffcdd7ff),
                        width: 25,
                        height: 25,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          currentScreen = TwiddleWallet();
                          currentTab = 3;
                        });
                      },
                      child: SvgPicture.asset(
                        "assets/payment.svg",
                        color: currentTab == 3
                            ? Color(0xff0336FF)
                            : Color(0xffcdd7ff),
                        width: 25,
                        height: 25,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.to(() => PropertyAdd());
            },
            backgroundColor: maincolor,
            child: Container(
              decoration: BoxDecoration(color: white, shape: BoxShape.circle),
              padding: EdgeInsets.all(5.sp),
              child: Icon(
                Icons.add,
                color: maincolor,
              ),
            ),
          ),
        ));
  }
}
