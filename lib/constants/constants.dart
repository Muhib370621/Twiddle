import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

const maincolor = Color(0xff0336FF);
const darkblue = Color(0xff021B80);
const white = Colors.white;
const black = Colors.black;
const silver = Color(0XFF9C9C9C);
const shadowcolor = Color(0xffF2F6FE);
const grey = Color(0xff707070);
const redtext = Color(0xffFF4D4D);
const bhinttext = Color(0xFF1492E6);
const hinttext = Color(0xFF8F92A1);
const bluetext = Color(0xff819BFF);
const orange = Color(0xffFF9A03);
const active = Color(0xff01E08F);
const star = Color(0xffFFDE03);
const purple = Color(0xff7701E0);
const chat = Color(0xffEAECF2);
const lightButton = Color(0xffE9E9EC);
const transparent = Colors.transparent;
const kCreateAccountHintColor = Color(0xFF2E3034);
const kShadowColor = Color(0xFF0336FF29);
const kSearchBarColor = Color(0xF3F3F3);
const kTopNavBarColor = Color(0xFFFAFBFF);
const kOtpBorderColor = Color(0xFFE0E0E0);
const kLargeTextColor = Color(0xFF2E3034);
const kFielLabelColor = Color(0xFF1E1F20);

const kLabelTextStyle = TextStyle(
  fontFamily: 'PoppinsSemiBold',
  color: kFielLabelColor,
  fontSize: 12,
  fontWeight: FontWeight.w700,
  letterSpacing: 1,
);

const kLargeTextStyle = TextStyle(
    color: kLargeTextColor,
    fontFamily: 'PoppinsBold',
    fontSize: 22,
    fontWeight: FontWeight.w900);

const kInfoTextStyle = TextStyle(
  color: Color(0xFF8F92A1),
  fontFamily: "PoppinsMedium",
  fontSize: 12,
);

const kBlueHeadingStyle = TextStyle(
  color: maincolor,
  fontSize: 14,
  fontFamily: "PoppinsMedium",
);

const kGreySmallText = TextStyle(
  color: silver,
  fontSize: 10,
  fontFamily: "PoppinsMedium",
);

Widget kDivider() {
  return Container(
    height: 0.14,
    width: Get.width,
    color: Color(0xFF707070),
  );
}

Widget kBigHeight() {
  return SizedBox(
    height: Get.height * 0.02,
  );
}

Widget kSmallHeight() {
  return SizedBox(
    height: Get.height * 0.015,
  );
}

class MyDivider extends StatelessWidget {
  Color color; double opacity; double? width;
  MyDivider({this.color = silver, this.opacity = 0.5, this.width = double.infinity,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width, height: 1.h,
      color: color.withOpacity(opacity),
    );
  }
}

class PoppinsText extends StatelessWidget {
  String text;
  Color color;
  double size;
  final decoration;
  int? maxLines;
  FontStyle? fontStyle;
  TextOverflow? overflow;
  TextAlign? textAlign;
  FontWeight fontWeight;
  PoppinsText({
    Key? key,
    required this.text,
    this.overflow,
    this.decoration,
    this.maxLines,
    this.size = 12,
    this.textAlign,
    this.color = black,
    this.fontStyle,
    this.fontWeight = FontWeight.normal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text, textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      style: GoogleFonts.poppins(
      fontStyle: fontStyle,
      decoration: decoration,
      fontSize: size.sp,
      color: color,
      fontWeight: fontWeight,

    ),
    );
  }
}

class Height extends StatelessWidget {
  double size;
  Height({
    Key? key,
    this.size = 10
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return SizedBox(height: Get.height/(812/size));
  }
}

class Width extends StatelessWidget {
  double size;
  Width({
    Key? key,
    this.size = 5
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: Get.width/(375/size));
  }
}

class TextSwitchButton extends StatefulWidget {
  String text;
  double size;
  FontWeight fontWeight;
  Color color;
  bool boolValue;
  TextSwitchButton({
    Key? key,
    this.color = black,
    this.size = 12,
    this.fontWeight = FontWeight.normal,
    required this.text,
    this.boolValue = false
  }) : super(key: key);

  @override
  State<TextSwitchButton> createState() => _TextSwitchButtonState();
}

class _TextSwitchButtonState extends State<TextSwitchButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: grey, width: 1.w)
      ),
      width: Get.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          PoppinsText(text: widget.text, size: widget.size, fontWeight: widget.fontWeight, color: widget.color),
          Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
              activeColor: Color(0XFF0336FF),

              value: widget.boolValue,
              onChanged: (value) {
                setState(() {
                  widget.boolValue = value;
                });
              },
            ),
          )

        ],
      ),
    );
  }
}

