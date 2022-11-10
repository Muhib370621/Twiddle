import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_agent/constants/constants.dart';

import '../../../Screens/bottom_navi/home_screen/product_info.dart';
import '../../../Utilities/comp_screen.dart';



class RecentlyViewed extends StatefulWidget {
  const RecentlyViewed({Key? key}) : super(key: key);

  @override
  State<RecentlyViewed> createState() => _RecentlyViewedState();
}

class _RecentlyViewedState extends State<RecentlyViewed> {
  bool outline = true;
  bool outline2 = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 20,right: 20),
        child: Column(
          children: [
            SizedBox(height: 40),
            Row(
              children: [
                RoundBackButton(),
                SizedBox(width: 15),
                Text('RECENTLY VIEWED', style: kLargeTextStyle.copyWith(fontFamily: "PoppinsSemiBold", fontSize: 18,),
                ),
              ],
            ),
            SizedBox(height: Get.height * 0.04),
            SingleChildScrollView(
              child: Column(
                children: [
                 InkWell(
                   onTap: (){
                     Get.to(()=>ProductDetails());
                   },
                   child: cardDetails(Image.asset('assets/card0.png', fit: BoxFit.cover,), "GHC 150", "Oyarfia", Color(0xFFFF9A03), () {setState(() {outline = !outline;});}, Icon(outline ? Icons.bookmark_outline : Icons.bookmark, color: maincolor, size: 20,), "Rent"),

                 ),

                  SizedBox(height: Get.height * 0.025),
                  InkWell(
                    onTap: (){
                      Get.to(()=>ProductDetails());
                    },
                    child:   cardDetails(Image.asset(
                      'assets/card1.png',
                      fit: BoxFit.cover,
                    ), "GHC 150", "Oyarfia", maincolor, () {setState(() {outline2 = !outline2;});}, Icon(outline2 ? Icons.bookmark_outline : Icons.bookmark, color: maincolor, size: 20,), "Sale",),

                  )


                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget cardDetails(Widget image, String price, String city, Color categoryColor, VoidCallback onPressed, Widget icon, String category) {

  return Stack(
    children: [
      Container(
        width: Get.width,
        height: Get.height * 0.375,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade500,
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 1,
            color: Colors.grey.shade300,
          ),
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
                  topRight: Radius.circular(8),
                  topLeft: Radius.circular(8),
                ),
                child: image,
              ),
            ),
          ],
        ),
      ),
      Positioned(
        top: Get.height * 0.20,
        left: Get.width * 0.05,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Get.height * 0.02,
            ),
            Row(
              children: [
                Text(
                  '3 BEDROOM TOWNHOUSE FOR SALE \nAT OYARIFA',
                  style: TextStyle(
                    fontFamily: "PoppinsSemiBold",
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: Get.height * 0.01,
            ),
            Row(
              children: [
                Text(
                  price,
                  style: TextStyle(
                    fontFamily: "PoppinsBold",
                    fontSize: 18,
                  ),
                ),
                Text(
                  ' / month',
                  style: TextStyle(
                    fontSize: 10,
                    fontFamily: "PoppinsMedium",
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
                  city,
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: "PoppinsMedium",
                    color: Color(0xFF8F92A1),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      Positioned(
        top: Get.height * 0.18,
        left: Get.width * 0.04,
        child: Container(
          width: 60,
          height: 18,
          decoration: BoxDecoration(
              color: categoryColor,
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
              category,
              style: TextStyle(
                fontSize: 10,
                fontFamily: "PoppinsRegular",
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      Container(
        margin:
            EdgeInsets.only(left: Get.width * 0.74, top: Get.height * 0.015),
        width: 30,
        height: 30,
        decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                blurRadius: 2,
                color: Colors.grey,
              )
            ]),
        child: InkWell(
          child: icon,
          onTap: onPressed,
        ),
      ),
    ],
  );
}
