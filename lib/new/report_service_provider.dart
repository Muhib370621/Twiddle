import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../constants/constants.dart';
import '../property/addproperty.dart';

class ReportServiceProvider extends StatelessWidget {
  String email;
  ReportServiceProvider({Key? key,
    this.email = ''
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final reason = TextEditingController();
    final desc = TextEditingController();

    return Scaffold(
      backgroundColor: white,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Height(size: 50),

            BackButtonText(text: 'Report Service Provider', size: 16, fontWeight: FontWeight.w500),

            Height(size: 30),

            MyContainer(
              radius: 20,
              horizontalPadding: 20,
              verticalPadding: 20,
              shadowColor: maincolor.withOpacity(0.15),
              color: white,
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  PoppinsText(text: 'What do you want to report us?'),
                  Height(),
                  MyTextField(
                    hint: 'Subject',
                    controller: reason,
                    color: shadowcolor,
                  ),
                  Height(),
                  MyTextField(
                    height: 120,
                    hint: 'Report...',
                    controller: desc,
                    maxLines: 3,
                    color: shadowcolor,
                  ),
                  Height(size: 20,),

                  Button(
                      onTap: (){
                        if(reason.text.isEmpty||desc.text.isEmpty){
                          Fluttertoast.showToast(msg: "Enter All Fields");
                        }
                        else {
                          reportProvider(reason.text, desc.text, email);

                          Fluttertoast.showToast(msg: 'Thanks for your feedback !');

                          reason.clear(); desc.clear();

                        }
                      },
                      text: 'Submit Report',
                      height: 40),

                ],
              ),
            ),


          ],
        ),
      ),
    );
  }
}
