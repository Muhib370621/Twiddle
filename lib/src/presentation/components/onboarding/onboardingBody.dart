import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:twiddle_refactored/src/core/utils/app_colors.dart';

class OnboardBody extends StatelessWidget {
  const OnboardBody({Key? key,
    required this.text1,
    required this.text2,
    required this.image
  }) : super(key: key);


  final String text1;
  final String text2;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          Container(
            height: double.infinity, width: double.infinity,
            // color: Color(0xff0336FF),
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.mainColor,
                      AppColors.darkblue,
                    ])
            ),
            //child: Image.asset("assets/bg.png", fit: BoxFit.cover,),
          ),
          Container(
            height: Get.height, width: Get.width,
            child: Column(
              children: [
                SizedBox(height: 90.h,),

                Image.asset("assets/logo1.png", height: 50.h, width: 165.w),
                SizedBox(height: 64.h,),
                Image.asset(image, height: 300.h, width: 300.h),
                SizedBox(height: 60.h,),
                Column(
                  children: [
                    Text(text1,
                      style: GoogleFonts.quicksand(
                          fontSize: 40.sp,
                          color: Colors.white
                      ),),

                    Text(text2,  style: GoogleFonts.quicksand(
                        fontSize: 40.sp,
                        color: Colors.white
                    ),)
                  ],
                ),
              ],
            ),
          ),
        ]);
  }
}
