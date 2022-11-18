import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../controller/loginController.dart';
import '../../../controller/signUpController.dart';
import '../../../core/utils/app_colors.dart';

class InputTextField extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());
  final SignUpController signUpController = Get.put(SignUpController());
  String? hintText;
  bool tapValue;
  bool prefixVisibility;
  TextEditingController? fieldController;
  bool obscurance;

  InputTextField({
    Key? key,
    required this.hintText,
    required this.prefixVisibility,
    required this.fieldController,
    required this.obscurance,
    required this.tapValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        height: 5.5.h,
        width: 90.w,
        decoration: BoxDecoration(
          color: AppColors.kWhite,
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          border: Border.all(color: AppColors.kLightGrey),
        ),
        child: TextFormField(
          controller: fieldController,
          cursorColor: AppColors.mainColor,
          obscureText: obscurance,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              contentPadding: EdgeInsets.only(left: 4.w, top: 1.5.h),
              suffixIcon: Visibility(
                visible: prefixVisibility,
                child: GestureDetector(
                    onTap: () {
                      loginController.eyeTap.value =
                          !loginController.eyeTap.value;
                      signUpController.eyeTap.value =
                          !signUpController.eyeTap.value;
                      signUpController.confirmEyeTap.value =
                          !signUpController.confirmEyeTap.value;
                    },
                    child: loginController.eyeTap.value == true
                        ? Icon(
                            Icons.visibility_off,
                            color: AppColors.kLightGrey,
                          )
                        : Icon(
                            Icons.visibility,
                            color: AppColors.kLightGrey,
                          )),
              )),
        ),
      ),
    );
  }
}
