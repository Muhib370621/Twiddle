import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_agent/constants/constants.dart';

import '../../../Utilities/comp_screen.dart';
import '../../bottom_navi/home_screen/dashboard_screen.dart';

class RegPin extends StatefulWidget {
  const RegPin({Key? key}) : super(key: key);
  @override
  State<RegPin> createState() => _RegPinState();
}

class _RegPinState extends State<RegPin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Positioned(
              top: 0,
              child: SizedBox(
                width: Get.width,
                height: Get.height * 0.62,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        "assets/reg.png",
                      ),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 40),
                      Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Container(
                          width: Get.width*0.08,
                          height: Get.height*0.05,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(Icons.arrow_back_ios_rounded, color: Colors.black, size: 20,),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )))),
          Positioned.fill(
            top: Get.height * 0.48,
            child: Container(
              height: Get.height * 0.7,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 25,right: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 30),
                      Text('Enter the pin code', style: kLargeTextStyle),
                      SizedBox(height: 5),
                      PoppinsText(text: 'Enter the pin code you received by text msg', color: hinttext),
                      SizedBox(height: 40),
                      Form(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Otp(),
                            Otp(),
                            Otp(),
                            Otp(),
                            Otp(),
                          ],
                        ),
                      ),
                      SizedBox(height: Get.height * 0.09),

                      CustomBlueButton(
                        width: Get.width,
                        height: Get.height*0.075,
                        text: "Next Step",
                        fontSize: 15,
                        onPressed: () {
                          Get.to(()=>Dashboard());
                        },

                      ),
                      SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
