import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_agent/constants/constants.dart';

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
        insetPadding: EdgeInsets.all(0),
        content: Padding(
          padding: EdgeInsets.only(
            top: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: kLargeTextStyle.copyWith(
                    fontFamily: "PoppinsSemiBold", fontSize: 15),
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
              margin: EdgeInsets.only(top: 40, bottom: 20),
              width: 135,
              height: 45,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.elliptical(45, 40),
                ),
                border: Border.all(color: maincolor, width: 2),
              ),
              child: Center(
                child: Text(
                  text1,
                  style: TextStyle(
                    color: maincolor,
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
              margin: EdgeInsets.only(top: 40, bottom: 20),
              width: 135,
              height: 45,
              decoration: BoxDecoration(
                color: maincolor,
                borderRadius: BorderRadius.all(
                  Radius.elliptical(45, 40),
                ),
              ),
              child: Center(
                child: Text(
                  text2,
                  style: TextStyle(
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

