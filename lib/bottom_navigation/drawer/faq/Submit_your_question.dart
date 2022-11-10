import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../constants/constants.dart';
import '../../../property/addproperty.dart';

class SubmitYourQuestion extends StatelessWidget {
  const SubmitYourQuestion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final type = TextEditingController();
    final desc = TextEditingController();

    return Scaffold(
      backgroundColor: white,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Height(size: 50),
            
            BackButtonText(text: 'Frequently Asked Questions:', size: 16, fontWeight: FontWeight.w500),

            Height(size: 30),

            MyContainer(
              radius: 20,
              horizontalPadding: 20,
              verticalPadding: 20,
              shadowColor: shadowcolor,
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  PoppinsText(text: 'Question?'),
                  Height(),
                  MyTextField(
                    hint: 'Type...',
                    controller: type,
                  ),
                  Height(),
                  MyTextField(
                    height: 120,
                    hint: 'Describe in detail...',
                    controller: desc,
                    maxLines: 3,
                  ),
                  Height(size: 20,),
                  
                  Button(
                    onTap: (){
                      if(type.text.isEmpty||desc.text.isEmpty){
                        Fluttertoast.showToast(msg: "Enter All Fields");
                      }
                      else {
                        addQNA(type.text, desc.text);
                        type.clear(); desc.clear();

                      }
                    },
                      text: 'Submit',
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
