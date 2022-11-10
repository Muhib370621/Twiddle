import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:state_agent/constants/constants.dart';

import '../../../Utilities/comp_screen.dart';
import '../home_screen/dashboard_screen.dart';

class PaymentSuccess extends StatelessWidget {
  const PaymentSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: maincolor,
      body: Container(
        width: Get.width,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(),
              SvgPicture.asset(
                'assets/success.svg',
              ),
              SizedBox(
                height: Get.height * 0.03,
              ),
              Text(
                'Success!',
                style: TextStyle(
                  fontFamily: "PoppinsBold",
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
              Text(
                'You succesfully made a\npayment!',textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: "PoppinsMedium",
                  color: Colors.white,
                ),
              ),
              Spacer(),
              CustomWhiteButton(
                height: Get.height * 0.07,
                width: Get.width * 0.85,
                text: 'Done',
                onPressed: () {
                 Get.to(()=>Dashboard());
                },
                fontSize: 14,
                color: maincolor,
              ),
              SizedBox(
                height: Get.height * 0.05,
              )
            ]),
      ),
    );
  }
}
