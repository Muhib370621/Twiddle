import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SPDropdown extends StatefulWidget {
  double? height;
  double horizontalPadding;

  SPDropdown({Key? key, this.height, this.horizontalPadding = 20})
      : super(key: key);

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
      height: widget.height ?? Get.height * 0.075,
      width: Get.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
            isExpanded: true,
            items: list
                .map((value) => DropdownMenuItem(
                      value: value,
                      child: Text(value,
                          style: const TextStyle(fontWeight: FontWeight.w500)),
                    ))
                .toList(),
            onChanged: (selectedAccountType) {
              setState(() {
                selectedValue = selectedAccountType as String?;
              });
            },
            value: selectedValue,
            hint: const Text(
              "Cleaner  ",
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            )),
      ),
    );
  }
}
