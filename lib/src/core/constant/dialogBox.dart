import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/app_colors.dart';

Future dialogBox(
    context,
    String title,
    String text1,
    String text2,
    Widget icon,
    VoidCallback onTap
    ) {
  return Future.delayed(
    const Duration(seconds: 0),
        () => showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            30,
          ),
        ),
        title: Container(
          padding: EdgeInsets.only(top: 45),
          child: icon,
        ),
        elevation: 20,
        insetPadding: const EdgeInsets.all(0),
        content: Padding(
          padding: const EdgeInsets.only(
            top: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,

              ),
            ],
          ),
        ),
        actions: [
          SizedBox(
            width: Get.width * 0.03,
          ),
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              margin: const EdgeInsets.only(top: 40, bottom: 20),
              width: 135,
              height: 45,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(
                  Radius.elliptical(45, 40),
                ),
                border: Border.all(color: AppColors.mainColor, width: 2),
              ),
              child: Center(
                child: Text(
                  text1,
                  style: const TextStyle(
                    color: AppColors.mainColor,
                    fontSize: 14,
                    fontFamily: "PoppinsSemiBold",
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: Get.width * 0.015,
          ),
          InkWell(
            onTap: onTap,
            child: Container(
              margin: const EdgeInsets.only(top: 40, bottom: 20),
              width: 135,
              height: 45,
              decoration: const BoxDecoration(
                color: AppColors.mainColor,
                borderRadius: BorderRadius.all(
                  Radius.elliptical(45, 40),
                ),
              ),
              child: Center(
                child: Text(
                  text2,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: "PoppinsSemiBold",
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: Get.width * 0.03,
          )
        ],
      ),
    ),
  );
}

