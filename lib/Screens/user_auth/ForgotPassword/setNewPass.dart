import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_agent/constants/constants.dart';

import '../../../Utilities/comp_screen.dart';
import '../loginScreen.dart';

class NewPass extends StatefulWidget {
  const NewPass({Key? key}) : super(key: key);

  @override
  State<NewPass> createState() => _NewPassState();
}

class _NewPassState extends State<NewPass> {
  final password = TextEditingController();
  final control = SignUpController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                        image: AssetImage("assets/forgot.png"))),
                child:  Column(
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
                )
              ),
            ),
          ),
          Positioned.fill(
            top: Get.height * 0.48,
            child: Container(
              height: Get.height * 0.7,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 30),
                      Text('Set new password', style: kLargeTextStyle),
                      SizedBox(height: 5),
                      PoppinsText(text: 'Enter the new password you would to use and try login identity', color: hinttext),

                      SizedBox(height: 20),
                      CustomPassField(
                        hintText: "PASSWORD",
                        controller: password,
                        signupController: control,
                        text: "PASSWORD",
                        hintTextColor: hinttext,
                      ),
                      SizedBox(height: 20),
                      CustomPassField(
                        hintText: "PASSWORD",
                        controller: password,
                        signupController: control,
                        text: "CONFIRM PASSWORD",
                        hintTextColor: hinttext,
                      ),
                      SizedBox(height: Get.height * 0.07),
                      CustomBlueButton(
                        width: Get.width,
                        height: Get.height*0.075,
                        text: "Next Step",
                        fontSize: 15,
                        onPressed: () {
                          Get.to(()=>LoginScreen());
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
