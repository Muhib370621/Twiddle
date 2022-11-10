import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:state_agent/Utilities/dialogueBox.dart';
import 'package:state_agent/constants/constants.dart';

import '../../../Utilities/comp_screen.dart';
import 'detail.dart';
import 'rentDetail.dart';
import 'visitCharges.dart';

class ProductDetails extends StatefulWidget {
  String title; String price; String location; String type; String bedrooms;

  ProductDetails({
    Key? key,
    this.title = '',
    this.bedrooms = '',
    this.location = '',
    this.price = '',
    this.type = ''
  }) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final List<String> images = ['assets/card1.png', 'assets/card2.png', 'assets/card3.png'];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Stack(
              children: [
                Positioned(
                  child: Container(
                    color: Colors.white,
                    height: Get.height * 0.54,
                    width: Get.width,
                  ),
                ),

                Positioned(
                  top: 0,
                  child: Container(
                    width: Get.width,
                    height: Get.height * 0.3,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20.r),
                            bottomRight: Radius.circular(20.r)
                        )
                    ),
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

                Positioned(
                  top: Get.height * 0.04,
                  left: Get.width * 0.035,
                  right: 0,
                  child: Row(
                    children: [
                      RoundBackButton(),
                      Spacer(),
                      PopupMenuButton(
                        offset: Offset(0, 50),
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        icon: Icon(
                          Icons.more_vert,
                          color: Colors.white,
                          size: 35,
                        ),
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
                    ],
                  ),
                ),

                Positioned(
                  top: Get.height * 0.35,
                  right: 0,
                  left: 0,
                  child: Container(
                    padding: EdgeInsets.only(left: 15,right: 15),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            InkWell(onTap: () {//Get.to(()=>BuySummary());
                            },
                              child: PoppinsText(
                                text: '${widget.bedrooms} ${widget.title} for sale at ${widget.location}'.toUpperCase(),
                                size: 18,
                                fontWeight: FontWeight.bold,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              )
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 6),
                              width: 42,
                              height: 42,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: InkWell(
                                onTap: () {
                                  Get.to(()=>Detail());
                                },
                                child: Image.asset(
                                  'assets/ellipse.png',
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            roundButton(Icon(Icons.chat_bubble, color: Colors.white,size: 20), maincolor, 'Start Chat', () {}),
                            roundButton(SvgPicture.asset(''), Color(0xFFFF9A03), 'Visit Property', () {Get.to(()=>VisitCharges());}),
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.greenAccent
                              ),
                              child:  InkWell(
                                onTap: () {
                                  adressPopup(context, 'Done', SvgPicture.asset('assets/greenIcon.svg'), () {Navigator.pop(context);}, "Weija", "Eden Heights Resident",);
                                },
                                child: Icon(Icons.location_on_outlined,color: Colors.white),
                              ),
                            ),

                          ],
                        ),
                      ],
                    ),
                  ),
                )

              ],
            ),

            Divider(thickness: 1.5, color: Color(0xFFE9E9EC)),


            Container(
              height: 40,
              width: Get.width,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(width: 1, color: Color(0xFFE9E9EC)),
                  bottom: BorderSide(width: 1, color: Color(0xFFE9E9EC)),
                ),
              ),
              child: TabBar(
                indicatorWeight: 2,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: maincolor,
                labelColor: Color(0xFF0336FF),
                unselectedLabelColor: Color(0xFF2E3034),
                unselectedLabelStyle: TextStyle(
                  fontFamily: "PoppinsMedium",
                  fontSize: 12,
                ),
                labelStyle: TextStyle(
                  fontFamily: "PoppinsMedium",
                  fontSize: 12,
                ),
                tabs: [
                  Tab(
                    text: "Description",
                  ),
                  Tab(
                    text: 'Specifications',
                  ),
                  Tab(
                    text: 'Gallery',
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [

                  Padding(
                    padding: const EdgeInsets.only(left: 25,right: 20,top: 20),
                    child: Text('Lorem ipsum dolor sit amet, consetetur sadipscing\nelitr, sed diam nonumy eirmod tempor invidunt ut\nlabore et dolore magna aliquyam erat, sed diam\nvoluptua. At vero eos et accusam et justo duo.',style: TextStyle(color: Colors.black,fontSize: 16),),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _specItem(8, 'Tap Available'),
                            SizedBox(width: 20),
                            _specItem(1, 'Two Bedrooms'),
                            SizedBox(width: 20),
                            _specItem(3, 'Kitchen Available'),
                            SizedBox(width: 20),
                            _specItem(4, 'AC Available'),

                          ],
                        ),
                        SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _specItem(2, 'AC Available'),
                            SizedBox(width: 20),
                            _specItem(5, 'Two Bedrooms'),
                            SizedBox(width: 20),
                            _specItem(6, 'Quarters Available'),
                            SizedBox(width: 20),
                            _specItem(7, 'Tap Available'),
                          ],
                        )
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    child:  Padding(
                      padding: const EdgeInsets.only(left: 20,right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                              'assets/g1.png',
                              scale: 1.3,
                              width: Get.width * 0.37),
                          SizedBox(width: 15),
                          Column(
                            children: [
                              SizedBox(height: Get.height * 0.036),
                              Image.asset('assets/g2.png', scale: 1.7),
                              SizedBox(height: 10),
                              Image.asset('assets/g3.png', scale: 2.5),
                              SizedBox(height: Get.height * 0.036),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),
            Container(
              height: Get.height * 0.1,
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.white,
                  boxShadow: [BoxShadow(
                    color: Color(0xffF2F6FE).withOpacity(1),
                    spreadRadius: 10,
                    blurRadius: 10,
                    offset: Offset(0, 2),
                  )]
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 24, right: 24),
                child: Row(
                  children: [
                    Text(
                      '${widget.price} GHC',
                      style: TextStyle(
                        fontFamily: "PoppinsBold",
                        fontSize: 24,
                        color: Color(0xFF2E3034),
                      ),
                    ),
                    Text(
                      ' / month',
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: "PoppinsRegular",
                        color: Color(0xFF2E3034),
                      ),
                    ),
                    SizedBox(width: 60),
                    Expanded(
                      child: Container(
                        height: 43,
                        width: 150,
                        decoration: BoxDecoration(
                          color: maincolor,
                          borderRadius: BorderRadius.all(
                            Radius.elliptical(45, 40),
                          ),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return RentDetail();
                              }),
                            );
                          },
                          child: Center(
                            child: Text(
                              '${widget.type} Property',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontFamily: "PoppinsSemiBold",
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget roundButton(Widget icon, Color color, String text, VoidCallback onPressed,) {
  return InkWell(
    onTap: onPressed,
    child: Container(
      width: 123,
      height: 40,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(
          Radius.elliptical(45, 40),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            color: Colors.grey,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          SizedBox(
            width: 6,
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 12,
              fontFamily: "PoppinsSemiBold",
              color: Colors.white,
            ),
          ),
        ],
      ),
    ),
  );
}

const kMenuStyle = TextStyle(color: Color(0xFF9C9C9C), fontSize: 12, fontFamily: "PoppinsRegular",);

Widget _specItem(int n, String text) {
  return Column(
    children: [
      SvgPicture.asset('assets/spec$n.svg'),
      SizedBox(height: 5),
      Container(
        height: 17,
        width: 75,
        decoration: BoxDecoration(
          color: Color(0xFFDEEFF5),
          borderRadius: BorderRadius.all(
            Radius.elliptical(45, 40),
          ),
        ),
        child: Center(child: Text(text, style: TextStyle(color: Color(0xFF0336FF), fontSize: 8, fontFamily: "PoppinsRegular")),),
      ),
    ],
  );
}









Widget buildImage(String image, int index) {
  return Container(
    color: Colors.grey,
    child: Image.asset(
      image,
      fit: BoxFit.cover,
    ),
  );
}

Future dialogBox2(
    context,
    String title,
    String buttonText,
    Widget icon,
    VoidCallback onPressed,
    ) {
  return Future.delayed(
    const Duration(seconds: 0),
        () => showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            30,
          ),
        ),
        title: Container(
          padding: EdgeInsets.only(top: 45),
          child: icon,
        ),
        elevation: 20,
        insetPadding: EdgeInsets.all(0),
        content: Padding(
          padding: EdgeInsets.only(
            top: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: kLargeTextStyle.copyWith(
                    fontFamily: "PoppinsSemiBold", fontSize: 15),
              ),
            ],
          ),
        ),
        actions: [
          SizedBox(
            height: Get.height * 0.02,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 10,
              right: 10,
              bottom: Get.height * 0.04,
            ),
            child: CustomBlueButton(
              height: Get.height * 0.055,
              width: Get.width * 0.6,
              text: buttonText,
              onPressed: onPressed,
              fontSize: 14,
            ),
          ),
          SizedBox(
            height: Get.height * 0.02,
          ),
        ],
      ),
    ),
  );
}

