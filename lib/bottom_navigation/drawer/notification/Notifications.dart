import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_agent/constants/constants.dart';

import '../../../Utilities/comp_screen.dart';


class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: Get.height * 0.058, left: Get.width * 0.05),
        child: Container(
          width: Get.width,
          height: Get.height,
          child: Column(
            children: [
              Row(
                children: [
                  RoundBackButton(),
                  SizedBox(width: 15),
                  Text(
                    'NOTIFICATIONS',
                    style: kLargeTextStyle.copyWith(
                      fontFamily: "PoppinsSemiBold",
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Image.asset(
                'assets/noData.png',
                scale: 1.6,
              ),
              Text(
                'No data found',
                style: TextStyle(
                  fontFamily: "PoppinsMedium",
                  fontSize: 12,
                  color: Color(0xFF9C9C9C),
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
