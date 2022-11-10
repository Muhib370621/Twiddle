import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:state_agent/Screens/bottom_navi/twiddle_wallet/add_card.dart';
import 'package:state_agent/Screens/bottom_navi/twiddle_wallet/topUp_invest.dart';

import '../../../Utilities/dialogueBox.dart';
import '../../../bottom_navigation/dashboard/invest/invest_now.dart';
import '../../../bottom_navigation/drawer/faq/faq_screen.dart';
import '../../../bottom_navigation/drawer/favourite/favourites.dart';
import '../../../bottom_navigation/drawer/help/help.dart';
import '../../../bottom_navigation/drawer/notification/Notifications.dart';
import '../../../bottom_navigation/drawer/recent_viewed/recentlyViewed.dart';
import '../../../bottom_navigation/drawer/twiddle_inv/twiddle_inv.dart';
import '../../../bottom_navigation/twiddle_wallet/more_vert/twidder_id.dart';
import '../../../constants/constants.dart';
import '../../../constants/methods.dart';
import '../../property_owner/dashboard_screen/transactionscreen.dart';
import '../../property_owner/navi_ownerPro.dart';
import '../drawer_screen/install_dash/pay_install.dart';
import '../drawer_screen/install_dash/your_install.dart';
import '../drawer_screen/setting_screen/setting_screen.dart';
import '../home_screen/dashboard_screen.dart';
import '../home_screen/homeScreen.dart';

class DashboardTwiddleWal extends StatefulWidget {
  const DashboardTwiddleWal({Key? key}) : super(key: key);

  @override
  State<DashboardTwiddleWal> createState() => _DashboardTwiddleWalState();
}

class _DashboardTwiddleWalState extends State<DashboardTwiddleWal> {

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

  Stream<QuerySnapshot> ref = firestore.collection('users').snapshots();