class MyBackButton extends StatelessWidget {
  VoidCallback? onTap;
  Color color;
  double size;
  Color iconColor;
  MyBackButton({
    this.onTap,
    this.color = maincolor,
    this.size = 14,
    this.iconColor = white,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return InkWell(
        onTap: onTap != null? onTap : ()=> Get.back(),
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

class BackButtonText extends StatelessWidget {
  VoidCallback? onTap;
  String text;
  FontWeight fontWeight;
  Color color;
  Color iconColor;
  Color buttonColor;
  double size;
  BackButtonText({
    Key? key,
    this.onTap,
    required this.text,
    this.buttonColor = maincolor,
    this.color = black,
    this.iconColor = white,
    this.fontWeight = FontWeight.bold,
    this.size = 14
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MyBackButton(
            onTap: onTap == null? ()=> Get.back() : onTap,
            color: buttonColor, iconColor: iconColor),
        Width(size: 10),
        PoppinsText(text: text, fontWeight: fontWeight, color: color, size: size,)
      ],
    );
  }
}

class Button extends StatelessWidget {
  GestureTapCallback? onTap; double height; double width; String text;
  Color color; Color shadowColor; double size; FontWeight fontWeight;
  Color buttonColor; double radius; double horizontalPadding; Color borderColor;
  Button({
    Key? key,
    required this.text,
    this.onTap, this.horizontalPadding = 0,
    this.radius = 30,
    this.color = white,
    this.shadowColor = transparent,
    this.size = 14,
    this.fontWeight = FontWeight.w500,
    this.height = 50,
    this.buttonColor = maincolor,
    this.borderColor = transparent,
    this.width = double.infinity
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding.w),
        height: Get.height/(812/height).h, width: Get.width/(375/width).w,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(radius.r),
          border: Border.all(
            color: borderColor,
            width: 1
          ),
          boxShadow: [
            BoxShadow(
              color: shadowColor,
              blurRadius: 10,
              offset: Offset(0, 3)
            )
          ]
        ),
        child: Center(
          child: PoppinsText(text: text, color: color, size: size, fontWeight: fontWeight),
        ),
      ),
    );
  }
}

class Iconbutton extends StatelessWidget {
  GestureTapCallback? onTap;
  Widget? MyIcon;
  double height;
  double width;
  String text;
  Color color;
  Color iconColor;
  Color shadowColor;
  double size;
  double myIconsSize;
  FontWeight fontWeight;
  Color buttonColor;
  Color borderColor;
  double iconSize;
  double radius;
  IconData? icon;
  double padding;
  Iconbutton({
    Key? key,
    required this.text,
    this.padding = 0,
    this.borderColor = transparent,
    this.myIconsSize = 15,
    this.onTap, this.MyIcon,
    this.color = white,
    this.iconColor = white,
    this.shadowColor = transparent,
    this.size = 14,
    this.fontWeight = FontWeight.w500,
    this.height = 50,
    this.buttonColor = maincolor,
    this.icon, this.radius = 10,
    this.iconSize = 15,
    this.width = double.infinity
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: Get.height/(812/height).h, width: Get.width/(375/width).w,
        padding: EdgeInsets.symmetric(horizontal: padding.w),
        decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(radius.r),
            border: Border.all(
              color: borderColor,
              width: 1
            ),
            boxShadow: [
              BoxShadow(
                  color: shadowColor,
                  blurRadius: 10,
                  offset: Offset(0, 3)
              )
            ]
        ),
        child: Center(
          child: Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyIcon == null? Container() : Container(
                height: Get.height/(812/myIconsSize), width: Get.width/(375/myIconsSize),
                child: MyIcon,
              ),
              icon == null? Container() :
              Icon(icon, color: iconColor, size: iconSize.sp),
              Width(),
              PoppinsText(text: text, color: color, size: size, fontWeight: fontWeight),
            ],
          ),
        ),
      ),
    );
  }
}

class TextIcon extends StatelessWidget {
  String text1;
  double size1;
  Color color1;
  Color iconColor;
  FontWeight fontWeight1;
  String text2;
  double size2;
  Color color2;
  FontWeight fontWeight2;

