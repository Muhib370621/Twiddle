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
  void Function()? onTap;
  bool? IconChange;
  bool havingFlag;

  // bool? flagVisibility;

  InputTextField(
      {Key? key,
      required this.hintText,
      required this.prefixVisibility,
      required this.fieldController,
      required this.obscurance,
      required this.tapValue,
      required this.onTap,
      this.IconChange,
      required this.havingFlag})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
          contentPadding: const EdgeInsets.fromLTRB(15, 12, 0, 12),
          suffixIcon: Visibility(
            visible: prefixVisibility,
            child: GestureDetector(
              onTap: onTap,
              child:
                  // loginController.eyeTap.value
                  IconChange == true
                      ? const Icon(
                          Icons.visibility_off,
                          color: AppColors.kLightGrey,
                        )
                      : const Icon(
                          Icons.visibility,
                          color: AppColors.kLightGrey,
                        ),
            ),
          ),
          // prefixIcon: Visibility(
          //   visible: havingFlag,
          //   child: Row(
          //     children: [
          //       GestureDetector(
          //           onTap: () {
          //             showCountryPicker(
          //               context: context,
          //               //Optional.  Can be used to exclude(remove) one ore more country from the countries list (optional).
          //               exclude: <String>['KN', 'MF'],
          //               //Optional. Shows phone code before the country name.
          //               showPhoneCode: true,
          //               onSelect: (Country country) {
          //                 // print('Select country: ${country.displayName}');
          //               },
          //             );
          //           },
          //           child: Image.asset(
          //             AppAssets.ghanianFlag,
          //             height: 2.h,
          //             width: 10.w,
          //           )),
          //       VerticalDivider(
          //         width: 2.w,
          //         color: AppColors.kLightGrey,
          //       ),
          //
          //     ],
          //   ),
          // ),
        ),
      ),
    );
  }
}