  @override
  Widget build(BuildContext context) {
    var scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xff0336FF),
        appBar: AppBar(
          backgroundColor: Color(0xff0336FF),
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
                      color: Color(0xff0336FF).withOpacity(1),
                      spreadRadius: 10,
                      blurRadius: 10,
                      offset: Offset(0, 2),
                    )]
                ),
                child: Icon(FontAwesomeIcons.barsStaggered, color: Colors.black, size: 22),

              ),
            ),
            SizedBox(width: 10),
            Center(child: Text("Twiddle Wallet",style: TextStyle(color: Colors.white,fontSize: 15))),
            Spacer(),



            // PopupMenuButton(
            //   icon: Container(
            //       decoration: BoxDecoration(
            //           boxShadow: [BoxShadow(
            //             color: Color(0xff0336FF).withOpacity(1),
            //             spreadRadius: 10,
            //             blurRadius: 10,
            //             offset: Offset(0, 2),
            //           )]
            //       ),
            //       child: Icon(Icons.more_vert, color: Colors.white, size: 35)),
            //
            //
            //   //Icon(Icons.more_vert, color: Colors.white, size: 35), color: Colors.white,
            //
            //
            //
            //
            //   onSelected: (value) {Navigator.pushNamed(context, value.toString());},
            //   itemBuilder: (BuildContext bc) {
            //     return [
            //       PopupMenuItem(
            //           child: Text('More Menu', style: TextStyle(color: kBlueButtonColor, fontSize: 12, fontFamily: "PoppinsRegular",),)),
            //       PopupMenuItem(
            //           onTap:(){
            //             Get.to(PayInstallment());
            //
            //               //Navigator.push(context, MaterialPageRoute(builder: (context)=> PayInstallment()));
            //           },
            //           child: Text('Pay Rent Instalment', style: kMenuStyle)),
            //       PopupMenuItem(
            //           onTap:(){
            //             //Get.to(RenterInstall());
            //           },
            //           child: Text('View Your Rent Dashboard', style: kMenuStyle)),
            //       PopupMenuItem(
            //           onTap:(){
            //             //Get.to(TransactionScreen());
            //           },
            //           child: Text('See All Your Recent Transactions', style: kMenuStyle)),
            //       PopupMenuItem(
            //           onTap:(){
            //             //Get.to(PayInstallment());
            //           },
            //           child: Text('See Rent Computation Details', style: kMenuStyle)),
            //       PopupMenuItem(
            //           onTap:(){
            //             //Get.to(TwiddleWallet());
            //           },
            //           child: Text('Top-Up Your Twiddle Balance', style: kMenuStyle)),
            //       PopupMenuItem(
            //           onTap:(){
            //
            //           },
            //           child: Text('See Your Twiddle Wallet Id', style: kMenuStyle)),
            //       PopupMenuItem(
            //           onTap:(){},
            //           child: Text('Add New Card', style: kMenuStyle)),
            //
            //     ];
            //   },
            // ),

            InkWell(
                onTap: (){


                    showDialog(
                        context: (context),
                        builder: (context)=>
                            Dialog(
                              alignment: Alignment.topRight,
                              child: Container(
                                height: 350.h, width: 200.w,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 18.h),
                                  child: ListView(
                                    shrinkWrap: true,
                                    children: [
                                      Text("More Menu", style: GoogleFonts.poppins(
                                          color: maincolor,
                                          fontSize: 14.sp
                                      ),),
                                      InkWell(
                                          onTap: (){
                                            Get.to(PayInstallment());
                                          },
                                          child: myText("Pay Rent Instalment")),
                                      InkWell(
                                          onTap: (){
                                            Get.to(RenterInstall());
                                          },
                                          child: myText("View Your Rent Dashboard")),
                                      InkWell(
                                          onTap: (){
                                            Get.to(TransactionScreen());
                                          },
                                          child: myText("See All Your Recent Transactions")),
                                      InkWell(
                                          onTap: (){
                                            Get.to(PayInstallment());
                                          },
                                          child: myText("See Rent Computation Details")),
                                      InkWell(
                                          onTap: (){
                                            Get.to(TopUpInvest());
                                          },
                                          child: myText("Top-Up Your Twiddle Balance")),
                                      InkWell(
                                          onTap: (){
                                            twiddleIDdialog(context);
                                          },
                                          child: myText("See Your Twiddle Wallet Id")),
                                      InkWell(
                                          onTap: (){
                                            Get.to(AddCard());
                                          },
                                          child: myText("Add New Card")),
                                    ],
                                  ),
                                ),
                              ),
                            )
                    );

            },
                child: Container(

                  child: Icon(Icons.more_vert, size: 35.sp, color: Colors.white,),
                )),



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
                        setStatus('offline');
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


                // Container(
                //   height: Get.height/(812/450),
                //   padding: EdgeInsets.symmetric(horizontal: 15.w),
                //   decoration: BoxDecoration(
                //       gradient: LinearGradient(
                //           begin: Alignment.topCenter,
                //           end: Alignment.bottomCenter,
                //           colors: [
                //             maincolor,
                //             darkblue
                //           ])
                //   ),
                //   child: StreamBuilder<QuerySnapshot>(
                //     stream: ref,
                //     builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                //       if (snapshot.hasError){
                //         return Center(child: PoppinsText(text: "Something went wrong"));
                //       }
                //       else if (snapshot.connectionState == ConnectionState.waiting){
                //         return Center(child: CircularProgressIndicator());
                //       }
                //       final data = snapshot.requireData;
                //       // var doc = snapshot.data?.docs[index].data();
                //       return ListView.builder(
                //           itemCount: data.size,
                //           itemBuilder: (context, index){
                //
                //             if(data.docs[index]['uid'] == auth.currentUser?.uid){
                //               Wallet(
                //                 wallet: data.docs[index]['wallet']
                //               );
                //             }
                //
                //             return Container();
                //           }
                //       );
                //     },
                //   ),
                // ),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            maincolor,
                            darkblue
                          ])
                  ),
                  child: Wallet(
                      wallet: authUser['wallet'] == null? '' : authUser['wallet']
                  ),
                ),

                Container(
                  width: Get.width,

                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      SizedBox(height: 20),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            
                            TextIconBox(
                              color: white,
                              text: 'Withdraw Money',
                              icon: 'walletic',
                              textAlign: TextAlign.center,
                              textColor: maincolor,
                              iconHeight: 30,
                              shadowColor: shadowcolor,
                            ),
                            TextIconBox(
                              text: 'Send Money',
                              icon: 'send',
                              textColor: white,
                              textAlign: TextAlign.center,
                              iconColor: white,
                              iconHeight: 30,
                              shadowColor: shadowcolor,
                            ),
                            TextIconBox(
                              onTap: ()=> TopUpInvest(),
                              color: white,
                              text: 'Top-Up Balance',
                              textAlign: TextAlign.center,
                              icon: 'top',
                              textColor: maincolor,
                              shadowColor: shadowcolor,
                              iconHeight: 30,
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20.w),
                        width: Get.width,
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            PoppinsText(text: "Recent Transactions", color: black, size: 16, fontWeight: FontWeight.bold),
                            Height(size: 20),
                            Wrap(
                              children: List.generate(3, (index) =>
                                  Column(children: [
                                    RecentTransaction(),
                                    Height()
                                  ],),
                              ),
                            ),
                            SizedBox(height: 20,),
                          ],
                        ),
                      )

                    ],
                  ),
                ),

              ]
            )


        )
    );
  }
}




