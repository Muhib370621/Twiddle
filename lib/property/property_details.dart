import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:state_agent/new/profile.dart';
import 'package:state_agent/new/user_list.dart';
import '../Screens/bottom_navi/home_screen/detail.dart';
import '../Screens/bottom_navi/home_screen/product_info.dart';
import '../Screens/bottom_navi/home_screen/rentDetail.dart';
import '../Screens/bottom_navi/home_screen/rentDetail2.dart';
import '../Screens/bottom_navi/home_screen/visitCharges.dart';
import '../Utilities/comp_screen.dart';
import '../constants/constants.dart';
import '../Utilities/dialogueBox.dart';
import '../bottom_navigation/chat_screen/messages.dart';
import '../constants/methods.dart';
import '../new/payment_summary.dart';

class PropertyDetails extends StatefulWidget {
  String? title; int? price; String? location; String? type; String? bedroom;
  String? tap; String? washroom; String? quarters; String? ac; String? kitchen;
  String? parking; String? desc; String? uid; int? visitCharges;
  PropertyDetails({
    Key? key,
    this.title = '', this.bedroom = '', this.location = '', this.price,
    this.type = '', this.quarters = '', this.washroom = '', this.kitchen = '',
    this.desc = '', this.ac = '', this.parking = '', this.tap = '', this.uid, this.visitCharges
  }) : super(key: key);

  @override
  State<PropertyDetails> createState() => _PropertyDetailsState();
}

var adposter;
class _PropertyDetailsState extends State<PropertyDetails> {

  @override
  void initState() {
    adLister();
    super.initState();
  }

  void adLister() async{

    QuerySnapshot UserSnap = await FirebaseFirestore.instance.collection('users').where('uid', isEqualTo: widget.uid).get();
    setState((){
      adposter = UserSnap.docs[0].data();
    });
  }

  final List<String> images = ['assets/card1.png', 'assets/card2.png', 'assets/card3.png'];

