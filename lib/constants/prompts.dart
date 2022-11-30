import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Prompts{

  static Future<void> showDialog({
    required Function() onTap,
    required Function() onCancel,
    required String title,
    required String middleText,
  }) {
    return Get.defaultDialog(
      title: title,
      middleText: middleText.contains("Exception")
          ? middleText.replaceAll("Exception: ", "")
          : middleText,
      backgroundColor: Colors.white,
      titleStyle: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w400,
      ),
      middleTextStyle: const TextStyle(
        color: Colors.black,
      ),
      radius: 20,
    );
  }
}