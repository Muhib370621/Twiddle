import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_agent/constants/constants.dart';

import '../../../Utilities/comp_screen.dart';
import '../../../bottom_navigation/dashboard/invest/pay_now.dart';
import 'rentDetail3.dart';


class VisitCharges extends StatefulWidget {
  int? visitCharges;
  VisitCharges({Key? key, this.visitCharges}) : super(key: key);

  @override
  State<VisitCharges> createState() => _VisitChargesState();
}

class _VisitChargesState extends State<VisitCharges> {

  var total, twiddleCharges = 20;

  @override
  void initState() {
    getCharges(widget.visitCharges, twiddleCharges);
    super.initState();
  }

  getCharges(var num1, num2){
    setState(() {
      total = num1 +num2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(left: 20,right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            BackButtonText(text: 'PROPERTY VISIT CHARGES'),
            SizedBox(height: Get.height * 0.05),
            PoppinsText(text: "Charges Breakdown", size: 16, color: maincolor),
            SizedBox(height: Get.height * 0.005),
            PoppinsText(text: "Pay Agent/Owner For Property Visiting", size: 10, color: hinttext),
            SizedBox(height: Get.height * 0.02),

            kDivider(),
            SizedBox(height: Get.height * 0.025),
            priceField('Charges Per Visit', 'Ghc ${widget.visitCharges}'),
            SizedBox(height: Get.height * 0.028),
            priceField('Twiddle Charges', 'Ghc $twiddleCharges'),
            SizedBox(height: Get.height * 0.01),
            Divider(color: Color(0xFF707070), thickness: 0.4),
            SizedBox(height: 10),
            Row(
              children: [
                Text(
                  'Total',
                  style: kBlueHeadingStyle.copyWith(
                    fontFamily: "PoppinsBold",
                    fontSize: 18,
                  ),
                ),
                Spacer(),
                Text(
                  'Ghc $total',
                  style: TextStyle(
                    color: Color(0xFF2E3034),
                    fontFamily: "PoppinsMedium",
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            SizedBox(height: Get.height * 0.06),
            CustomBlueButton(
              height: Get.height * 0.07,
              width: Get.width,
              text: "Pay",
              onPressed: () {
                Get.to(()=>InvestScreen(
                  payment: total,
                ));
              },
              fontSize: 13,
            ),
            SizedBox(height: Get.height * 0.04),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Continue To Advance Page If ',
                  style: TextStyle(
                    fontFamily: "PoppinsMedium",
                    fontSize: 12,
                  ),
                ),
                Text(
                  'Deposit Payment Page',
                  style: TextStyle(
                    fontFamily: "PoppinsMedium",
                    fontSize: 12,
                    decoration: TextDecoration.underline,
                    color: Color(0xFF1492E6),
                  ),
                ),

              ],
            ),
            MyContainer(
              horizontalPadding: 30,
              child: PoppinsText(text: 'If You Have Already Visited The Property And Are Interested In Property.', textAlign: TextAlign.center),
            ),
          ],
        ),
      ),
    );
  }
}
