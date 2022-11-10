import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../constants/constants.dart';

class SPDropdown extends StatefulWidget {
  double? height; double horizontalPadding;
  SPDropdown({Key? key, this.height, this.horizontalPadding = 20}) : super(key: key);

  @override
  State<SPDropdown> createState() => _SPDropdownState();
}

class _SPDropdownState extends State<SPDropdown> {

  String? selectedValue;
  List list = [
    "Cleaner",
    "Painter",
    "Mechanic",
    "Gardener",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: widget.horizontalPadding.w),
      height: widget.height == null ? Get.height * 0.075 : widget.height,
      width: Get.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          isExpanded: true,
          items: list.map((value) =>
              DropdownMenuItem(
                child: PoppinsText(text: value, fontWeight: FontWeight.w500),
                value: value,

              )).toList(),
          onChanged: (val) {
            setState(() {
              selectedValue = val as String?;
            });
          },

          value: selectedValue,
          hint: PoppinsText(text: "Cleaner", fontWeight: FontWeight.w500),

        ),
      ),
    );
  }
}