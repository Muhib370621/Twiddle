import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:state_agent/constants/constants.dart';

import '../../../Utilities/comp_screen.dart';
import 'hired_service.dart';


class PaySuccessScreen extends StatelessWidget {
  const PaySuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: maincolor,
      body: Column(
          children: [
            Spacer(),
            Center(child: SvgPicture.asset('assets/success.svg')),
            SizedBox(height: Get.height * 0.03),
            Text('Succes!', style: TextStyle(fontFamily: "PoppinsBold", fontSize: 30, color: Colors.white,),),
            Text('You succesfully made a\npayment!',textAlign: TextAlign.center, style: TextStyle(fontSize: 14, fontFamily: "PoppinsMedium", color: Colors.white,),),
            Spacer(),
            CustomWhiteButton(
              height: Get.height * 0.07,
              width: Get.width * 0.85,
              text: 'Go To Hired',
              onPressed: () {Get.to(()=>HiredService());},
              fontSize: 14,
              color: maincolor,
            ),
            SizedBox(height: Get.height * 0.05)
          ]),
    );
  }
}
