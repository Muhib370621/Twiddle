import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

Widget mytext(String text, double size, Color color){
  return Text(text,
    style: GoogleFonts.poppins(
      fontSize: size.sp,
      color: color,
    ),);
}
Widget tabtext(String text, double size){
  return Text(text,
    style: GoogleFonts.poppins(
      fontSize: size.sp,
    ),);
}
Widget mytextbold(String text, double size, Color color){
  return Text(text,
    style: GoogleFonts.poppins(
        fontSize: size.sp,
        color: color,
        fontWeight: FontWeight.bold
    ),);
}

Widget container(double height, double width, Color color, double radius, Widget child){
  return Container(
      height: height, width: width,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(radius.r)
      ),
      child: child
  );
}

Widget shadowcontainer(double height, double width, Color color, double radius, Widget child, VoidCallback onTap){
  return InkWell(
    onTap: onTap,
    child: Container(
        height: height, width: width,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(radius.r),
            boxShadow: [BoxShadow(
              color: Color(0xffF2F6FE).withOpacity(1),
              spreadRadius: 10,
              blurRadius: 10,
              offset: Offset(0, 2),
            )]
        ),
        child: child
    ),
  );
}