  @override
  Widget build(BuildContext context) {

    String PropertyAction = 'Buy Now';
    String period = '';
    if(widget.type == 'Rent'){
      setState(() {
        period = '/month';
        PropertyAction = 'Rent Property';
      });
    }
    else if(widget.type == 'Short Stay'){
      setState(() {
        period = '/night';
        PropertyAction = 'Rent Property';
      });
    }

    if(adposter == null){
      return Scaffold(
        body: Container(
          width: Get.width, height: Get.height,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    }
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: white,
        body: Container(
          height: Get.height, width: Get.width,
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Stack(
                children: [

                  Positioned(
                    child: Container(
                      width: Get.width,
                      height: Get.height * 0.3,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20.r),
                              bottomRight: Radius.circular(20.r)
                          )
                      ),
                      child: Container(
                        child: CarouselSlider.builder(
                          slideBuilder: (index) {
                            return Image.asset(
                              'assets/card$index.png',
                              fit: BoxFit.cover,
                            );
                          },
                          slideIndicator: CircularSlideIndicator(
                              padding: EdgeInsets.only(bottom: 10),
                              indicatorBorderWidth: 0.1,
                              itemSpacing: 18,
                              indicatorBackgroundColor: Colors.white,
                              currentIndicatorColor: Colors.black12,
                              indicatorBorderColor: Colors.white),
                          itemCount: 3,
                          unlimitedMode: true,
                          enableAutoSlider: true,
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    left: 15.w,
                    top: 40.h,
                      child: Container(
                      child: RoundBackButton(),
                      )),

                  Positioned(
                      right: 15.w,
                      top: 30.h,
                      child: Container(
                        child: PopupMenuButton(
                          offset: Offset(0, 50),
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                          icon: Icon(Icons.more_vert, color: Colors.white, size: 35),
                          color: Colors.white,
                          onSelected: (value) {
                            Navigator.pushNamed(context, value.toString());
                          },
                          itemBuilder: (BuildContext bc) {
                            return [
                              PopupMenuItem(
                                child: Text(
                                  'More Menu',
                                  style: TextStyle(
                                    color: maincolor,
                                    fontSize: 12,
                                    fontFamily: "PoppinsRegular",
                                  ),
                                ),
                              ),
                              PopupMenuItem(
                                child: Text(
                                  'Confirm Interest in Property',
                                  style: kMenuStyle,
                                ),
                                onTap: () {
                                  dialogBox(
                                    context,
                                    "Confirm Interest in Property?",
                                    "Cancel",
                                    "Yes",
                                    SvgPicture.asset('assets/check.svg'),
                                        () {},
                                  );
                                },
                              ),
                              PopupMenuItem(
                                child: Text(
                                  'Apply for Rent Funding',
                                  style: kMenuStyle,
                                ),
                              ),
                              PopupMenuItem(
                                child: Text(
                                  'Report Agent',
                                  style: kMenuStyle,
                                ),
                                value: '/reportAgent',
                              ),
                              PopupMenuItem(
                                child: Text(
                                  'Black List Agent',
                                  style: kMenuStyle,
                                ),
                                onTap: () {
                                  dialogBox2(
                                      context,
                                      "Moved to blacklist",
                                      "Done",
                                      SvgPicture.asset(
                                        'assets/check.svg',
                                      ), () {
                                    Navigator.pop(context);
                                  });
                                },
                              ),
                              PopupMenuItem(
                                child: Text(
                                  'Switch to Owner/Agent',
                                  style: kMenuStyle,
                                ),
                              ),
                              PopupMenuItem(
                                child: Text(
                                  '360 Viewing',
                                  style: kMenuStyle,
                                ),
                              ),
                              PopupMenuItem(
                                child: Text(
                                  'Visit Property',
                                  style: kMenuStyle,
                                ),
                              ),
                            ];
                          },
                        ),
                      )),

                ],
              ),

              Height(size: 30,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: PoppinsText(
                          text: '${widget.bedroom} ${widget.title} for ${widget.type} at ${widget.location}'.toUpperCase(),
                          size: 18,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.bold),
                    ),

                    GestureDetector(
                      onTap: () {
                        Get.to(()=>UserProfile(
                          uid: widget.uid,
                        ));
                      },
                      child:
                      Picture(
                        size: 50,
                        borderWidth: 2,
                        borderColor: maincolor,
                        url: adposter['profilePic'],
                      ),
                    )

                  ],
                ),
              ),
              Height(size: 10),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  children: [

                    adposter['name'] == null? Iconbutton(
                      onTap: (){
                      },
                      text: 'Start Chat',
                      width: Get.width/3.w,
                      height: Get.height/20.h,
                      fontWeight: FontWeight.w500,
                      icon: Icons.chat_bubble,
                      shadowColor: maincolor.withOpacity(0.7),
                    ) :
                    Iconbutton(
                      onTap: (){
                        Get.to(()=> ChatRoom(
                          receiverId: '${widget.uid}',
                        ));
                      }, radius: 30,
                      text: 'Start Chat',
                      width: Get.width/3.w,
                      height: Get.height/20.h,
                      fontWeight: FontWeight.w500,
                      icon: Icons.chat_bubble,
                      shadowColor: maincolor.withOpacity(0.7),
                    ),

                    Width(size: 10),

                    Button(
                      onTap: (){
                        Get.to(()=>VisitCharges(
                          visitCharges: widget.visitCharges,
                        ));
                      },
                      text: 'Visit Property',
                      buttonColor: orange,
                      width: Get.width/3.w,
                      height: Get.height/20.h,
                      fontWeight: FontWeight.w500,
                      shadowColor: orange.withOpacity(0.7),
                    ),

                    Width(size: 10),

                    Container(
                      width: Get.height/20.h,
                      height: Get.height/20.h,
                      decoration: BoxDecoration(
                        color: active,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: active.withOpacity(0.7),
                            blurRadius: 10,
                            offset: Offset(0, 3)
                          )
                        ]
                      ),
                      child: Icon(Icons.location_on_outlined, color: white,)
                    ),

                  ],
                ),
              ),
              Height(size: 20,),
              MyDivider(),
              Container(
                height: Get.height/20,
                child: TabBar(
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorColor: maincolor,
                  labelColor: maincolor,
                  tabs: [
                    Tab(
                      child: PoppinsText(text: 'Description', size: 10),
                    ),
                    Tab(
                      child: PoppinsText(text: 'Specifications', size: 10),
                    ),
                    Tab(
                      child: PoppinsText(text: 'Gallery', size: 10),
                    )
                  ],
                ),
              ),
              MyDivider(),
              Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: TabBarView(
                      children: [
                        
                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Height(size: 15,),
                            PoppinsText(
                                text: '${widget.bedroom} ${widget.title} for ${widget.type} at ${widget.location} in price ${widget.price}.'
                            ),
                            // PoppinsText(
                            //   text: '${widget.desc}',
                            //   fontWeight: FontWeight.w500,
                            // ),
                          ],
                        ),

                        Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [


                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                Availability(icon: 'tap', text: '${widget.tap}'),
                                Availability(icon: 'bedroom', text: '${widget.bedroom}'),
                                Availability(icon: 'kitchen', text: '${widget.kitchen}'),
                                Availability(icon: 'ac', text: '${widget.ac}'),
                              ],
                            ),


                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                Availability(icon: 'washroom', text: '${widget.washroom}'),
                                Availability(icon: 'parking', text: '${widget.parking}'),
                                Availability(icon: '420', text: 'Available'),
                                Availability(icon: 'quarter', text: '${widget.quarters}'),
                              ],
                            ),

                          ],
                        ),

                        SingleChildScrollView(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(
                                  'assets/g1.png',
                                  scale: 1.3,
                                  width: Get.width * 0.37),
                              SizedBox(width: 15),
                              Expanded(
                                child: Column(
                                  children: [
                                    // SizedBox(height: Get.height * 0.036),
                                    // Image.asset('assets/g2.png', scale: 1.8),
                                    // Height(),
                                    // Image.asset('assets/g3.png', scale: 2.6),
                                    // SizedBox(height: Get.height * 0.036),

                                    Container(

                                      child: Image.asset('assets/g2.png'),
                                    ),

                                    Height(),
                                    Container(
                                      child: Image.asset('assets/g3.png'),
                                    )

                                  ],
                                ),
                              )
                            ],
                          ),
                        )

                      ],
                    ),
                  )),
              Container(
                height: Get.height/11, width: Get.width,
                decoration: BoxDecoration(
                  color: white,
                  boxShadow: [
                    BoxShadow(
                      color: silver.withOpacity(0.5),
                      blurRadius: 20
                    )
                  ]
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Expanded(
                        child: Row(crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            PoppinsText(
                              text: '${widget.price} GHC',
                              size: 18,
                              fontWeight: FontWeight.bold,),
                            PoppinsText(text: period)


                          ],
                        ),
                      ),

                      Button(
                        onTap: (){
                          Get.to(()=>PropertySummary(
                            price: widget.price,
                            type: widget.type,
                          ));
                        },
                        text: PropertyAction,
                        fontWeight: FontWeight.bold, size: 12.sp,
                        height: Get.height/17.h, width: 152,
                      )
                    ],
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}


class Availability extends StatelessWidget {
  String? icon;
  String? text;
  Availability({
    Key? key,
    this.icon,
    this.text
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset('assets/$icon.svg', height: 40, width: 40,),
        Height(size: 5),
        Container(
          width: Get.width/4.68,
          padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 3.h),
          decoration: BoxDecoration(
            color: Color(0xFFDEEFF5),
            borderRadius: BorderRadius.all(
              Radius.circular(10.r),
            ),
          ),
          child: Center(
            child: PoppinsText(text: text!,
                color: maincolor,
                size: 10.sp,
              textAlign: TextAlign.center,
            ),),
        ),
      ],
    );
  }
}
