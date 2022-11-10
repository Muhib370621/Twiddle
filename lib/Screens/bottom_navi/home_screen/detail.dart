import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:state_agent/Utilities/dialogueBox.dart';
import 'package:state_agent/constants/constants.dart';

import '../../../Utilities/comp_screen.dart';
import '../../../bottom_navigation/home/filters.dart';



class Detail extends StatefulWidget {
  const Detail({Key? key}) : super(key: key);

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(left: 15,right: 15),
        child: Column(
          children: [
            SizedBox(height: 30),
            Row(
              children: [
                RoundBackButton(),
                SizedBox(width: 20),
                Text(
                  'Details',
                  style: kLargeTextStyle.copyWith(
                    fontFamily: "PoppinsSemiBold",
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            SizedBox(height: Get.height * 0.02),
            Row(
              children: [
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                  child: Image.asset(
                    'assets/avatar.png',
                  ),
                ),
                SizedBox(width: Get.width * 0.022),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Jack Nicolson',
                      style: TextStyle(
                        fontFamily: "PoppinsSemiBold",
                        fontSize: 13,
                        color: Color(0xFF2E3034),
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.security_rounded,
                          color: maincolor,
                          size: 13,
                        ),
                        SizedBox(width: 3),
                        Text(
                          'Real Estate Agent',
                          style: TextStyle(
                            fontFamily: "PoppinsRegular",
                            fontSize: 11,
                            color: Color(0xFF2E3034),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.mail_outline, color: Color(0xFF8F92A1), size: 13),
                        SizedBox(width: 3,),
                        Text(
                          'rachel.porter@mail.com',
                          style: TextStyle(
                            fontFamily: "PoppinsSemiBold",
                            fontSize: 11,
                            color: Color(0xFF8F92A1),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  children: [
                    _longButton(maincolor, 'Chat', Image.asset('assets/chatBubble.png', scale: 3), Color(0xFFA9D6E9),),
                    SizedBox(height: Get.height * 0.01),
                    InkWell(
                      onTap: () {dialogBox(
                          context,
                          '+233-575-559-628',
                          'Cancel',
                          "Call",
                          SvgPicture.asset(
                            'assets/call2.svg',
                          ),
                        () {} ,
                        );
                      },
                      child: _longButton(
                        Color(0xFF9A03FF),
                        'Call',
                        Image.asset(
                          'assets/call.png',
                          scale: 3,
                        ),
                        Color(0xFFDFA8E9),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 15),
            Text('I am a Jack and I have 6 apartments for rent short and long term, I invite tenants who appreciate the convenience of use and nice aesthetic interiors', style: kInfoTextStyle),
            SizedBox(height: Get.height * 0.01),
            Container(
              height: 50,
              width: Get.width * 0.85,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Property Listings (12)',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: "PoppinsSemiBold",
                    ),
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: maincolor,
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 0.3),
                            blurRadius: 0.1,
                            spreadRadius: 0.1,
                          )]

                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          Get.to(()=>FilterScreen());
                        },
                        child: SvgPicture.asset(
                          'assets/filter.svg',
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 5),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: Column(
                    children: [
                      SizedBox(height: Get.height * 0.017),
                      InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: _card(Image.asset(
                          'assets/card0.png',
                          fit: BoxFit.cover,
                        ), '150 GH₵', 'TSE ADDO', 3, 2, 3),

                      ),

                      SizedBox(height: Get.height * 0.023),
                      InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child:  _card(Image.asset('assets/card2.png', fit: BoxFit.cover,),'150 GH₵', 'TSE ADDO', 4, 2, 1,),

                      ),
                      SizedBox(height: Get.height * 0.023),





                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget _longButton(Color color, String text, Widget icon, Color shadowColor) {
  return Container(
    width: Get.width * 0.21,
    height: Get.height * 0.042,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.all(
        Radius.elliptical(35, 40),
      ),
      boxShadow: [
        BoxShadow(
          blurRadius: 4,
          color: shadowColor,
        ),
      ],
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        icon,
        SizedBox(
          width: 7,
        ),
        Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontFamily: "PoppinsMedium",
            fontSize: 10,
          ),
        ),
      ],
    ),
  );
}

Widget _card(Widget image, String price, String city, int bed, int bath, int parking) {
  return Stack(
    children: [
      Container(
        width: Get.width * 0.92,
        height: Get.height * 0.35,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
              blurRadius: 2,
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
                width: Get.width,
                height: Get.height * 0.19,
                //decoration:
                //  BoxDecoration(borderRadius: BorderRadius.circular(12)),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(7),
                    topLeft: Radius.circular(7),
                  ),
                  child: image,
                )),
          ],
        ),
      ),
      Positioned(
        top: Get.height * 0.20,
        left: Get.height * 0.015,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  '150 GHC',
                  style: TextStyle(
                    fontFamily: "PoppinsMedium",
                    fontSize: 20,
                  ),
                ),
                Text(
                  ' / night',
                  style: TextStyle(
                    fontSize: 10,
                    fontFamily: "PoppinsMedium",
                  ),
                ),
                SizedBox(
                  width: Get.width * 0.32,
                ),
                Icon(
                  Icons.star_rounded,
                  color: Color(0xFFFFDE03),
                  size: 17,
                ),
                SizedBox(
                  width: 3,
                ),
                Text(
                  '4.9 (182)',
                  style: TextStyle(
                    color: Colors.black38,
                    fontFamily: "PoppinsMedium",
                    fontSize: 10,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  size: 13,
                  color: Color(0xFF8F92A1),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'TSE ADDO',
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: "PoppinsMedium",
                    color: Color(0xFF8F92A1),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            Row(
              children: [
                SizedBox(
                  width: Get.width * 0.06,
                ),
                SvgPicture.asset('assets/bed.svg'),
                SizedBox(
                  width: Get.width * 0.03,
                ),
                Text(
                  '3 Bed',
                  style: TextStyle(
                    fontFamily: "PoppinsMedium",
                    fontSize: 11,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(
                  width: Get.width * 0.06,
                ),
                SvgPicture.asset('assets/bath.svg'),
                SizedBox(
                  width: Get.width * 0.03,
                ),
                Text(
                  '3 Bath',
                  style: TextStyle(
                    fontFamily: "PoppinsMedium",
                    fontSize: 11,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(
                  width: Get.width * 0.06,
                ),
                SvgPicture.asset('assets/car.svg'),
                SizedBox(
                  width: Get.width * 0.03,
                ),
                Text(
                  '3 Parking',
                  style: TextStyle(
                    fontFamily: "PoppinsMedium",
                    fontSize: 11,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      Positioned(
        top: Get.height * 0.148,
        left: Get.width * 0.75,
        child: Container(
          width: 23,
          height: 23,
          decoration: BoxDecoration(
            color: maincolor,
            shape: BoxShape.circle,
          ),
          child: Icon(
            FontAwesomeIcons.solidPenToSquare,
            color: Colors.white,
            size: 13,
          ),
        ),
      ),
      Positioned(
        left: Get.width * 0.76,
        top: Get.height * 0.015,
        child: SvgPicture.asset('assets/bookmark.svg'),
      ),
      Positioned(
        top: Get.height * 0.15,
        left: Get.width * 0.04,
        child: Container(
          width: 60,
          height: 18,
          decoration: BoxDecoration(
              color: Color(0xFFD9B646).withOpacity(0.7),
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
              'Rent',
              style: TextStyle(
                fontSize: 10,
                fontFamily: "PoppinsRegular",
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
