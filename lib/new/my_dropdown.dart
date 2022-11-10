import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/constants.dart';

class MyDropdown extends StatefulWidget {
  List? list; String hint; final onChange; final value;
  MyDropdown({Key? key,
    this.list, this.hint = 'Dropdown', this.onChange, this.value
  }) : super(key: key);

  @override
  State<MyDropdown> createState() => _MyDropdownState();
}

class _MyDropdownState extends State<MyDropdown> {

  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return MyContainer(
      height: Get.height * 0.075, shadowColor: black.withOpacity(0.3),
      width: Get.width, horizontalPadding: 15, radius: 15,
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          icon: Icon(Icons.keyboard_arrow_down, color: maincolor),
          isExpanded: true,
          items: widget.list?.map((value) => DropdownMenuItem(
            child: PoppinsText(text: value, fontWeight: FontWeight.w500),
            value: value,

          )).toList(),
          onChanged: widget.onChange,
          //     (value){
          //   setState(() {
          //     selectedValue = value as String?;
          //   });
          // },
          value: widget.value,
          hint: PoppinsText(text: widget.hint, fontWeight: FontWeight.w500)
        ),
      ),
    );
  }
}
