import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:state_agent/Screens/user_auth/loginController.dart';

import '../../../constants/appColors.dart';

class RadioButton extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());

  String? labelText;

  RadioButton(
      {Key? key, required this.labelText,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 39.7.h),
      child: RadioListTile(
        title:  Text(
          labelText!,
          style: TextStyle(wordSpacing: 1),
        ),
        value: "$labelText",
        activeColor: AppColors.mainColor,
        groupValue: loginController.radioValue.value,
        onChanged: (value) {
          // setState(() {
          loginController.radioValue.value = value.toString();
          // });
        },
      ),
    ));

  }
}