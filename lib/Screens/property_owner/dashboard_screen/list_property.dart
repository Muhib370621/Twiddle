import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../Utilities/dialogueBox.dart';
import '../../../bottom_navigation/chat_screen/chat_screen.dart';
import '../../../bottom_navigation/drawer/faq/faq_screen.dart';
import '../../../bottom_navigation/drawer/favourite/favourites.dart';
import '../../../bottom_navigation/drawer/help/help.dart';
import '../../../bottom_navigation/drawer/notification/Notifications.dart';
import '../../../bottom_navigation/drawer/recent_viewed/recentlyViewed.dart';
import '../../../bottom_navigation/drawer/twiddle_inv/twiddle_inv.dart';
import '../../../constants/constants.dart';
import '../../bottom_navi/drawer_screen/install_dash/your_install.dart';
import '../../bottom_navi/drawer_screen/setting_screen/setting_screen.dart';
import '../../bottom_navi/home_screen/dashboard_screen.dart';
import '../../bottom_navi/home_screen/homeScreen.dart';
import '../../bottom_navi/home_screen/product_info.dart';
import '../../bottom_navi/service_screen/dash_service.dart';

class ListProperty extends StatefulWidget {
  const ListProperty({Key? key}) : super(key: key);

  @override
  State<ListProperty> createState() => _ListPropertyState();
}

class _ListPropertyState extends State<ListProperty> {
  @override
  Widget build(BuildContext context) {
    var scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
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
                    color: Color(0xff0336FF).withOpacity(1),
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
                    color: Color(0xff0336FF).withOpacity(1),
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
            padding: const EdgeInsets.only(left: 25,right: 25),
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
                Container(
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
                SizedBox(height: 25),
                InkWell(
                    onTap: (){Get.to(()=>Dashboard());},
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
                  child: drawerItem("Instalment Dashboard", "assets/installment.svg"),

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
                  child: drawerItem("Log Out", "assets/notification.svg"),

                  onTap: () => dialogBox(
                    context,
                    "Confirm Log Out?",
                    "Cancel",
                    "Yes",
                    SvgPicture.asset('assets/check.svg'),
                    () {},
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
                height: Get.height*0.50,
                decoration: BoxDecoration(
                    color: Color(0xff0336FF),
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
                      Container(
                        width: Get.width*0.16,
                        height: Get.height*0.16,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 3,color: Colors.white),
                            image: DecorationImage(
                                image: AssetImage("assets/johan.png")
                            )

                        ),
                      ),

                      Text("John Recardo",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)),
                      SizedBox(height: 5),
                      Text("Property Owner Dashboard",style: TextStyle(color: Color(0xff819BFF),fontSize: 15)),
                      Spacer(),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: (){Get.to(()=>ListProperty());},
                            child: Container(
                              width: Get.width*0.26,
                              height: Get.height*0.16,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),

                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("My Listed\n Properties",textAlign: TextAlign.center,style: TextStyle(color: Color(0xffFF9A03),fontSize: 17)),
                                  SizedBox(height: 10),
                                  Text("06",textAlign: TextAlign.center,style: TextStyle(color: Color(0xffFF9A03),fontSize: 25,fontWeight: FontWeight.bold)),

                                ],
                              ),
                            ),
                          ),

                          SizedBox(width: 20),
                          InkWell(
                            onTap: (){
                              //Get.to(()=>AddProperty());
                            },
                            child: Container(
                              width: Get.width*0.26,
                              height: Get.height*0.16,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),

                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Add New\n Property",textAlign: TextAlign.center,style: TextStyle(color: Color(0xff0336FF),fontSize: 17)),
                                  SizedBox(height: 8),
                                  Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xff0336FF)
                                    ),
                                    child: Icon(Icons.add,color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          Container(
                            width: Get.width*0.26,
                            height: Get.height*0.16,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),

                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("My Total\n Tenants",textAlign: TextAlign.center,style: TextStyle(color: Color(0xff01E08F),fontSize: 17)),
                                SizedBox(height: 10),
                                Text("02",textAlign: TextAlign.center,style: TextStyle(color: Color(0xff01E08F),fontSize: 25,fontWeight: FontWeight.bold)),

                              ],
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 30),


                    ],
                  ),
                ),
              ),



              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 15,right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: Get.width*0.29,
                      height: Get.height*0.18,
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
                          SvgPicture.asset("assets/top.svg",width: 40,height: 40),
                          Text("Invest\n Now",textAlign: TextAlign.center,style: TextStyle(color: Color(0xff0336FF),fontSize: 15)),
                          SizedBox(height: 10),


                        ],
                      ),
                    ),
                    InkWell(
                      onTap: (){Get.to(()=>DashService());},
                      child:  Container(
                        width: Get.width*0.29,
                        height: Get.height*0.18,
                        decoration: BoxDecoration(
                            color: Color(0xff0336FF),
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
                            Image.asset("assets/personP.png"),
                            SizedBox(height: 10),
                            Text("Service\n Providers",textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 15)),



                          ],
                        ),
                      ),
                    ),
                    InkWell(
                        onTap: (){Get.to(()=>Favourites());},
                        child: Container(
                          width: Get.width*0.29,
                          height: Get.height*0.18,
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
                              SvgPicture.asset("assets/heart.svg",width: 40,height: 40,),
                              SizedBox(height: 10),
                              Text("My\n Favorites",textAlign: TextAlign.center,style: TextStyle(color: Color(0xff0336FF),fontSize: 15)),



                            ],
                          ),
                        )
                    )
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text("      My Listed Properties (06)",style: TextStyle(color: Colors.black,fontSize: 20)),
              SizedBox(height: 40),
              InkWell(
                  onTap: () {Get.to(()=>ProductDetails());
                  },
                  child: CardProperty(
                    "3 BEDROOM TOWNHOUSE FOR SALE",
                    "AT OYARIFA",
                    150,
                    "Oyarfia",
                    "assets/card0.png",
                    "Rent",
                    orange, () {
                    setState(() {
                      outline = !outline;
                    });
                  },
                    Icon(
                      outline ? Icons.bookmark_outline : Icons.bookmark,
                      color: maincolor,
                      size: 20,
                    ),
                  )
              ),
              SizedBox(height: 40),
              InkWell(
                  onTap: () {Get.to(()=>ProductDetails());
                  },
                  child: CardProperty(
                    "3 BEDROOM TOWNHOUSE FOR SALE",
                    "AT OYARIFA",
                    150,
                    "Oyarfia",
                    "assets/card0.png",
                    "Rent",
                    orange, () {
                    setState(() {
                      outline = !outline;
                    });
                  },
                    Icon(
                      outline ? Icons.bookmark_outline : Icons.bookmark,
                      color: maincolor,
                      size: 20,
                    ),
                  )
              ),








            ],
          )


      ),




    );
  }
}
