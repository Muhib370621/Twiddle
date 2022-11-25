import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../controller/signUpController.dart';
import '../../../core/utils/app_colors.dart';
import '../../components/Welcome/panelButtons.dart';
import '../../components/Welcome/welcomeTemplate.dart';
import '../../components/login/InputTextField.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final SignUpController signUpController = Get.put(SignUpController());
  File? imageFile;

  getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
      imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: WelcomeTemplate(
            paneltopMargin: 0.15,
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
                      "SignUp For Real Estate",
                      style: TextStyle(
                          fontSize: 22.sp,
                          color: AppColors.welcomeTwiddle,
                          fontFamily: "PoppinsBold"),
                    ),
                  ),
                  SizedBox(height: 0.5.h),
                  Text(
                    "Respond to the following and and proceed",
                    style: TextStyle(
                      color: AppColors.kLightGrey,
                      fontSize: 16.sp,
                    ),
                  ),
                  SizedBox(height: 0.5.h),
                  GestureDetector(
                    onTap: () {
                      getFromGallery();
                    },
                    child: Container(
                      height: 7.h,
                      width: 15.w,
                      decoration: const BoxDecoration(
                        color: AppColors.lightGrey,
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      child: imageFile == null
                          ? const Icon(
                              Icons.linked_camera_outlined,
                              color: AppColors.kLightGrey,
                            )
                          : Image.file(
                              imageFile!,
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                  SizedBox(height: 1.h),
                  Text(
                    "Select a presentable photo for yourself this is very important ",
                    style: TextStyle(
                      color: AppColors.kLightGrey,
                      fontSize: 15.sp,
                    ),
                  ),
                  SizedBox(height: 3.h),
                  Text(
                    "FIRST NAME",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: "PoppinsBold",
                    ),
                  ),
                  SizedBox(height: 2.h),
                  InputTextField(
                    hintText: "Margaret",
                    prefixVisibility: false,
                    fieldController: signUpController.firstNameController.value,
                    obscurance: false,
                    tapValue: false,
                    onTap: () {}, havingFlag: false,
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    "LASTNAME",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: "PoppinsBold",
                    ),
                  ),
                  SizedBox(height: 2.h),
                  InputTextField(
                    hintText: "Novakowska",
                    prefixVisibility: false,
                    fieldController: signUpController.lastNameController.value,
                    obscurance: false,
                    tapValue: false,
                    onTap: () {}, havingFlag: false,
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    "PHONE NUMBER",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: "PoppinsBold",
                    ),
                  ),
                  SizedBox(height: 2.h),
                  InputTextField(
                    havingFlag: true,
                    hintText: "+233 ___ ___ ____",
                    prefixVisibility: false,
                    fieldController: signUpController.phoneNOController.value,
                    obscurance: false,
                    tapValue: false,
                    onTap: () {},
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    "EMAIL ADDRESS",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: "PoppinsBold",
                    ),
                  ),
                  SizedBox(height: 2.h),
                  InputTextField(
                    hintText: "example@gmail.com",
                    prefixVisibility: false,
                    fieldController: signUpController.emailController.value,
                    obscurance: false,
                    tapValue: false,
                    onTap: () {}, havingFlag: false,
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    "CREATE NEW PASSWORD",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: "PoppinsBold",
                    ),
                  ),
                  SizedBox(height: 2.h),
                  InputTextField(
                    hintText: "Enter password",
                    prefixVisibility: true,
                    fieldController: signUpController.passwordController.value,
                    obscurance: signUpController.eyeTap.value,
                    tapValue: signUpController.eyeTap.value,
                    onTap: () {
                      signUpController.eyeTap.value =
                          !signUpController.eyeTap.value;
                    },
                    IconChange: signUpController.eyeTap.value, havingFlag: false,
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    "CONFIRM PASSWORD",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: "PoppinsBold",
                    ),
                  ),
                  SizedBox(height: 2.h),
                  InputTextField(
                    hintText: "Confirm password",
                    prefixVisibility: true,
                    fieldController:
                        signUpController.confirmPasswordController.value,
                    obscurance: signUpController.confirmEyeTap.value,
                    tapValue: signUpController.confirmEyeTap.value,
                    onTap: () {
                      signUpController.confirmEyeTap.value =
                          !signUpController.confirmEyeTap.value;
                    },
                    IconChange: signUpController.confirmEyeTap.value, havingFlag: false,
                  ),
                  SizedBox(height: 3.h),
                  Center(
                    child: Column(
                      children: [
                        PanelButtons(
                          buttonText: signUpController.isLoading.value == true
                              ? "Please wait....."
                              : "Sign Up",
                          buttonColor: AppColors.mainColor,
                          textColor: AppColors.mainBg,
                          onTap: () {
                            signUpController.isLoading.value == true
                                ? null
                                : FocusScope.of(context).unfocus();
                            FocusScope.of(context).requestFocus(FocusNode());
                            signUpController.SignUp(imageFile);
                            signUpController.passwordController.value.clear();
                            signUpController.emailController.value.clear();
                            signUpController.eyeTap.value = true;
                          },
                          borderColor: AppColors.mainColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
