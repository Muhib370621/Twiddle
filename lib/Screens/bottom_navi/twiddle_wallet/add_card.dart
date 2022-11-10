import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:state_agent/Screens/bottom_navi/twiddle_wallet/twiddle_enterAm.dart';

import '../../../Utilities/comp_screen.dart';

class AddCard extends StatefulWidget {
  const AddCard({Key? key}) : super(key: key);

  @override
  State<AddCard> createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  final creditNumber=TextEditingController();
  final cardName=TextEditingController();
  final creditDate=TextEditingController();
  final creditCvv=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(

        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            Row(
              children: [
                RoundBackButton(),
                SizedBox(width: 10),
                Text("ADD NEW CARD",style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold))
              ],
            ),
            SizedBox(height: 30),
            Text("Card Details",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            CustomEditedCredits(
              width: Get.width,
              height: Get.height*0.075,
              hintText: "0000 0000 0000 0000",
              text: " Card Number",
              controller: creditNumber,
              image: "assets/master.png",

            ),
            SizedBox(height: 20),
            CustomEditCredit(
              width: Get.width,
              height: Get.height*0.075,
              text: " Cardholder Name",
              hintText: "Jon Doe",
              controller: cardName,

            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomEditCredit(
                  width: Get.width*0.43,
                  height: Get.height*0.075,
                  text: " Expire Date",
                  hintText: "00/00",
                  controller: creditDate,

                ),
                CustomEditCredit(
                  width: Get.width*0.43,
                  height: Get.height*0.075,
                  text: " CVV",
                  hintText: "000",
                  controller: creditCvv,

                ),
              ],
            ),
            SizedBox(height: 20),
            Spacer(),
            CustomBlueButton(
              width: Get.width,
              height: Get.height*0.075,
              text: "Continue",
              fontSize: 15,
              onPressed: () {
                Get.to(()=>EnterAmount());
              },
            ),
            SizedBox(height: 20),




          ],
        ),
      ),
    );
  }
}