Widget RecentTransaction(){
  return InkWell(
    onTap: (){
      Get.to(()=>TransactionScreen());
    },
    child: Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: shadowcolor,
              blurRadius: 10,
              offset: Offset(0, 10),
            ),]
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(height: 40, width: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/pipe.png')
                      )
                    ),
                    ),
                  Width(size: 15),
                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [
                        PoppinsText(text: "Pipe Bank LLC", size: 10),
                        Width(),
                        PoppinsText(text: "(Your Funder)", size: 9, color: hinttext)
                      ],),
                      Height(size: 5),
                      PoppinsText(text: "Payment ID: GHA193445C", size: 9, color: hinttext)
                    ],),

                ],
              ),
              Height(size: 20),
              PoppinsText(text: "Date: July 25, 2022", size: 10)
            ],
          ),

          Column(crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              PoppinsText(text: "Amount Paid", size: 9, color: hinttext),
              Height(size: 5),
              Container(
                height: 15.h, width: 64.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: maincolor
                ),
                child: Center(child: PoppinsText(text: "GHC150", size: 9, color: white)),
              ),
              Height(size: 5),
              PoppinsText(text: "Instalment", size: 9, color: hinttext),
              SizedBox(height: 5,),
              PoppinsText(text: "View Details", size: 9, color: bhinttext),
            ],)
        ],
      ),
    ),
  );
}

Widget Payment({required VoidCallback onTap,String? title,String? titleImage}){
  return InkWell(
      onTap: onTap,
      child: Container(
        width: Get.width*0.28,
        height: Get.height*0.15,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [BoxShadow(
              color: Color(0xffF2F6FE).withOpacity(1),
              spreadRadius: 10,
              blurRadius: 10,
              offset: Offset(0, 2),
            )]),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PoppinsText(text: title!, textAlign: TextAlign.center, color: maincolor, size: 15),
            Height(),
            SvgPicture.asset(titleImage!,width: 40,height: 40,),


          ],
        ),
      )

  );

}

Widget myText(String text){
  return Container(
    padding: EdgeInsets.symmetric(vertical: 7.h),
    child: PoppinsText(text: text,
        size: 12,
        color: hinttext
    )
  );
}

class Wallet extends StatelessWidget {
  final wallet;
  Wallet({Key? key, this.wallet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Height(size: 15),
        PoppinsText(text: 'Total Transactions', color: white, size: 14),
        Height(),
        PoppinsText(text: 'Ghc ${wallet}', color: white, size: 22),
        Height(size: 20),
        Center(
            child:  SvgPicture.asset(
              "assets/card.svg",
              width: Get.width, height: Get.height/4,
              fit: BoxFit.fill,
            )),
        SizedBox(height: 20),
        Center(
          child: Container(
            width: Get.width*0.8,
            height: Get.height*0.13,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.0)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PoppinsText(text: '(48%)', color: redtext, size: 8),
                    Height(),
                    PoppinsText(text: 'Payments', color: black, size: 12),
                    Height(),
                    PoppinsText(text: 'GHC 2,350', color: maincolor, size: 16, fontWeight: FontWeight.w500),

                  ],
                ),
                SizedBox(width: 30),
                Container(width: 1,height: Get.height*0.10,color: Colors.black),
                Width(size: 30),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PoppinsText(text: '(52%)', color: redtext, size: 8),
                    Height(),
                    PoppinsText(text: 'Received Bal', color: black, size: 12),
                    Height(),
                    PoppinsText(text: 'GHC 3,000', color: maincolor, size: 16, fontWeight: FontWeight.w500,)
                  ],
                )
              ],
            ),
          ),
        ),
        Height(size: 25,)
      ],
    );
  }
}
