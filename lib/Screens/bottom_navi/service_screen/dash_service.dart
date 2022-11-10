import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:state_agent/Screens/bottom_navi/service_screen/service_details.dart';
import 'package:state_agent/new/stream_builder.dart';
import 'package:state_agent/reviews_page.dart';
import '../../../Utilities/comp_screen.dart';
import '../../../constants/constants.dart';
import '../../../Utilities/dialogueBox.dart';
import '../../../constants/dropdowns.dart';
import '../../../constants/get_date_time.dart';
import '../../../constants/methods.dart';
import '../../../new/report_service_provider.dart';
import '../../../bottom_navigation/dashboard/invest/invest_now.dart';
import '../../property_owner/navi_ownerPro.dart';
import '../../user_auth/loginScreen.dart';
import '../drawer_screen/install_dash/your_install.dart';
import '../../../bottom_navigation/drawer/notification/Notifications.dart';
import '../../../bottom_navigation/drawer/favourite/favourites.dart';
import '../../../bottom_navigation/drawer/recent_viewed/recentlyViewed.dart';
import '../home_screen/dashboard_screen.dart';
import '../../../bottom_navigation/drawer/faq/faq_screen.dart';
import '../../../bottom_navigation/drawer/help/help.dart';
import '../drawer_screen/setting_screen/setting_screen.dart';
import '../../../bottom_navigation/drawer/twiddle_inv/twiddle_inv.dart';
import '../home_screen/homeScreen.dart';
import '../home_screen/product_info.dart';
import 'hired_service.dart';

class DashService extends StatefulWidget {
  const DashService({Key? key}) : super(key: key);

  @override
  State<DashService> createState() => _DashServiceState();
}



class _DashServiceState extends State<DashService> with SingleTickerProviderStateMixin {

  Stream<QuerySnapshot> info = FirebaseFirestore.instance.collection("users").snapshots();

  final search = TextEditingController();
  TabController? _tabContService;

  @override
  void initState() {
    _tabContService = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabContService!.dispose();
  }



