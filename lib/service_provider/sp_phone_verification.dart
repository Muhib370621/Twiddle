import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:state_agent/constants/constants.dart';
import 'package:state_agent/service_provider/phone_verify.dart';

class PhoneVerification extends StatefulWidget {
  String? number;
  PhoneVerification({Key? key, this.number}) : super(key: key);

  @override
  State<PhoneVerification> createState() => _PhoneVerificationState();
}

String? otp;
class _PhoneVerificationState extends State<PhoneVerification> {

  final otp1 = TextEditingController();
  final otp2 = TextEditingController();
  final otp3 = TextEditingController();
  final otp4 = TextEditingController();
  final otp5 = TextEditingController();
  final otp6 = TextEditingController();
  final phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height, width: Get.width,
        child: Stack(
          children: [

            MyContainer(
              width: Get.width, height: 479,
              child: Image.asset('assets/sp/sp_bg.png', fit: BoxFit.fill,)
            ),

            Positioned.fill(
              top: Get.height/(812/439),
              child: MyContainer(
                horizontalPadding: 20.w, radius: 20,
                child: SingleChildScrollView(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Height(size: 40,),
                      PoppinsText(text: 'Enter the pin code', size: 18, fontWeight: FontWeight.bold,),
                      Height(),
                      PoppinsText(text: 'Enter the pin code you received by text message.', color: hinttext),

                      Height(size: 20),

                      Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [

                          OtpField(controller: otp1),
                          OtpField(controller: otp2),
                          OtpField(controller: otp3),
                          OtpField(controller: otp4),
                          OtpField(controller: otp5),
                          OtpField(controller: otp6),

                        ],
                      ),

                    ],
                  ),
                ),
              )
            ),

            Positioned(
              bottom: 20.h, width: Get.width,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Button(
                    height: 45,
                    text: 'Continue',
                  onTap: (){
                      setState((){
                        otp = '${otp1.text}${otp2.text}${otp3.text}${otp4.text}${otp5.text}${otp6.text}';
                      });
                      verifyCode(otp!);
                  },
                ),
              ),
            )


          ],
        ),
      ),
    );
  }
}

class OtpField extends StatelessWidget {
  TextEditingController? controller;
  OtpField({Key? key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.all(
            Radius.elliptical(50, 40)
        ),
        border: Border.all(color: hinttext, width: 1),
      ),
      height: 50.h,
      width: 40.h,
      child: Center(
        child: TextField(
          controller: controller,
          autofocus: true,
          onChanged: (value) {
            if (value.length == 1 && FocusScope.of(context).nextFocus() == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.length == 0 && FocusScope.of(context).previousFocus() == false) {
              FocusScope.of(context).previousFocus();
            }
          },
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
            FilteringTextInputFormatter.digitsOnly,
          ],
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          style: TextStyle(),
          decoration: InputDecoration(
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}

