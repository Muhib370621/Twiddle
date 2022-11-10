import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:state_agent/Screens/user_auth/CreateAccount/createAcount.dart';
import 'package:state_agent/constants/constants.dart';

import '../Screens/user_auth/loginScreen.dart';
import 'google_signup_screen.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: Container(
          child: BG(
            child: Column(
              children: [

                Height(size: 40),
                SvgPicture.asset('assets/twiddle/welcome.svg'),
                Height(size: 20,),
                PoppinsText(text: 'Welcome', size: 26, fontWeight: FontWeight.bold),

                Height(size: 40),

                Button(
                  text: 'Log In',
                  onTap: (){
                    Get.to(()=> LoginScreen());
                  },
                ),
                Height(size: 20,),
                Button(
                  borderColor: hinttext,
                  buttonColor: white, color: black,
                  text: 'Create an Account',
                  onTap: (){

                    //read();
                    //print(LoginController.User);
                    //print(User['_id']);
                    Get.to(()=> CreateAccount());
                  },
                ),
                Height(size: 20,),
                Iconbutton(
                  radius: 30,
                  MyIcon: SvgPicture.asset('assets/google.svg'),
                  borderColor: hinttext,
                  buttonColor: white, color: maincolor,
                  text: 'Sign in with Google',
                  onTap: (){
                    Get.to(()=> GoogleSignupScreen());

                    //read();

                  },
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}


class BG extends StatelessWidget {
  Widget? child;
  BG({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            top: 0,
            child: SizedBox(
              width: Get.width,
              height: Get.height * 0.66,
              child: Image.asset("assets/login.png",fit: BoxFit.cover),
            )),
        Positioned.fill(
          top: Get.height * 0.30,
          child: Container(
            height: Get.height * 0.6,
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
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: child,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
