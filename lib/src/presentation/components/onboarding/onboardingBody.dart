import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:twiddle_refactored/src/core/utils/app_assets.dart';
import 'package:twiddle_refactored/src/core/utils/app_colors.dart';
import 'package:twiddle_refactored/src/presentation/screens/welcome/welcomeScreen.dart';

import '../../../controller/onBoardingController.dart';
import 'dotIndicator.dart';

class OnboardBody extends StatelessWidget {
  final OnboardingController onboardController = Get.put(OnboardingController());
   OnboardBody({Key? key,
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
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.mainColor,
                      AppColors.darkblue,
                    ])
            ),
            child: SvgPicture.asset(AppAssets.obBoardBgSvg, fit: BoxFit.fill,),
          ),
          Obx(() => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 5.h,),
                Image.asset(AppAssets.iconWithText),
                SizedBox(height: 3.h,),
                Image.asset(image, height: 35.h, width: 35.h),
                Column(
                  children: [
                    Text(text1,
                      style: GoogleFonts.quicksand(
                          fontWeight: FontWeight.bold,
                          fontSize: 26.sp,
                          color: Colors.white
                      ),),
                    Text(text2,  style: GoogleFonts.quicksand(
                        fontWeight: FontWeight.bold,
                        fontSize: 26.sp,
                        color: Colors.white
                    ),)
                  ],
                ),
                SizedBox(height: 15.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // SizedBox(width: 1.w,),
                    InkWell(
                      onTap: (){
                        Get.off(()=>Welcome());
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 2.w),
                        height: 3.5.h, width: 15.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2.w),
                            color: AppColors.mainBg
                        ),
                        child: Center(
                            child: Text("Skip",
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontFamily: "Poppins, Regular"
                              ),)),
                      ),
                    ),
                    Row(children:
                    List.generate(onboardController.pages.length, (index) =>
                        Padding(padding: const EdgeInsets.only(right: 4),
                            child: DotIndicator(
                                isActive: index == onboardController.selectedIndex.value
                            ))
                    )
                      ,),
                    InkWell(
                      onTap: (){
                        if(onboardController.selectedIndex.value <= 1){
                          onboardController.pageController.value.nextPage(
                              duration: const Duration(milliseconds: 500), curve: Curves.ease);
                        }
                          else {
                          Get.to(()=>Welcome());
                        }
                      },
                      child: Container(
                        height: 10.h, width: 15.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.w),
                        ),
                        child: Center(
                            child: Row(
                              children: [
                                Text("Next",
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontFamily: "Poppins, Regular",
                                      color: Colors.white
                                  ),),
                                Icon(Icons.arrow_circle_right_outlined, size: 15.sp, color: Colors.white,)
                              ],
                            )),
                      ),
                    ),

                  ],
                ),


              ],
            ),
          ),),


        ]);
  }
}
