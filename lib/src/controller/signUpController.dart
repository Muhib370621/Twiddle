import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController{
  RxBool isLoading = false.obs;
  RxBool eyeTap = true.obs;
  RxBool confirmEyeTap = true.obs;
  RxBool isSignUp = false.obs;
  Rx<TextEditingController> firstNameController = TextEditingController().obs;
  Rx<TextEditingController> lastNameController = TextEditingController().obs;
  Rx<TextEditingController> phoneNOController = TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;
  Rx<TextEditingController> confirmPasswordController = TextEditingController().obs;

}