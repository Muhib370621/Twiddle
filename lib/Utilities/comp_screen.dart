import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Screens/user_auth/signUpController.dart';
import '../constants/constants.dart';

class BackButton extends StatelessWidget {
  const BackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 360, bottom: 360, top: 33, left: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomWhiteButton extends StatelessWidget {
  final double height;
  final double width;
  final String text;
  final double fontSize;
  final VoidCallback onPressed;
  final Color color;

  const CustomWhiteButton({
    Key? key,
    required this.height,
    required this.width,
    required this.text,
    required this.onPressed,
    required this.fontSize,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(width: 2, color: Color.fromARGB(64, 0, 0, 0)),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: color,
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class CustomCancelButton extends StatelessWidget {
  final double height;
  final double width;
  final String text;
  final double fontSize;
  final VoidCallback onPressed;
  final Color color;

  const CustomCancelButton({
    Key? key,
    required this.height,
    required this.width,
    required this.text,
    required this.onPressed,
    required this.fontSize,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Color(0xffF2F6FE),
          borderRadius: BorderRadius.circular(25),
          //border: Border.all(width: 2, color: Color.fromARGB(64, 0, 0, 0)),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Color(0xff0336FF),
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class CustomBlueButton extends StatelessWidget {
  final double height;
  final double width;
  final String text;
  final double fontSize;
  final VoidCallback onPressed;

  const CustomBlueButton(
      {Key? key,
        required this.height,
        required this.width,
        required this.text,
        required this.onPressed,
        required this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: maincolor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text(
          text,
          style: TextStyle(
              color: Colors.white,
              fontSize: fontSize,
              fontWeight: FontWeight.w700,
              fontFamily: "PoppinsMedium"),
        ),
      ),
    );
  }
}

class CustomEditedFiled extends StatelessWidget {
  TextEditingController? controller;
  final double width;
  final double height;
  final String hintText;
  final String text;
  final Color hintTextColor;
  bool? enabled;

  CustomEditedFiled({
    Key? key,
    this.width = 0,
    this.height = 0,
    required this.hintText,
    this.controller,
    required this.text,
    this.hintTextColor = hinttext,
    this.enabled
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PoppinsText(text: text, color: Color(0xff1E1F20), size: 12, fontWeight: FontWeight.w700),
          SizedBox(height: 5),
          Container(
            height: Get.height*0.065,
            width: Get.width ,
            padding: EdgeInsets.only(left: 15,right: 10),
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: Color(0xff707070), width: 1)),
            child: Center(
              child: TextField(
                controller: controller,
                enabled: enabled,
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black,fontSize: 15),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hintText,
                  hintStyle: TextStyle(color: hinttext,fontSize: 13),
                ),
              ),
            ),
          ),
        ]
    );
  }
}

class CustomEditedCredits extends StatelessWidget {
  final TextEditingController controller;
  final double width;
  final double height;
  final String hintText;
  final String text;
  final String image;

  const CustomEditedCredits({
    Key? key,
    required this.width,
    required this.height,
    required this.hintText,
    required this.controller,
    required this.text,
    required this.image
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(text, style: kLabelTextStyle, textAlign: TextAlign.left),
          SizedBox(height: 7),
          Center(
            child: Container(
              height: height,
              width: width ,
              padding: EdgeInsets.only(left: 15,right: 15),
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Color(0xffF2F6FE),
                  borderRadius: BorderRadius.circular(6)),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: controller,
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black,fontSize: 15),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: hintText,
                        hintStyle: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            color: hinttext
                        ),
                      ),
                    ),
                  ),

                  Image.asset(image,width: 30,height: 30)

                ],
              ),
            ),
          ),
        ]
    );
  }
}

class CustomEditCredit extends StatelessWidget {
  final TextEditingController controller;
  final double width;
  final double height;
  final String hintText;
  final String text;


  const CustomEditCredit({
    Key? key,
    required this.width,
    required this.height,
    required this.hintText,
    required this.controller,
    required this.text,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(text, style: kLabelTextStyle, textAlign: TextAlign.left),
          SizedBox(height: 7),
          Center(
            child: Container(
              height: height,
              width: width ,
              padding: EdgeInsets.only(left: 15,right: 15),
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Color(0xffF2F6FE),
                  borderRadius: BorderRadius.circular(6)),
              child:TextField(
                  controller: controller,
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black,fontSize: 15),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: hintText,
                      hintStyle: GoogleFonts.poppins(
                          fontSize: 12.sp,
                          color: hinttext
                      ),
                  )),

            ),
          ),
        ]
    );
  }
}

class CustomEditProfile extends StatelessWidget {
  final TextEditingController controller;
  final double width;
  final double height;
  final String hintText;
  final String text;
  final Color hintTextColor;

