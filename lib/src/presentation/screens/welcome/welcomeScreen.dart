import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:twiddle_refactored/src/core/utils/app_assets.dart';
import 'package:twiddle_refactored/src/core/utils/app_colors.dart';

import '../../components/Welcome/welcomeTemplate.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: WelcomeTemplate(
          child: Column(
            children: [
              SizedBox(height: 5.h),
              SvgPicture.asset(AppAssets.welPanelIcon),
              SizedBox(height: 2.h),
              Text(
                "Welcome to Twiddle",
                style:
                    TextStyle(fontSize: 18.sp, color: AppColors.welcomeTwiddle),
              ),
              // PoppinsText(text: 'Welcome', size: 26, fontWeight: FontWeight.bold),
              // SizedBox(height:10.h),
              // Button(
              //   text: 'Log In',
              //   onTap: (){
              //     Get.to(()=> LoginScreen());
              //   },
              // ),
              SizedBox(height: 5.h),

              // Button(
              //   borderColor: hinttext,
              //   buttonColor: white, color: black,
              //   text: 'Create an Account',
              //   onTap: (){
              //     //read();
              //     //print(LoginController.User);
              //     //print(User['_id']);
              //     Get.to(()=> CreateAccount());
              //   },
              // ),
              // Height(size: 20,),
              // Iconbutton(
              //   radius: 30,
              //   MyIcon: SvgPicture.asset('assets/google.svg'),
              //   borderColor: hinttext,
              //   buttonColor: white, color: maincolor,
              //   text: 'Sign in with Google',
              //   onTap: (){
              //     Get.to(()=> GoogleSignupScreen());
              //
              //     //read();

              // },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
