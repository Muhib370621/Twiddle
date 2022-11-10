import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_agent/Screens/user_auth/ForgotPassword/pincode_screen.dart';

import '../../../Utilities/comp_screen.dart';
import '../../../constants/constants.dart';




class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final emailAdress = TextEditingController();

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
                          image: DecorationImage(fit: BoxFit.cover, image: AssetImage("assets/forgot.png"))),
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
                      ))
                  )
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
                      SizedBox(height: 40),
                      Text('Forgot your password?', style: kLargeTextStyle),
                      SizedBox(height: 5),
                      Text("Enter your email to confirm your \nidentity",style: TextStyle(fontSize: 18,color: Colors.black26)),
                      SizedBox(height: 20),
                      CustomEditedFiled(
                        text: "Email",
                        width: Get.width,
                        height: Get.height*0.075,
                        hintText: "kevin@gmail.com",
                        controller: emailAdress,
                        hintTextColor: hinttext,
                      ),
                      SizedBox(height: Get.height * 0.07),
                      CustomBlueButton(
                        width: Get.width,
                        height: Get.height*0.075,
                        text: "Next Step",
                        onPressed: () {
                          Get.to(()=>PinCodeScreen());
                        },
                        fontSize: 15,
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
