import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:state_agent/Screens/bottom_navi/profile_screen/profile_screen.dart';
import 'package:state_agent/constants/get_date_time.dart';
import 'package:state_agent/constants/methods.dart';

import '../../../bottom_navigation/chat_screen/chat_screen.dart';
import '../home/sp_homepage.dart';
import '../wallet/sp_wallet.dart';



class SPDashboard extends StatefulWidget {
  const SPDashboard({Key? key}) : super(key: key);

  @override
  State<SPDashboard> createState() => _SPDashboardState();
}

class _SPDashboardState extends State<SPDashboard> with WidgetsBindingObserver{

  int currentTab =0;
  final List<Widget> screens=[SPHomePage(), SPWallet(), ChatScreen(), ProfileScreen(),];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = SPHomePage();

  Future<bool> _onWillPop() async {
    return false;
  }

  @override
  void setStatus(String status) async{
    await firestore.collection('users').doc(auth.currentUser?.uid).update({
      'status': status
    });
  }

  getUser() async{
    QuerySnapshot UserSnap = await firestore.collection('users').where('email', isEqualTo: auth.currentUser?.email).get();
    setState(() {
      authUser = UserSnap.docs[0].data();
    });
  }

  @override
  void initState() {
    getUser();
    WidgetsBinding.instance.addObserver(this);
    setStatus('online');
    super.initState();
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
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                boxShadow: [BoxShadow(
                  color: Color(0xffF2F6FE).withOpacity(1),
                  spreadRadius: 10,
                  blurRadius: 10,
                  offset: Offset(0, 9),
                )],
              ),
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
                            currentScreen= SPHomePage();
                            currentTab=0;
                          });
                        },
                        child: SvgPicture.asset("assets/home.svg", color: currentTab == 0 ? Color(0xff0336FF):Color(0xffcdd7ff),width: 25,height: 25),
                      ),
                      InkWell(
                        onTap: (){
                          setState(() {
                            currentScreen=SPWallet();
                            currentTab=2;
                          });
                        },
                        child: SvgPicture.asset("assets/payment.svg", color: currentTab == 2 ? Color(0xff0336FF):Color(0xffcdd7ff),width: 25,height: 25),
                      ),
                      InkWell(
                        onTap: (){
                          setState(() {
                            currentScreen=ChatScreen();
                            currentTab=3;
                          });

                        },
                        child: SvgPicture.asset("assets/chat.svg", color: currentTab == 3 ? Color(0xff0336FF):Color(0xffcdd7ff),width: 25,height: 25),
                      ),
                      InkWell(
                        onTap: (){
                          setState(() {
                            currentScreen=ProfileScreen();
                            currentTab=4;
                          });
                        },
                        child: SvgPicture.asset("assets/user.svg", color: currentTab == 4 ? Color(0xff0336FF):Color(0xffcdd7ff),width: 25,height: 25),
                      ),

                    ],
                  ),

                ),
              ),
            )





        ));
  }

}