  TextIcon({
    Key? key,
    required this.text1,
    this.color1 = silver,
    this.iconColor = maincolor,
    this.size1 = 14,
    this.fontWeight1 = FontWeight.w500,
    required this.text2,
    this.color2 = black,
    this.size2 = 14,
    this.fontWeight2 = FontWeight.w500,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

        PoppinsText(text: text1, size: size1, fontWeight: fontWeight1, color: color1,),

        Row(mainAxisAlignment: MainAxisAlignment.end,
            children: [
              PoppinsText(text: text2, size: size2, fontWeight: fontWeight2, color: color2,),
              Width(size: 10,),
              Icon(Icons.info_outline, color: iconColor, size: 15.sp,)
            ]),
      ],
    );
  }
}

class IconText extends StatelessWidget {
  IconData icon; String text; double size; double iconSize;
  FontWeight fontWeight; Color color; Color iconColor;
  IconText({Key? key,
    required this.icon, required this.text, this.iconColor = black,
    this.fontWeight = FontWeight.normal, this.size = 10, this.color = black, this.iconSize = 15
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor, size: iconSize),
        Width(),
        PoppinsText(text: text, size: size, color: color, fontWeight: fontWeight)
      ],
    );
  }
}

class Box extends StatelessWidget {
  Widget child;
  double height;
  double width;
  Color color;
  double radius;
  Color shadowColor;
  Box({
    Key? key,
    required this.child,
    this.height = 100,
    this.radius = 30,
    this.shadowColor = white,
    this.width = double.infinity,
    this.color = lightButton
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height/(812/height).h, width: width/(375/width).w,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius.r),
        boxShadow: [
          BoxShadow(
            color: shadowColor,
            blurRadius: 10,
            offset: Offset(0, 5)
          )
        ]
      ),
      child: child,
    );
  }
}

class MyContainer extends StatelessWidget {
  Widget? child; VoidCallback? onTap;
  double width; double? height;
  double topLeft; double topRight;
  double bottomLeft; double bottomRight;
  Color color; Color borderColor;
  double horizontalPadding;
  double verticalPadding;
  double horizontalMargin;
  double verticalMargin;
  double? radius;
  double borderWidth;
  BoxShape shape;
  Color shadowColor;
  List<Color>? gradientColors;
  MyContainer({
    Key? key,
    this.child, this.borderWidth = 1,
    this.bottomLeft = 0, this.bottomRight = 0,
    this.topLeft = 0, this.topRight = 0,
    this.radius, this.onTap,
    this.horizontalPadding = 0,
    this.verticalPadding = 0,
    this.horizontalMargin = 0,
    this.verticalMargin = 0,
    this.shadowColor = transparent,
    this.width = double.infinity,
    this.height, this.gradientColors,
    this.shape = BoxShape.rectangle,
    this.color = transparent, this.borderColor = transparent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding.w, vertical: verticalPadding.h),
      margin: EdgeInsets.symmetric(horizontal: horizontalMargin.w, vertical: verticalMargin.h),
      width: Get.width/(375/width).w, height: height != null ? Get.height/(812/height!).h : height,
      decoration: BoxDecoration(
          color: color,
          borderRadius: radius == null?
              BorderRadius.only(
                topLeft: Radius.circular(topLeft.r),
                topRight: Radius.circular(topRight.r),
                bottomLeft: Radius.circular(bottomLeft.r),
                bottomRight: Radius.circular(bottomRight.r),
              )
              : BorderRadius.circular(radius!.r),
          border: Border.all(
              color: borderColor,
              width: borderWidth
          ),
          shape: shape,
          boxShadow: [
            BoxShadow(
                color: shadowColor,
                blurRadius: 10,
                offset: Offset(0, 5)
            )
          ]
      ),
      child: child,
    );
  }
}

class myTextField extends StatelessWidget {
  String label;
  Color color;
  FontWeight fontWeight;
  TextEditingController controller;
  double height;
  double size;
 myTextField({
   Key? key,
   this.label = "Text Field",
   this.height = 60,
   this.size = 14,
   this.color = black,
   this.fontWeight = FontWeight.normal,
   required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height.h,
      width: Get.width,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
        color: lightButton,
        borderRadius: BorderRadius.circular(20.r)
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          label: PoppinsText(text: label, size: size, color: color, fontWeight: fontWeight)
        ),
      ),
    );
  }
}

