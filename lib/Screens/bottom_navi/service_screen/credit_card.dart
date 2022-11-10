import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_agent/Screens/bottom_navi/service_screen/succes_screen.dart';

import '../../../Utilities/comp_screen.dart';



class CreditCard extends StatefulWidget {
  const CreditCard({Key? key}) : super(key: key);

  @override
  State<CreditCard> createState() => _CreditCardState();
}

class _CreditCardState extends State<CreditCard> {
  final creditNumber=TextEditingController();
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
                Text("PAY WITH CARD",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold))
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
              controller: creditNumber,

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
                  controller: creditNumber,

                ),
                CustomEditCredit(
                  width: Get.width*0.43,
                  height: Get.height*0.075,
                  text: " CVV",
                  hintText: "000",
                  controller: creditNumber,

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
                Get.to(()=>PaySuccessScreen());
                },
            ),
            SizedBox(height: 20),




          ],
        ),
      ),
    );
  }
}
