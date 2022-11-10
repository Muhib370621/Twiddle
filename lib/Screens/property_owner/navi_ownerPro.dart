import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:state_agent/Screens/bottom_navi/home_screen/homeScreen.dart';

import '../../constants/get_date_time.dart';
import '../../constants/methods.dart';
import '../bottom_navi/service_screen/dash_service.dart';
import '../bottom_navi/twiddle_wallet/dash_twiddleWall.dart';
import 'dashboard_screen/dashboard_screen.dart';




class NaviOwnerPro extends StatefulWidget {
  const NaviOwnerPro({Key? key}) : super(key: key);

  @override
  State<NaviOwnerPro> createState() => _NaviOwnerProState();
}

class _NaviOwnerProState extends State<NaviOwnerPro> with WidgetsBindingObserver{

  int currentTab =0;
  final List<Widget> screens=[

    POwnerDashboard(),
    HomePage(),
    DashService(),
    DashboardTwiddleWal(),
  ];

  final PageStorageBucket bucket= PageStorageBucket();
  Widget currentScreen= POwnerDashboard();

  Future<bool> _onWillPop() async {
    return false;
  }

  @override
  void initState() {
    getOwner();
    WidgetsBinding.instance.addObserver(this);
    setStatus('online');
    super.initState();
  }

  getOwner() async{
    QuerySnapshot UserSnap = await firestore.collection('users').where('email', isEqualTo: auth.currentUser?.email).get();
    setState(() {
      authUser = UserSnap.docs[0].data();
    });
  }

  @override
  void setStatus(String status) async{
    await firestore.collection('users').doc(auth.currentUser?.uid).update({
      'status': status
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed){
      setStatus('online');
    }
    else{
      getDateTime();
      setStatus('Last seen at ${time}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
          backgroundColor: Colors.white,
          body:
          PageStorage(
            child: currentScreen,
            bucket: bucket,

          ),
          bottomNavigationBar: ClipRRect(
            child: BottomAppBar(
              shape: CircularNotchedRectangle(),
              notchMargin: 10,
              child: Container(
                height: 65,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:<Widget>[

                    InkWell(
                      onTap: (){
                        setState(() {
                          currentScreen= POwnerDashboard();
                          currentTab=0;
                        });
                      },
                      child: SvgPicture.asset("assets/home.svg", color: currentTab == 0 ? Color(0xff0336FF):Color(0xffcdd7ff),width: 25,height: 25),
                    ),
                    InkWell(
                      onTap: (){
                        setState(() {
                          currentScreen= HomePage();
                          currentTab=1;
                        });
                      },
                      child: SvgPicture.asset("assets/home2.svg", color: currentTab == 1 ? Color(0xff0336FF):Color(0xffcdd7ff),width: 25,height: 25),
                    ),
                    InkWell(
                      onTap: (){
                        setState(() {
                          currentScreen=DashService();
                          currentTab=2;
                        });
                      },
                      child: SvgPicture.asset("assets/service.svg", color: currentTab == 2 ? Color(0xff0336FF):Color(0xffcdd7ff),width: 25,height: 25),
                    ),
                    InkWell(
                      onTap: (){
                        setState(() {
                          currentScreen=DashboardTwiddleWal();
                          currentTab=3;
                        });

                      },
                      child: SvgPicture.asset("assets/payment.svg", color: currentTab == 3 ? Color(0xff0336FF):Color(0xffcdd7ff),width: 25,height: 25),
                    ),

                  ],
                ),

              ),
            ),
          )





      ),
    );
  }

}