  @override
  Widget build(BuildContext context) {
    var scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        actions: <Widget>[
          SizedBox(width: 10),

          InkWell(
            onTap:() => scaffoldKey.currentState!.openDrawer(),
            child:  Container(
              width: Get.width*0.11,
              height: Get.height*0.11,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [BoxShadow(
                    color: Color(0xffF2F6FE).withOpacity(1),
                    spreadRadius: 10,
                    blurRadius: 10,
                    offset: Offset(0, 2),
                  )]
              ),
              child: Icon(FontAwesomeIcons.barsStaggered, color: Colors.black, size: 22),

            ),
          ),

          SizedBox(width: 5),

          Padding(
            padding: const EdgeInsets.only(top: 4,bottom: 4),
            child: CustomEditedSearch(
              width: Get.width*0.7,
              height: 20,
              hintText: "Search Properties, Area etc..",
              controller: search,
            ),
          ),

          PopupMenuButton(
            icon: Container(
                child: Icon(Icons.more_vert, color: Colors.black, size: 35.sp)),
            color: Colors.white,
            onSelected: (value) {Navigator.pushNamed(context, value.toString());},
            itemBuilder: (BuildContext bc) {
              return [
                PopupMenuItem(child: Text(
                  'More Menu',
                    style: TextStyle(
                      color: maincolor,
                      fontSize: 12,
                      fontFamily: "PoppinsRegular",
                    ),
                  )),
                PopupMenuItem(child: Text('View Saved', style: kMenuStyle)),
                PopupMenuItem(child: Text('Recently Hired', style: kMenuStyle)),
                PopupMenuItem(child: Text('Report Service Provider', style: kMenuStyle)),
                PopupMenuItem(child: Text('Black Listed', style: kMenuStyle)),
                PopupMenuItem(child: Text('Twiddle Verified', style: kMenuStyle),
                ),

              ];
            },
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
                    child:drawerItem("Home", "assets/drawer/home.svg")
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
      body: DefaultTabController(
        length: 3,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),

              Container(
                height: 45,
                width: Get.width,
                decoration: BoxDecoration(
                  color: Color(0xffEAEEFA),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TabBar(

                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xff0336FF),
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  tabs: [
                    Tab(text: 'Highly Rated'),

                    InkWell(
                        onTap: (){
                          Get.to(()=>HiredService());
                        },
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Tab(text: 'Hired'),
                        )),
                    Tab(text: 'Verified'),

                  ],
                ),
              ),



              SizedBox(height: 30),
              Container(
                width: Get.width,
                height: Get.height*0.13,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [BoxShadow(
                        color: Color(0xffF2F6FE).withOpacity(1),
                        spreadRadius: 3,
                        blurRadius: 10,
                        offset: Offset(0, 9),
                      )]
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Text('Category', style: TextStyle(color: maincolor, fontSize: 15, fontFamily: "PoppinsMedium")),
                    ),
                    SizedBox(height: 10),
                    Container(width: Get.width,height: 1,color: Colors.black26),
                    SizedBox(height: 5),
                    SimpleDropDown(
                      list: [
                        "Cleaner",
                        "Painter",
                        "Mechanic",
                        "Gardener",
                      ],
                      text: "Commercial",
                      icon: Icon(Icons.arrow_drop_down, size: 25, color: silver),
                    ),

                  ],
                ),
              ),
              SizedBox(height: 20),

              Text("Service Providers",
              style: GoogleFonts.poppins(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold
              ),),

              Height(size: 20),
              Expanded(
                child: TabBarView(
                  children: <Widget>[

                    StreamBuilder<QuerySnapshot>(
                      stream: info,
                      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                        if (snapshot.hasError){
                          return Center(child: PoppinsText(text: "Something went wrong"));
                        }
                        else if (snapshot.connectionState == ConnectionState.waiting){
                          return Center(child: CircularProgressIndicator());
                        }
                        final data = snapshot.requireData;
                        // var doc = snapshot.data?.docs[index].data();
                        return ListView.builder(
                            itemCount: data.size,
                            itemBuilder: (context, index){

                              if(data.docs[index]['accType'] == 'Service Provider') {
                                return Column(
                                  children: [

                                    GestureDetector(
                                      onTap: (){
                                        Get.to(()=> ServiceDetails(
                                          uid: data.docs[index]['uid'],
                                        ));
                                      },
                                      child: ServiceProvider2(
                                        name: data.docs[index]['name'],
                                        profilePic: data.docs[index]['profilePic'],
                                        profession: data.docs[index]['profession'],
                                        price: data.docs[index]['price'],
                                        location: data.docs[index]['location'],
                                        verified: data.docs[index]['verified'],
                                        available: data.docs[index]['available'],
                                      ),
                                    ),
                                    Height()
                                  ],
                                );
                              }
                              return Container();
                            }
                        );
                      },
                    ),
                    StreamBuilder<QuerySnapshot>(
                      stream: info,
                      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                        if (snapshot.hasError){
                          return Center(child: PoppinsText(text: "Something went wrong"));
                        }
                        else if (snapshot.connectionState == ConnectionState.waiting){
                          return Center(child: CircularProgressIndicator());
                        }
                        final data = snapshot.requireData;
                        // var doc = snapshot.data?.docs[index].data();
                        return ListView.builder(
                            itemCount: data.size,
                            itemBuilder: (context, index){

                              var doc = snapshot.data?.docs[index].data();

                              if(data.docs[index]['accType'] == 'Service Provider' && data.docs[index]['hired'] == 'true')
                              {
                                return Column(
                                  children: [

                                    GestureDetector(
                                      onTap: (){
                                        Get.to(()=> ServiceDetails(
                                          uid: data.docs[index]['uid'],
                                        ));
                                      },
                                      child: ServiceProvider2(
                                        name: data.docs[index]['name'],
                                        profilePic: data.docs[index]['profilePic'],
                                        profession: data.docs[index]['profession'],
                                        price: data.docs[index]['price'],
                                        location: data.docs[index]['location'],
                                        verified: data.docs[index]['verified'],
                                        available: data.docs[index]['available'],
                                      ),
                                    ),
                                    Height()
                                  ],
                                );
                              }

                              return Container();
                            }
                        );
                      },
                    ),
                    StreamBuilder<QuerySnapshot>(
                      stream: info,
                      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                        if (snapshot.hasError){
                          return Center(child: PoppinsText(text: "Something went wrong"));
                        }
                        else if (snapshot.connectionState == ConnectionState.waiting){
                          return Center(child: CircularProgressIndicator());
                        }
                        final data = snapshot.requireData;
                        // var doc = snapshot.data?.docs[index].data();
                        return ListView.builder(
                            itemCount: data.size,
                            itemBuilder: (context, index){

                              if(data.docs[index]['accType'] == 'Service Provider')
                              {
                                return Column(
                                  children: [

                                    GestureDetector(
                                      onTap: (){
                                        Get.to(()=> ServiceDetails(
                                          uid: data.docs[index]['uid'],
                                        ));
                                      },
                                      child: ServiceProvider2(
                                        name: data.docs[index]['name'],
                                        profilePic: data.docs[index]['profilePic'],
                                        profession: data.docs[index]['profession'],
                                        price: data.docs[index]['price'],
                                        location: data.docs[index]['location'],
                                        verified: data.docs[index]['verified'],
                                        available: data.docs[index]['available'],
                                      ),
                                    ),
                                    Height()
                                  ],
                                );
                              }

                              return Container();
                            }
                        );
                      },
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}

