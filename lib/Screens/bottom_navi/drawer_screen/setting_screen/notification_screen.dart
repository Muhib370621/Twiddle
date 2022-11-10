import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Utilities/comp_screen.dart';


class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {

  bool _block=true;
  bool _mute=true;
  bool _hideStatus=true;
  bool _hideLock=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            RoundBackButton(),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Block All Notifications",style: TextStyle(fontSize: 15,color: Colors.black)),
                Transform.scale(
                  scale: 0.7,
                  child: CupertinoSwitch(
                    activeColor: Color(0XFF0336FF),

                    value: _block,
                    onChanged: (value) {
                      setState(() {
                        _block = value;
                      });
                    },
                  ),
                )

              ],
            ),
            SizedBox(height: 10),
            Container(width: Get.width,height: 0.7,color: Color(0xff93A8AF)),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Mute Messages Notification",style: TextStyle(fontSize: 15,color: Colors.black)),
                Transform.scale(
                  scale: 0.7,
                  child: CupertinoSwitch(
                    activeColor: Color(0XFF0336FF),

                    value: _mute,
                    onChanged: (value) {
                      setState(() {
                        _mute = value;
                      });
                    },
                  ),
                )

              ],
            ),
            SizedBox(height: 10),
            Container(width: Get.width,height: 0.7,color: Color(0xff93A8AF)),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Hide Status Bar Notification",style: TextStyle(fontSize: 15,color: Colors.black)),
                Transform.scale(
                  scale: 0.7,
                  child: CupertinoSwitch(
                    activeColor: Color(0XFF0336FF),

                    value: _hideStatus,
                    onChanged: (value) {
                      setState(() {
                        _hideStatus = value;
                      });
                    },
                  ),
                )

              ],
            ),
            SizedBox(height: 10),
            Container(width: Get.width,height: 0.7,color: Color(0xff93A8AF)),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Hide Lock Screen Notifications",style: TextStyle(fontSize: 15,color: Colors.black)),
                Transform.scale(
                  scale: 0.7,
                  child: CupertinoSwitch(
                    activeColor: Color(0XFF0336FF),

                    value: _hideLock,
                    onChanged: (value) {
                      setState(() {
                        _hideLock = value;
                        print(_hideLock);
                      });
                    },
                  ),
                )

              ],
            ),
            SizedBox(height: 10),
            Container(width: Get.width,height: 0.7,color: Color(0xff93A8AF)),
            SizedBox(height: 20),





          ]),
      ),
    );
  }


}