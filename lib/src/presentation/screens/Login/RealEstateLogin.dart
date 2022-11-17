import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:twiddle_refactored/src/presentation/components/login/InputTextField.dart';
import '../../../controller/loginController.dart';
import '../../../core/utils/app_colors.dart';
import '../../components/Welcome/panelButtons.dart';
import '../../components/Welcome/welcomeTemplate.dart';
import '../../components/login/radioButton.dart';

class RealEstateLogin extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());

  RealEstateLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
      () => WelcomeTemplate(
        paneltopMargin: 0.35,
        backbuttonVisibility: true,
        child: Padding(
          padding: EdgeInsets.only(left: 4.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 4.h),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Login As Real Estate",
                  style: TextStyle(
                      fontSize: 22.sp,
                      color: AppColors.mainColor,
                      fontFamily: "PoppinsBold"),
                ),
              ),
              SizedBox(height: 2.h),
              Text(
                "EMAIL",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontFamily: "PoppinsBold",
                ),
              ),
              SizedBox(height: 2.h),
              InputTextField(
                hintText: "example@gmail.com",
                prefixVisibility: false,
                fieldController: loginController.emailController.value,
                obscurance: false,
              ),
              SizedBox(height: 2.h),
              Text(
                "PASSWORD",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontFamily: "PoppinsBold",
                ),
              ),
              SizedBox(height: 2.h),
              InputTextField(
                hintText: "Enter Password",
                prefixVisibility: true,
                fieldController: loginController.passwordController.value,
                obscurance: loginController.eyeTap.value,
              ),
              SizedBox(height: 2.h),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.only(right: 7.w),
                  child: Text(
                    "Forgot password?",
                    style:
                        TextStyle(fontSize: 15.sp, color: AppColors.kLightBlue),
                  ),
                ),
              ),
              SizedBox(height: 3.h),
              Center(
                child: Column(
                  children: [
                    PanelButtons(
                      buttonText: loginController.isLoading.value == true
                          ? "Please wait....."
                          : "Login",
                      buttonColor: AppColors.mainColor,
                      textColor: AppColors.mainBg,
                      onTap: () {
                        loginController.isLoading.value == true
                            ? null
                            :
                        FocusScope.of(context).unfocus();
                        FocusScope.of(context).requestFocus(FocusNode());
                        loginController.login();
                        loginController.passwordController.value.clear();
                        loginController.emailController.value.clear();
                        loginController.eyeTap.value=true;
                      },
                      borderColor: AppColors.mainColor,
                    ),
                    SizedBox(height: 1.h),
                    Text(
                      "or",
                      style: TextStyle(
                          fontSize: 15.sp,
                          fontFamily: "PoppinsBold",
                          color: AppColors.kLightGrey),
                    ),
                    SizedBox(height: 1.h),
                    PanelButtons(
                      buttonText: "Create an account",
                      buttonColor: AppColors.kWhite,
                      textColor: AppColors.welcomeTwiddle,
                      onTap: () {},
                      borderColor: Colors.black12,
                    ),
                    SizedBox(height: 2.h),
                    RichText(
                      text: TextSpan(
                          text: "By signing in you agree to our ",
                          style: TextStyle(
                              fontSize: 13.sp, color: AppColors.kLightGrey),
                          children: [
                            TextSpan(
                                text: "Terms of service",
                                style: TextStyle(
                                    fontSize: 13.sp,
                                    color: AppColors.mainColor,
                                    fontFamily: "PoppinsBold"))
                          ]),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
    ;
  }
}
