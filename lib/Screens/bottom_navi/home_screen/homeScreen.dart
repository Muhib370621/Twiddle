import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:state_agent/constants/constants.dart';

import '../../../Utilities/comp_screen.dart';
import '../../../bottom_navigation/drawer.dart';
import '../../../bottom_navigation/home/filters.dart';
import '../../../constants/dropdowns.dart';
import '../../../constants/methods.dart';
import '../../../property/property_ads/user_property_ad.dart';
import '../../../property/property_details.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {


  final GlobalKey<ScaffoldState> _key = GlobalKey();
  TabController? _tabController;
  final search = TextEditingController();

  final ref = FirebaseDatabase.instance.ref('Property');
  bool isSave = true;
  var type;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        key: _key,
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          backgroundColor: Color(0xffFAFBFF),
          automaticallyImplyLeading: false,
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
          actions:<Widget> [
            SizedBox(width: 10),

            InkWell(
              onTap:() => _key.currentState!.openDrawer(),
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

            SizedBox(width: 5),


            InkWell(
              onTap: ()=> Get.to(()=>FilterScreen()),
              child:  Container(
                width: Get.width*0.11,
                height: Get.height*0.11,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: maincolor,
                    boxShadow: [BoxShadow(
                      color: Color(0xffF2F6FE).withOpacity(1),
                      spreadRadius: 10,
                      blurRadius: 10,
                      offset: Offset(0, 2),
                    )]

                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset('assets/home/filter.svg', color: Colors.white),

                ),
              ),
            ),

            SizedBox(width: 10)



          ],

        ),
        drawer: MyDrawer(),
        body: Column(
          children: [
            Container(
              height: 170,
              decoration: BoxDecoration(
                color: kTopNavBarColor,
              ),
              child: Padding(
                padding:  EdgeInsets.only(left: 20,right: 20),
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Container(
                      height: 45,

                      decoration: BoxDecoration(
                        color: Color(0xffEAEEFA),
                        borderRadius: BorderRadius.circular(15.r),

                      ),
                      child: TabBar(
                        controller: _tabController,

                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r),
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
                    SizedBox(height: 15),
                    Container(
                      width: Get.width,
                      height: 36,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xffF2F6FE).withOpacity(1),
                            spreadRadius: 10,
                            blurRadius: 10,
                            offset: Offset(0, 2),
                          ),],
                        color: Colors.white,
                      ),
                      child:   Padding(
                        padding: EdgeInsets.all(8.sp),
                        child: PoppinsText(text: 'Select Real Estate Type', color: maincolor),
                      ),

                    ),
                    SizedBox(height: 1.5),
                    Container(
                      width: Get.width,
                      height: 36,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xffF2F6FE).withOpacity(1),
                              spreadRadius: 10,
                              blurRadius: 10,
                              offset: Offset(0, 12),
                            ),]),
                      child: PropertiesDropdown(),
                    ),
                  ],
                ),
              ),
            ),

            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  FirebaseAnimatedList(
                    query: ref,
                    itemBuilder: (BuildContext context, DataSnapshot snapshot,
                        Animation<double> animaiton, int index){


                      var value = Map<String, dynamic>.from(snapshot.value as Map);
                      //var key = snapshot.key;
                      type = value['type'];
                      var pId = value['pId'];

                      if (type == 'Rent'){
                        return Column(
                          children: [
                            GestureDetector(
                              onTap: (){
                                Get.to(()=> PropertyDetails(
                                  title: value['title'],
                                  bedroom: value['bedrooms'],
                                  location: value['desc'],
                                  type: value['type'],
                                  price: value['price'],
                                  ac: value['ac'],
                                  desc: value['desc'],
                                  kitchen: value['kitchens'],
                                  parking: value['parking'],
                                  quarters: value['quarters'],
                                  tap: value['tap'],
                                  washroom: value['washrooms'],
                                  uid: value['uid'],
                                  visitCharges: value['visitCharges'],
                                ));
                              },
                              child: UserPropertyAD(
                                  index: index,
                                  type: value['type'],
                                  bedrooms: value['bedrooms'],
                                  title: value['title'],
                                  price: value['price'],
                                  location: value['desc'],
                                  addFavTap: (){
                                    addFav(pId);
                                  },
                              ),
                            ),
                            Height(size: 20),
                          ],
                        );
                      }
                      return Container();


                    },

                  ),
                  FirebaseAnimatedList(
                    query: ref,
                    itemBuilder: (BuildContext context, DataSnapshot snapshot,
                        Animation<double> animaiton, int index){


                      var value = Map<String, dynamic>.from(snapshot.value as Map);
                      //var key = snapshot.key;
                      type = value['type'];
                      var pId = value['pId'];

                      if (type == 'Sale'){
                        return Column(
                          children: [
                            GestureDetector(
                              onTap: (){
                                Get.to(()=> PropertyDetails(
                                  title: value['title'],
                                  bedroom: value['bedrooms'],
                                  location: value['desc'],
                                  type: value['type'],
                                  price: value['price'],
                                  ac: value['ac'],
                                  desc: value['desc'],
                                  kitchen: value['kitchens'],
                                  parking: value['parking'],
                                  quarters: value['quarters'],
                                  tap: value['tap'],
                                  washroom: value['washrooms'],
                                  uid: value['uid'],
                                  visitCharges: value['visitCharges'],
                                ));
                              },
                              child: UserPropertyAD(
                                  index: index,
                                  type: value['type'],
                                  bedrooms: value['bedrooms'],
                                  title: value['title'],
                                  price: value['price'],
                                  location: value['desc'],
                                  addFavTap: (){
                                    addFav(pId);
                                  },
                              ),
                            ),
                            Height(size: 20),
                          ],
                        );
                      }
                      return Container();


                    },

                  ),
                  FirebaseAnimatedList(
                    query: ref,
                    itemBuilder: (BuildContext context, DataSnapshot snapshot,
                        Animation<double> animaiton, int index){


                      var value = Map<String, dynamic>.from(snapshot.value as Map);
                      //var key = snapshot.key;
                      type = value['type'];
                      var pId = value['pId'];

                      if (type == 'Short Stay'){
                        return Column(
                          children: [
                            GestureDetector(
                              onTap: (){
                                Get.to(()=> PropertyDetails(
                                  title: value['title'],
                                  bedroom: value['bedrooms'],
                                  location: value['desc'],
                                  type: value['type'],
                                  price: value['price'],
                                  ac: value['ac'],
                                  desc: value['desc'],
                                  kitchen: value['kitchens'],
                                  parking: value['parking'],
                                  quarters: value['quarters'],
                                  tap: value['tap'],
                                  washroom: value['washrooms'],
                                  uid: value['uid'],
                                  visitCharges: value['visitCharges'],
                                ));
                              },
                              child: UserPropertyAD(
                                  index: index,
                                  type: value['type'],
                                  bedrooms: value['bedrooms'],
                                  title: value['title'],
                                  price: value['price'],
                                  location: value['desc'],
                                  addFavTap: (){
                                    //addFav(pId);
                                  },
                              ),
                            ),
                            Height(size: 20),
                          ],
                        );
                      }
                      return Container();


                    },

                  ),
                ],
              ),
            ),

          ],
        ),

      ),
    );
  }


  void addFav(String fav) async{
    await firestore.collection('users').doc(auth.currentUser?.uid).collection('favourites').doc().set({
      'favourite': fav
    });
  }

}