  const CustomEditProfile({
    Key? key,
    required this.width,
    required this.height,
    required this.hintText,
    required this.controller,
    required this.text,
    required this.hintTextColor,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: kLabelTextStyle,
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 7),
          Center(
            child: Container(
              height: height,
              width: width ,
              padding: EdgeInsets.only(left: 15,right: 15),
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: grey, width: 1)),
              child: Row(
                children: [
                  Expanded(
                    child:TextField(
                      controller: controller,
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black,fontSize: 15),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: hintText,
                        hintStyle: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            color: hinttext
                        ),
                      ),
                    ),
                  ),
                  Icon(Icons.edit_outlined,color: Color(0xff0336FF))

                ],
              ),
            ),
          ),
        ]
    );
  }
}

  class CustomPassField extends StatelessWidget {
  final SignUpController signupController;
  final TextEditingController controller;
  final String hintText;
  final String text;
  final Color hintTextColor;

  const CustomPassField({
    Key? key,
    required this.hintText,
    required this.controller,
    required this.signupController,
    required this.text,
    required this.hintTextColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(text, style: kLabelTextStyle, textAlign: TextAlign.left),
          SizedBox(height: 5),
          Container(
            width: Get.width,
            height: Get.height * 0.075,
            padding: EdgeInsets.only(left: 15, right: 10),
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: Color(0xff707070), width: 1)),
            child: Row(
              children: [
                Expanded(
                  child: Obx(
                        () => TextField(
                      controller: controller,
                      obscureText: signupController.eyeTap.value
                          ? true
                          : false,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: hintText,
                        hintStyle: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            color: hinttext
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // signupController.togglePassword();
                  },
                  child: Obx(
                        () => Icon(
                      signupController.eyeTap.value
                          ? Icons.visibility_off_rounded
                          : Icons.remove_red_eye_rounded,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]);
  }
}



class CustomEditedSearch extends StatelessWidget {
  final TextEditingController controller;
  final double width;
  final double height;
  final String hintText;

  const CustomEditedSearch({
    Key? key,
    required this.width,
    required this.height,
    required this.hintText,
    required this.controller,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: height,
      width: width ,
      padding: EdgeInsets.only(left: 15,right: 10),
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Color(0xffF3F3F3),
          borderRadius: BorderRadius.circular(25),
          // boxShadow: [BoxShadow(
          //   color: Color(0xffF2F6FE).withOpacity(1),
          //   spreadRadius: 10,
          //   blurRadius: 10,
          //   offset: Offset(0, 2),
          // )]
      ),
      child: Row(
        children: [
          Icon(Icons.search,color: Colors.black),
          SizedBox(width: 5),
          Expanded(child: TextField(
            controller: controller,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black,fontSize: 15),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.black,fontSize: 13),
            ),
          ))


        ],
      ),
    );
  }
}

class Otp extends StatelessWidget {
  const Otp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.elliptical(50, 40)),
        border: Border.all(color: kOtpBorderColor, width: 2),
      ),
      height: 65,
      width: 45,
      child: TextField(
        autofocus: true,
        onChanged: (value) {
          if (value.length == 1 && FocusScope.of(context).nextFocus() == false) {
            FocusScope.of(context).nextFocus();
          }
          if (value.length == 0 && FocusScope.of(context).previousFocus() == false) {
            FocusScope.of(context).previousFocus();
          }
        },
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        style: TextStyle(),
        decoration: InputDecoration(
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class RoundBackButton extends StatelessWidget {
  Color color;
  double size;
  Color iconColor;
  RoundBackButton({
    this.color = maincolor,
    this.size = 14,
    this.iconColor = white,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: (){
          Get.back();
        },
        child: Container(
          padding: EdgeInsets.all(10.sp),
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.arrow_back_ios_rounded,
            color: iconColor,
            size: size.sp,
          ),
        )
    );
  }
}

class WhiteBackButton extends StatefulWidget {
  const WhiteBackButton({Key? key}) : super(key: key);

  @override
  State<WhiteBackButton> createState() => _WhiteBackButtonState();
}

class _WhiteBackButtonState extends State<WhiteBackButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35,
      height: 35,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: Align(
        alignment: Alignment.center,
        child: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios_rounded,
            color: maincolor,
            size: 17,
          ),
        ),
      ),
    );
  }
}

class CustomSuccess extends StatelessWidget {
  final double height;
  final double width;
  final String text;
  final VoidCallback onPressed;


  const CustomSuccess({
    Key? key,
    required this.height,
    required this.width,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff53D769),Color(0xff01E08F)]
          ),
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(width: 2, color: Color.fromARGB(64, 0, 0, 0)),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}



class CustomListP extends StatelessWidget {
  final double height;
  final double width;
  final String text;
  final double fontSize;
  final VoidCallback onPressed;

  CustomListP(
      {Key? key,
        required this.height,
        required this.width,
        required this.text,
        required this.onPressed,
        required this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Color(0xff0336FF),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          text,
          style: TextStyle(
              color: Colors.white,
              fontSize: fontSize,
              fontWeight: FontWeight.w700,
              fontFamily: "PoppinsMedium"),
        ),
      ),
    );
  }
}
class CustomListUnSel extends StatelessWidget {
  final double height;
  final double width;
  final String text;
  final double fontSize;
  final VoidCallback onPressed;

  const CustomListUnSel(
      {Key? key,
        required this.height,
        required this.width,
        required this.text,
        required this.onPressed,
        required this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Color(0xffE9E9EC),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          text,
          style: GoogleFonts.poppins(
              color: Colors.black,
              fontSize: fontSize,
              fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}


