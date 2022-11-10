import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:state_agent/constants/constants.dart';

import '../../../Utilities/comp_screen.dart';
import '../../../bottom_navigation/dashboard/invest/pay_now.dart';
import '../../../reviews_page.dart';
import 'service_details.dart';

class SummaryService extends StatefulWidget {
  SummaryService({Key? key}) : super(key: key);

  @override
  State<SummaryService> createState() => _SummaryServiceState();
}

class _SummaryServiceState extends State<SummaryService> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 15,right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SizedBox(height: 40),
            Row(
              children: [
                RoundBackButton(),
                SizedBox(width: 10),
                PoppinsText(text: 'SUMMARY', fontWeight: FontWeight.bold)
              ],
            ),

            SizedBox(height: 30),
            MyContainer(
              verticalPadding: 10, horizontalPadding: 15,
              shadowColor: maincolor.withOpacity(0.15),
              radius: 20, color: white,
              child: Row(
                children: [
                  SpDp(),

                  Width(size: 10),
                  Expanded(
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PoppinsText(text: sp['name'], fontWeight: FontWeight.bold,),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            PoppinsText(text: sp['profession'], size: 10, color: orange),
                            PoppinsText(text: 'Ghc ${sp['price']}/hr', size: 14, color: maincolor, fontWeight: FontWeight.w500)
                          ],
                        ),
                        GestureDetector(
                          onTap: (){
                            Get.to(()=> ReviewsPage());
                          },
                          child: Row(
                            children: [
                              Wrap(
                                  children: List.generate(5, (index) =>
                                      Icon(Icons.star, color: star, size: 12.sp))
                              ),
                              Width(),
                              PoppinsText(text: 'reviews', size: 10, color: hinttext)
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),

            SizedBox(height: 30),
            PoppinsText(text: "Schedule for 2 hours", fontWeight: FontWeight.w500, size: 16),
            SizedBox(height: 25),
            PoppinsText(text: "124 GHC", color: maincolor, fontWeight: FontWeight.bold, size: 22,),

            SizedBox(height: 25),
            Text("Fee & Tax Details",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20)),

            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PoppinsText(text: "2 Hours", size: 14, fontWeight: FontWeight.w500,),
                PoppinsText(text: "124 GHC", size: 16, fontWeight: FontWeight.bold,),
              ],
            ),

            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PoppinsText(text: "Service charges", size: 14, fontWeight: FontWeight.w500,),
                PoppinsText(text: "6 GHC", size: 16, fontWeight: FontWeight.bold,),
              ],
            ),
            SizedBox(height: 20),
            Container(width: Get.width,height: 1,color: Colors.black26),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PoppinsText(text: "Total", size: 14, fontWeight: FontWeight.w500),
                PoppinsText(text: "130 GHC", size: 16, fontWeight: FontWeight.bold,),
              ],
            ),

            Spacer(),
            Button(
               text: "Proceed To Pay",
               onTap: () {
                Get.to(()=>InvestScreen(
                  payment: sp['price'],
                ));
              },
            ),
            SizedBox(height: 20),



            
          ],
        ),
      ),
    );
  }
}