Widget CardProperty(String title, String cityName, int price, String location, String imagePath, String type, Color typeColor, VoidCallback onPressed, Widget icon,) {
  return Stack(children: [

    Positioned(
      child: Container(
        width: Get.width * 0.98,
        height: Get.height * 0.42,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
              blurRadius: 2,
            )
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
            // fit: BoxFit.contain,
            scale: 2,
            alignment: Alignment.topCenter,
            image: AssetImage(
              imagePath,
            ),
          ),
        ),
      ),
    ),
    Positioned(
      top: Get.height * 0.20,
      child: Container(
        width: Get.width * 0.903,
        height: 140,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 18),
              PoppinsText(text: title, size: 14),
              PoppinsText(text: cityName, size: 14),
              SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    'GHC $price',
                    style: TextStyle(
                        color: Color(0xFF2E3034),
                        fontFamily: "PoppinsBold",
                        fontSize: 20),
                  ),
                  Text(
                    '/ month',
                    style: TextStyle(
                      color: Color(0xFF2E3034),
                      fontFamily: "PoppinsMedium",
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    size: 12,
                    color: Color(0xFF8F92A1),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    location,
                    style: TextStyle(
                      color: Color(0xFF8F92A1),
                      fontFamily: "PoppinsMedium",
                      fontSize: 12,
                    ),
                  )
                ],
              ),
              SizedBox(height: 8),
            ],
          ),
        ),
      ),
    ),
    Positioned(
      top: Get.height * 0.186,
      left: Get.width * 0.03,
      child: Container(
        width: 60,
        height: 18,
        decoration: BoxDecoration(
            color: typeColor,
            borderRadius: BorderRadius.all(
              Radius.elliptical(45, 40),
            ),
            boxShadow: [
              BoxShadow(
                blurRadius: 4,
                color: Colors.grey,
              )
            ]),
        child: Center(
          child: Text(
            type,
            style: TextStyle(
              fontSize: 10,
              fontFamily: "PoppinsRegular",
              color: Colors.white,
            ),
          ),
        ),
      ),
    ),
    Positioned(
      left: Get.width * 0.8,
      top: Get.height * 0.02,
      right: Get.width * 0.02,
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                blurRadius: 5,
                color: Colors.grey,
              )
            ]),
        child: InkWell(
          child: icon,
          onTap: onPressed,
        ),
      ),
    ),
  ]);
}

Widget drawerItem(String text, String image) {
  final textColor = Color(0xFF2E3034);
  return Row(
    children: [
      SvgPicture.asset(image),
      SizedBox(width: 20),
      Text(text, style: TextStyle(color: textColor)),


    ],
  );

}