Future adressPopup(
    context,
    String buttonText,
    Widget icon,
    VoidCallback onPressed,
    String city,
    String area,
    ) {
  return Future.delayed(
    const Duration(seconds: 0),
        () => showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            30,
          ),
        ),
        title: Column(
          children: [
            Container(width: 110, height: 110, child: icon),
            Text(
              'Neighborhood',
              style: TextStyle(
                fontSize: 10,
                fontFamily: "PoppinsMedium",
              ),
            ),
            SizedBox(
              height: Get.height * 0.01,
            ),
            Text(
              city,
              style: kLargeTextStyle.copyWith(
                fontFamily: "PoppinsMedium",
                fontSize: 14,
                letterSpacing: 0.5,
              ),
            ),
            SizedBox(
              height: Get.height * 0.015,
            ),
            Text(
              'Address',
              style: TextStyle(
                fontSize: 10,
                fontFamily: "PoppinsMedium",
                color: Color(0xFF2E3034),
              ),
            ),
            SizedBox(
              height: Get.height * 0.01,
            ),
            Text(
              area,
              style: kLargeTextStyle.copyWith(
                fontFamily: "PoppinsMedium",
                fontSize: 14,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
        elevation: 20,
        actions: [
          Padding(
            padding: EdgeInsets.only(
              left: Get.width * 0.01,
              right: Get.width * 0.01,
              bottom: Get.width * 0.015,
            ),
            child: Center(
              child: CustomBlueButton(
                height: Get.height * 0.055,
                width: Get.width * 0.6,
                text: buttonText,
                onPressed: onPressed,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
