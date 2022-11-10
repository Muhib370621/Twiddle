import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:state_agent/Utilities/comp_screen.dart';

import '../constants/constants.dart';
import 'capture_card.dart';

class SPVerification extends StatelessWidget {
  const SPVerification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: shadowcolor.withOpacity(0.2),
        width: Get.width, height: Get.height,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            Height(size: 40),
            Row(
              children: [
                RoundBackButton(
                  color: transparent,
                  iconColor: black,
                  size: 20,
                ),
                Width(size: 20),
                
                Container(
                    width: Get.width*0.7,
                    child: Center(child: PoppinsText(text: 'Document Verification', size: 18, fontWeight: FontWeight.w700)))

              ],
            ),

            Height(size: 30,),

            MyContainer(
              color: maincolor, shadowColor: maincolor.withOpacity(0.5),
              horizontalMargin: 40,
            ),

            Height(size: 25),

            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.r),
                    topRight: Radius.circular(20.r),
                  )
                ),
                child: Column(
                  children: [

                    Height(size: 25),

                    PoppinsText(text: 'Your document photo helps us prove your identity. It should match the information you have provided in the previous steps.',
                      textAlign: TextAlign.center,
                    ),

                    Height(size: 40,),

                    GestureDetector(
                        onTap: (){
                          Get.to(()=> CaptureFrontCard());
                        },
                        child: MyContainer(
                          height: 60, radius: 50,
                          horizontalPadding: 20,
                          shadowColor: lightButton,
                          child: Row(
                            children: [

                              SvgPicture.asset('assets/sp/doc.svg'),
                              Width(size: 10,),
                              Expanded(
                                  child: PoppinsText(text: 'Ghana National ID', size: 14, fontWeight: FontWeight.w500,)
                              ),
                              Icon(Icons.arrow_forward, color: maincolor),

                            ],
                          ),
                        )
                    ),

                  ],
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
