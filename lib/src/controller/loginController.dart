import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:twiddle_refactored/src/core/utils/app_colors.dart';
import 'package:twiddle_refactored/src/presentation/screens/welcome/welcomeScreen.dart';

import '../core/error/prompts.dart';
import '../model/LoginModel.dart';
import '../presentation/components/RealEstateDashboard/BottomNavigationBar.dart';
import '../services/authenticationServices.dart';

class LoginController extends GetxController {
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;
  RxString radioValue = "".obs;
  RxBool isLoading = false.obs;
  RxBool eyeTap = true.obs;

  @override
  void onInit() {
    emailController.value.clear();
    passwordController.value.clear();
    // TODO: implement onInit
    super.onInit();
  }
  @override
  void onClose() {
    emailController.value.clear();
    passwordController.value.clear();
    // TODO: implement onInit
    super.onClose();
  }



  Future<LoginModel?> login() async {
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
        var result = await AuthenticationServices().login(
            email: emailController.value.text,
            pass: passwordController.value.text);
        isLoading.value = false;
        if (result.token != " ") {
          // await Get.bottomSheet(Container(height: 10.h,color: AppColors.mainBg,child: Center(child: Text("Sucessfully Logged In !!", style: TextStyle(fontSize: 18.sp),)),));
          await Get.to(() => BottomNav());

        } else {
          isLoading.value = false;
          await Prompts.showDialog(
            onTap: () {},
            onCancel: () {},
            title: "Whoops!",
            middleText: "It seems like something went wrong!",
          );
        }
      }
    } on Error catch (e) {
      isLoading.value = false;
      await Prompts.showDialog(
        onTap: () {},
        onCancel: () {},
        title: "Whoops!",
        middleText: "Failed to authenticate \nPlease try again",
      );
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