class ServiceProvider extends StatelessWidget {
  String? fname; String? lname; String? name; String? status; String? verified;
  int? price; String? service; int? index; String? location; VoidCallback? vertTap;
  ServiceProvider({Key? key,
    this.fname,
    this.name,
    this.lname,
    this.verified,
    this.service,
    this.status,
    this.price,
    this.index,
    this.location,
    this.vertTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [


        MyContainer(
        shadowColor: shadowcolor,
        radius: 20, horizontalPadding: 20,
        verticalPadding: 20,
        child: Column(
          children: [

            Row(
              children: [

                verified == 'true'?
                Stack(
                  children: [

                    MyContainer(
                      height: Get.height/13, width: Get.height/13, radius: 50,
                      child: Image.asset('assets/pic${index}.png'),

                    ),
                    Positioned(
                      right: 1, top: 1, height: Get.height/50, width: Get.height/50,
                      child: Image.asset('assets/verified.png'),
                    )

                  ],
                ) : MyContainer(
                  height: Get.height/13, width: Get.height/13, radius: 50,
                  child: Image.asset('assets/pic${index}.png'),
                ),

                Width(size: 10,),

                Expanded(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      name == null ?
                      PoppinsText(text: '${fname} ${lname}', size: 14, fontWeight: FontWeight.w500) :
                      PoppinsText(text: '${name}', size: 14, fontWeight: FontWeight.w500),

                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          PoppinsText(text: '${service}', color: orange, size: 10,),
                          PoppinsText(text: 'Ghc ${price}/hr', color: maincolor, fontWeight: FontWeight.w500)
                        ],
                      ),

                  Row(
                        children: [
                          Wrap(
                              children: List.generate(5, (index) =>
                                  Icon(Icons.star, size: 13.sp, color: star)
                              )),
                          Width(),
                          PoppinsText(text: 'Reviews', size: 10, color: hinttext),
                        ],)

                    ],
                  ),
                ),

              ],
            ),


            Height(),

            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconText(icon: Icons.location_on, text: '${location}'),
                    Width(size: 10,),
                    status == 'Available'?
                    IconText(icon: Icons.verified, text: '${status}', color: active, iconColor: active,) :
                    IconText(icon: Icons.verified, text: '${status}', color: hinttext, iconColor: hinttext,)
                  ],
                ),

                MyContainer(
                  color: shadowcolor, height: 35, width: 35,
                  radius: 50,
                  child: Icon(Icons.bookmark_border, color: maincolor,),
                )

              ],
            ),


          ],
        ),
      ),

        Positioned(
          right: 5, top: 5,
          child: GestureDetector(
            onTap: vertTap,
            child: MyContainer(
              color: shadowcolor, height: 35, width: 35,
              radius: 50,
              child: Icon(Icons.more_vert),
            ),
          ),
        ),


    ]);
  }
}

class ServiceProvider2 extends StatelessWidget {
  String? name; String? available; String? verified;
  String? price; String? profession; String? profilePic; String? location; VoidCallback? vertTap;
  ServiceProvider2({Key? key,
    this.name,
    this.verified,
    this.profession,
    this.available,
    this.price,
    this.profilePic,
    this.location,
    this.vertTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [


          MyContainer(
            shadowColor: shadowcolor,
            radius: 20, horizontalPadding: 20,
            verticalPadding: 20, color: white,
            child: Column(
              children: [

                Row(
                  children: [

                    verified == 'true'?
                    Stack(
                      children: [

                        Container(
                          height: Get.height/(812/60), width: Get.height/(812/60),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                  image: NetworkImage(profilePic!)
                              )
                          ),


                        ),
                        Positioned(
                          right: 1, top: 1, height: Get.height/50, width: Get.height/50,
                          child: Image.asset('assets/verified.png'))
                      ],
                    ) : Container(
                        height: Get.height/(812/60), width: Get.height/(812/60),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(profilePic!)
                            )
                        )
                    ),

                    Width(size: 10,),

                    Expanded(
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [


                          PoppinsText(text: '${name}', size: 14, fontWeight: FontWeight.w500),

                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              PoppinsText(text: '${profession}', color: orange, size: 10,),
                              PoppinsText(text: 'Ghc ${price}/hr', color: maincolor, fontWeight: FontWeight.w500)
                            ],
                          ),

                          Row(
                            children: [
                              Wrap(
                                  children: List.generate(5, (index) =>
                                      Icon(Icons.star, size: 13.sp, color: star)
                                  )),
                              Width(),
                              PoppinsText(text: 'Reviews', size: 10, color: hinttext),
                            ],)

                        ],
                      ),
                    ),

                  ],
                ),


                Height(),

                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconText(icon: Icons.location_on, text: '${location}'),
                        Width(size: 10,),
                        available == 'Available'?
                        IconText(icon: Icons.check_circle, text: '${available}', color: active, iconColor: active,) :
                        IconText(icon: Icons.check_circle, text: '${available}', color: hinttext, iconColor: hinttext,)
                      ],
                    ),

                    MyContainer(
                      color: shadowcolor, height: 35, width: 35,
                      radius: 50,
                      child: Icon(Icons.bookmark_border, color: maincolor,),
                    )

                  ],
                ),


              ],
            ),
          ),

          Positioned(
            right: 5, top: 5,
            child: GestureDetector(
              onTap: vertTap,
              child: MyContainer(
                color: shadowcolor, height: 35, width: 35,
                radius: 50,
                child: Icon(Icons.more_vert),
              ),
            ),
          ),


        ]);
  }
}