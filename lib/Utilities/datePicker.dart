import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_agent/constants/constants.dart';

class DatePicker extends StatefulWidget {
  final String text;
  final Color hintTextColor;

  const DatePicker({
    Key? key,
    required this.text,
    required this.hintTextColor,
  }) : super(key: key);

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  static DateTime date = DateTime(2000, 4, 24);
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.text, style: kLabelTextStyle),
          SizedBox(height: 7),
          Container(
            width: Get.width,
            height: Get.height*0.075,
            padding: const EdgeInsets.only(left: 15),
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: grey, width: 1)),
            child: TextField(style: TextStyle(
            fontWeight: FontWeight.bold,
            color: kCreateAccountHintColor,
          ),
          decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: Icon(
                Icons.calendar_month_rounded,
                color: Color(0xFF1492E6),
              ),
              onPressed: () async {
                DateTime? newDate = await showDatePicker(
                  context: context,
                  initialDate: date,
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2100),
                  builder: (context, child) => Theme(
                    data: ThemeData().copyWith(
                      colorScheme: ColorScheme.light(
                        primary: Color(0xFF1492E6),
                      ),
                    ),
                    child: child!,
                  ),
                );
                if (newDate == null) {
                  return;
                }
                setState(() => date = newDate);
              },
            ),
            border: InputBorder.none,
            hintText: '${date.year}/${date.month}/${date.day}',
            hintStyle: TextStyle(
              color: kCreateAccountHintColor,
              fontWeight: FontWeight.bold,
              fontSize: Get.height * 0.020,
            ),
          ),
        ),
      ),
    ]);
  }
}

