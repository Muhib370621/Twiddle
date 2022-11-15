import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DotIndicator extends StatelessWidget {
  DotIndicator({
    Key? key,
    this.isActive = false}) : super(key: key);

  bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isActive?2.h: 1.h, width: isActive?2.h: 1.h,
      decoration: BoxDecoration(
          color: isActive?Colors.white : Colors.grey,
          borderRadius: BorderRadius.circular(2.w)
      ),
    );
  }
}