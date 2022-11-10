import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:state_agent/constants/constants.dart';
import 'package:state_agent/service_provider/bottom_navigation/dashboard/sp_dashboard.dart';

class SPConfirmation extends StatelessWidget {
  const SPConfirmation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height, width: Get.width,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [

            Height(size: 40),
            PoppinsText(text: 'Well Done!', size: 18, fontWeight: FontWeight.w500),
            Height(),
            PoppinsText(text: 'Your profile is now being reviewed. You can expect it to finish in the next 24 hours.',
              size: 14,
              textAlign: TextAlign.center,
            ),
            

            Expanded(child: SvgPicture.asset('assets/sp/running.svg')),
            
            Button(
              text: 'Done', width: 200, height: 55, radius: 20,
              onTap: (){
                Get.to(()=> SPDashboard());
              },
            ),

            Height(size: 40,),

            MyContainer(
              width: 150, color: hinttext.withOpacity(0.5),
              height: 4, radius: 20,
            ),

            Height()


          ],
        ),
      ),
    );
  }
}
