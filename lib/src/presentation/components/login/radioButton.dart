import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../controller/loginController.dart';
import '../../../core/utils/app_colors.dart';

class RadioButton extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());

  String? labelText;

  RadioButton(
      {Key? key, required this.labelText,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 4.7.h),
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
