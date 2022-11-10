import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'constants.dart';

class SuccessScreen extends StatelessWidget {
  String text; VoidCallback? onTap; String? buttonText;
  SuccessScreen({
    Key? key,
    required this.text, this.onTap, this.buttonText
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: maincolor,
      body: Column(
          children: [
            Spacer(),
            Center(child: SvgPicture.asset('assets/success.svg')),
            SizedBox(height: Get.height * 0.03),
            PoppinsText(text: 'Success!', size: 30, fontWeight: FontWeight.bold, color: white),
            PoppinsText(text: text, size: 14, fontWeight: FontWeight.w500, color: white),
            Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Button(
                text: buttonText!,
                onTap: onTap,
                color: maincolor,
                buttonColor: white,
              ),
            ),
            SizedBox(height: Get.height * 0.05)
          ]),
    );
  }
}