// class MyDialog extends StatelessWidget {
//   Alignment alignment;
//   String? title;
//   MyDialog({
//     Key? key,
//     this.title,
//     this.alignment = Alignment.center
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return showDialog(
//         context: (context),
//         builder: (context)=>
//             Dialog(
//               alignment: alignment,
//               child: Container(
//                 height: 350.h, width: 200.w,
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 18.h),
//                   child: ListView(
//                     shrinkWrap: true,
//                     children: [
//                       PoppinsText(text: title!)
//                     ],
//                   ),
//                 ),
//               ),
//             )
//     );
//   }
// }

class IconTextBox extends StatelessWidget {
  double height, width, radius, size, iconHeight, iconWidth;
  String? text, icon; VoidCallback? onTap;
  Color color, shadowColor, textColor, iconColor;
  FontWeight fontWeight;
  TextOverflow? overflow;
  TextAlign? textAlign;
  int? maxLines;
  IconTextBox({
    Key? key,
    this.height = 95, this.width = 95, this.text, this.icon, this.iconHeight = 40,
    this.color = maincolor, this.shadowColor = white, this.textColor = black,
    this.radius = 20, this.textAlign, this.fontWeight = FontWeight.normal,
    this.overflow, this.size = 12, this.maxLines, this.iconColor = maincolor,
    this.iconWidth = 40, this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: Get.height/(812/height).h, width: Get.width/(375/width).w,
        padding: EdgeInsets.all(10.sp),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(radius.r),
          boxShadow: [
            BoxShadow(
              color: shadowColor,
              blurRadius: 10,
              offset: Offset(0, 5)
            ),
          ]
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              SvgPicture.asset(
                'assets/$icon.svg', color: iconColor,
                height: Get.height/(812/iconHeight), width: Get.width/(375/iconHeight),
              ),

              PoppinsText(text: text!, size: size,
                fontWeight: fontWeight,
                color: textColor,
                textAlign: textAlign,
                overflow: overflow,
                maxLines: maxLines,)
          ]
        ),
      ),
    );
  }
}

class TextIconBox extends StatelessWidget {
  double height, width, radius, size, iconHeight, iconWidth;
  String? text, icon; VoidCallback? onTap;
  Color color, shadowColor, textColor, iconColor;
  FontWeight fontWeight;
  TextOverflow? overflow;
  TextAlign? textAlign;
  int? maxLines;
  TextIconBox({
    Key? key,
    this.height = 95, this.width = 95, this.text, this.icon, this.iconHeight = 40,
    this.color = maincolor, this.shadowColor = white, this.textColor = black,
    this.radius = 20, this.textAlign, this.fontWeight = FontWeight.normal,
    this.overflow, this.size = 12, this.maxLines, this.iconColor = maincolor,
    this.iconWidth = 40, this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: Get.height/(812/height).h, width: Get.width/(375/width).w,
        padding: EdgeInsets.all(10.sp),
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(radius.r),
            boxShadow: [
              BoxShadow(
                  color: shadowColor,
                  blurRadius: 10,
                  offset: Offset(0, 5)
              ),
            ]
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              PoppinsText(text: text!, size: size,
                fontWeight: fontWeight,
                color: textColor,
                textAlign: textAlign,
                overflow: overflow,
                maxLines: maxLines,
              ),

              SvgPicture.asset(
                'assets/$icon.svg', color: iconColor,
                height: Get.height/(812/iconHeight), width: Get.width/(375/iconHeight),
              ),

            ]
        ),
      ),
    );
  }
}

