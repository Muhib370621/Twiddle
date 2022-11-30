import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:state_agent/constants/constants.dart';

import '../../../constants/hive/hive.dart';

Future twiddleIDdialog(
    context,
    ) {
  return Future.delayed(
    const Duration(seconds: 0),
        () => showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.r),
        ),

        child: MyContainer(
          // padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          horizontalPadding: 20, verticalPadding: 20,
          child: ListView(
            shrinkWrap: true,
            children: [

              Align(alignment: Alignment.topRight,
                child: InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: MyContainer(
                      height: 30, width: 30,
                          radius: 20,
                          color: silver,
                      child: Icon(Icons.close_rounded, color: Colors.white, size: 15.sp,)),
                ),),
              MyContainer(
                  height: 80, width: 80,
                  radius: 50,
                  child: SvgPicture.asset('assets/idlogo.svg')
              ),

              Height(size: 25),

              Center(
                child: Text(
                  'Twiddle ID',
                  style: GoogleFonts.montserrat(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Height(size: 8),

              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Text(
                  //   user.get('id').toString(),
                  //   style: GoogleFonts.montserrat(
                  //       color: hinttext,
                  //     fontSize: 12.sp
                  //   ),
                  // ),
                  PoppinsText(text: "ID".toString(), color: hinttext),
                  Width(),
                  GestureDetector(
                    onTap: (){
                      Clipboard.setData(
                          ClipboardData(text: "ID".toString())
                      );
                      Fluttertoast.showToast(
                        msg: 'Copied',
                        gravity: ToastGravity.TOP,
                      );
                    },
                    child: Icon(Icons.copy, color: maincolor, size: 15.sp)
                  )

                ],
              ),

              Height(size: 30),

              Button(
                onTap: ()=> Get.back(),
                text: 'Done'
              ),
              Height()

            ],),
        ),

      )));
}

