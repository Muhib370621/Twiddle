import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:twiddle_refactored/src/model/signUpModel.dart';

import '../core/error/prompts.dart';
import '../core/utils/app_colors.dart';
import '../presentation/screens/Login/AccountSelection.dart';
import '../services/authenticationServices.dart';

class SignUpController extends GetxController {

  RxBool isLoading = false.obs;
  RxBool eyeTap = true.obs;
  RxBool confirmEyeTap = true.obs;
  RxBool isSignUp = false.obs;
  Rx<TextEditingController> firstNameController = TextEditingController().obs;
  Rx<TextEditingController> lastNameController = TextEditingController().obs;
  Rx<TextEditingController> phoneNOController = TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;
  Rx<TextEditingController> confirmPasswordController =
      TextEditingController().obs;
  // File? imageFile = File.obs;

  Future<SignUpModel?> SignUp(File? avatarFile) async {
    try {
      if (emailController.value.text[0] == '0') {
        await Prompts.showDialog(
          onTap: () {},
          onCancel: () {},
          title: "Whoops!",
          middleText: "Phone number should start with '3'",
        );
      } else if (emailController.value.text == '') {
        await Prompts.showDialog(
          onTap: () {},
          onCancel: () {},
          title: "Oh! you missed!",
          middleText: "Please enter your email",
        );
      } else if (passwordController.value.text == '') {
        await Prompts.showDialog(
          onTap: () {},
          onCancel: () {},
          title: "Oh! you missed!",
          middleText: 'Please Enter Password',
        );
      } else {
        isLoading.value = true;
        var result = await AuthenticationServices().signUp(
          // img: avatarFile,
          email: emailController.value.text,
          pass: passwordController.value.text,
          firstName: firstNameController.value.text,
          lastName: lastNameController.value.text,
          phoneNo: phoneNOController.value.text,
          confirmPass: confirmPasswordController.value.text,
        );
        // print(result);
        isLoading.value = false;
        await Get.bottomSheet(Container(
          height: 10.h,
          color: AppColors.mainBg,
          child: Center(
              child: Text(
            "Successfully Signed Up!!\n Now Sign In",
            style: TextStyle(fontSize: 18.sp),
          )),
        ));
        await Get.to(() => AccountSelection());
        isSignUp.value = false;
        isLoading.value = false;
      }
    } on Error catch (e) {
      isLoading.value = false;
      await Get.bottomSheet(Container(
        height: 10.h,
        color: AppColors.mainBg,
        child: Center(
            child: Text(
          "Successfully Signed Up!!\n Now Sign In",
          style: TextStyle(fontSize: 18.sp),
        )),
      ));
      isSignUp.value = false;
      await Get.to(() => AccountSelection());
    } on SocketException catch (e) {
      isLoading.value = false;
      await Prompts.showDialog(
        onTap: () {},
        onCancel: () {},
        title: "Whoops!",
        middleText: "It Seems like you are not connected to the internet.",
      );
    } on FormatException catch (e) {
      isLoading.value = false;
      await Prompts.showDialog(
        onTap: () {},
        onCancel: () {},
        title: "Whoops!",
        middleText: "Something went wrong!\nPlease try again later.",
      );
    } on Exception catch (e) {
      isLoading.value = false;
      await Prompts.showDialog(
        onTap: () {},
        onCancel: () {},
        title: "Whoops!",
        middleText: "$e",
      );
    }
  }


}
