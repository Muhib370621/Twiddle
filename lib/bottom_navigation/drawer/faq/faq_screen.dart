import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../Utilities/comp_screen.dart';
import '../../../constants/constants.dart';
import 'Submit_your_question.dart';


class FaqScreen extends StatefulWidget {
  const FaqScreen({Key? key}) : super(key: key);

  @override
  State<FaqScreen> createState() => _FaqScreenState();

}


class _FaqScreenState extends State<FaqScreen> {

  bool open = false;

  final ref = FirebaseDatabase.instance.ref().child('questions');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            RoundBackButton(),
            SizedBox(height: 20),
            PoppinsText(text: "Frequently Asked Questions:",
                color: black,
                size: 20,
                fontWeight: FontWeight.bold),

            Height(size: 20),

            Expanded(
              child: FirebaseAnimatedList(
                query: ref,
                itemBuilder: (BuildContext context, DataSnapshot snapshot,
                    Animation<double> animaiton, int index) {
                  var value = Map<String, dynamic>.from(snapshot.value as Map);

                  return Column(
                    children: [

                      // FlipCard(
                      //     front: Type(
                      //       type: value['type'],
                      //       icon: open? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                      //     ),
                      //     back: Desc(desc: value['desc'])
                      // ),

                      GestureDetector(
                        onTap: () {
                          setState(() {
                            open = !open;
                          });
                        },
                        child: Type(
                          type: value['type'],
                          icon: open? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                        ),
                      ),
                      Height(size: 15),
                      Visibility(
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 15.h),
                            child: Desc(desc: value['desc']),
                          ),
                        visible: open,
                      )
                    ],
                  );
                },

              ),
            ),

            Button(
                onTap: () {
                  Get.to(() => SubmitYourQuestion());
                },
                text: 'Submit your question',
                size: 14,
                fontWeight: FontWeight.w500),

            Height(size: 20)

          ],
        ),
      ),
    );
  }
}

class Type extends StatelessWidget {
  String type;
  IconData? icon;
  Type({
    Key? key,
    this.icon,
    required this.type
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyContainer(
      radius: 20,
      horizontalPadding: 20,
      verticalPadding: 20,
      color: maincolor.withOpacity(0.1),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          PoppinsText(
            text: type,
            fontWeight: FontWeight.w500,
          ),

          Icon(icon)
        ],
      ),
    );
  }
}

class Desc extends StatelessWidget {
  String desc;

  Desc({Key? key, required this.desc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyContainer(
      horizontalPadding: 20,
      verticalPadding: 20,
      radius: 20,
      color: shadowcolor,
      child: PoppinsText(
        text: desc,
        color: hinttext,
      ),
    );
  }
}