class MyTextField extends StatelessWidget {
  Color color; Color? hintColor; Color? fontColor; Color borderColor; Color? suffixIconColor;
  String hint; IconData? suffixIcon; TextEditingController? controller; Widget? icon; bool obscureText;
  FontWeight? fontWeight; double radius; double size; double height; double? width; final onChanged;
  int maxLines; VoidCallback? onSuffixIconTap; bool enabled; double? suffixIconSize;
  final keyboardType; final onEditingComplete; Widget? mySuffixIcon;final validator;
  MyTextField({
    Key? key, this.onChanged,
    this.hint = 'Type something..',
    this.radius = 10,
    this.fontColor = black,
    this.mySuffixIcon,
    this.size = 12, this.keyboardType,
    this.controller, this.suffixIconColor,
    this.suffixIcon, this.enabled = true,
    this.icon, this.obscureText = false,
    this.height = 50, this.onSuffixIconTap,
    this.hintColor, this.suffixIconSize,
    this.fontWeight, this.onEditingComplete,
    this.maxLines = 1,
    this.color = transparent,
    this.width, this.borderColor = transparent,
    this.validator,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Container(
      // padding: EdgeInsets.symmetric(horizontal: 15.w),
      // width: width == null? Get.width : Get.width/(375/width!), height: Get.height/(812/height),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius.r),
        // border: Border.all(
        //   color: borderColor,
        //   width: 1
        // )
      ),
      child: Center(
        child:
        TextFormField(


          style: GoogleFonts.poppins(
            fontSize: size.sp,
            color: fontColor,
            fontWeight: fontWeight
          ),

          validator: validator,
          onEditingComplete: onEditingComplete,
          keyboardType: keyboardType,
          onChanged: onChanged,
          controller: controller,
          maxLines: maxLines,
          obscureText: obscureText,
          enabled: enabled,
          decoration: InputDecoration(

            // border: OutlineInputBorder(
            //   borderRadius: BorderRadius.circular(20),
            // ),
            hintText: hint,
            icon: icon,
            suffixIcon: mySuffixIcon != null?
            GestureDetector(
              onTap: onSuffixIconTap,
              child: mySuffixIcon,
            ): GestureDetector(
              onTap: onSuffixIconTap,
              child: Icon(suffixIcon, size: suffixIconSize, color: suffixIconColor),
            ),
            hintStyle: GoogleFonts.poppins(
              color: hintColor,
              fontSize: size.sp,
              fontWeight: fontWeight,
            )
          ),
        ),
      ),
    );
  }
}

class ProfilePic extends StatelessWidget {
  String? pic; String? status; String? name; String? type; double size; double? borderWidth;
  Color? borderColor;
  ProfilePic({Key? key, this.pic, this.name, this.status,
    this.type, this.size = 60, this.borderWidth,
    this.borderColor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return status == 'online'?
    Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [

              Container(
                height: Get.height/(812/size), width: Get.height/(812/size),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: borderColor!,
                      width: borderWidth!
                    ),
                    image: pic == null? DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/adm.png')
                    ) : DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(pic!)
                    )
                ),
              ),
              Positioned(
                right: 0, bottom: 0,
                child: MyContainer(
                  height: 17, width: 17,
                  radius: 10, borderColor: white,
                  color: active, borderWidth: 3,
                ),
              )

            ],
          ),

          name != null?
          PoppinsText(text: name!, size: 10, fontWeight: FontWeight.w500, textAlign: TextAlign.center):Container(),
          status != null?
          PoppinsText(text: type!, size: 10, color: maincolor, textAlign: TextAlign.center):Container()
        ],
      ),
    ) : Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: Get.height/(812/size), width:Get.height/(812/size),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    color: borderColor!,
                    width: borderWidth!
                ),
                image: pic != null? DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(pic!)
                ) : DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/adm.png')
                )
            ),
          ),

          name != null?
          PoppinsText(text: name!, size: 10, fontWeight: FontWeight.w500, textAlign: TextAlign.center):Container(),
          status != null?
          PoppinsText(text: type!, size: 10, color: maincolor, textAlign: TextAlign.center):Container()

        ],
      ),
    );
  }
}

class Picture extends StatelessWidget {
  BoxFit fit; double size; String? asset;
  String? file; String? url; Color borderColor;
  double borderWidth; Color color;
  Picture({Key? key,
    this.size = 40,
    this.color = transparent,
    this.asset, this.url,
    this.file, this.fit = BoxFit.cover,
    this.borderColor = transparent,
    this.borderWidth = 0
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    if(url != null && url != 'null'){
      return Container(
        width: Get.height/(812/size), height: Get.height/(812/size),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
            border: Border.all(
              color: borderColor,
              width: borderWidth
            ),
            image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(url!),
             // image: AssetImage(Image.asset('')),
            )
        )
      );
    }

    else if(file != null && file != 'null'){
      return Container(
          width: Get.height/(812/size), height: Get.height/(812/size),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
              border: Border.all(
                  color: borderColor,
                  width: borderWidth
              ),
              image: DecorationImage(
                  image: FileImage(
                      File(file!)
                  )
              )
          )
      );
    }

    return Container(
      width: Get.height/(812/size), height: Get.height/(812/size),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
          color: color,
          border: Border.all(
              color: borderColor,
              width: borderWidth
          ),
        image: asset != null? DecorationImage(
          fit: fit,
            image: AssetImage(asset!)
        ) : DecorationImage(
            fit: fit,
            image: AssetImage('assets/person/mary.png')
        )
      ),
    );
  }
}
