import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants.dart';

class SimpleDropDown extends StatefulWidget {
  final List list;
  final String text;
  final Widget icon;

  const SimpleDropDown({
    Key? key,
    required this.list,
    required this.text,
    required this.icon,
  }) : super(key: key);

  @override
  State<SimpleDropDown> createState() => _SimpleDropDownState();
}

class _SimpleDropDownState extends State<SimpleDropDown> {
  @override
  Widget build(BuildContext context) {
    String? newValue = "";
    return Column(
      children: [
        Container(
            height: 36,
            width: 360,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
            ),
            alignment: Alignment.center,
            // padding: EdgeInsets.all(25),

            child: DropdownButtonHideUnderline(
              child: ButtonTheme(
                alignedDropdown: true,
                child: DropdownButton<String>(
                  // itemHeight: 50,
                  dropdownColor: Colors.white,
                  elevation: 0,
                  isExpanded: true,
                  iconSize: 30,
                  hint: Text(
                    newValue!=null ? newValue : widget.text,
                    style: TextStyle(
                        color: Colors.blue, fontFamily: "PoppinsMedium"),
                  ),
                  value: widget.list[0],
                  items: [
                    DropdownMenuItem(
                        onTap: (){
                          setState((){
                            newValue = widget.list[0];
                          });
                        },
                        child: Text(
                          widget.list[0],
                          style: TextStyle(
                            fontFamily: 'PoppinsMedium',
                            fontSize: 12,
                            color: Color(0xFF2E3034),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        value: widget.list[0]),
                    DropdownMenuItem(
                        onTap: (){
                          setState((){
                            newValue = widget.list[1];
                          });
                        },
                        child: Text(
                          widget.list[1],
                          style: TextStyle(
                            fontFamily: 'PoppinsMedium',
                            fontSize: 12,
                            color: Color(0xFF2E3034),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        value: widget.list[1]),
                    DropdownMenuItem(
                        onTap: (){
                          setState((){
                            newValue = widget.list[2];
                          });
                        },
                        child: Text(
                          widget.list[2],
                          style: TextStyle(
                            fontFamily: 'PoppinsMedium',
                            fontSize: 12,
                            color: Color(0xFF2E3034),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        value: widget.list[2]),
                    DropdownMenuItem(
                        onTap: (){
                          setState((){
                            newValue = widget.list[3];
                          });
                        },
                        child: Text(
                          widget.list[3],
                          style: TextStyle(
                            fontFamily: 'PoppinsMedium',
                            fontSize: 12,
                            color: Color(0xFF2E3034),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        value: widget.list[3]),
                  ],
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      newValue = value;
                    });
                  },
                  icon: widget.icon,
                ),
              ),
            )),
      ],
    );
  }
}

class PublicDropdown extends StatefulWidget {
  const PublicDropdown({Key? key,}) : super(key: key);

  @override
  State<PublicDropdown> createState() => _PublicDropdownState();
}

class _PublicDropdownState extends State<PublicDropdown> {

  String? selectedValue;
  List list = [
    "Renter/User",
    "Property Owner",
    "Real Estate Agnet",
    "FSP",
    "Service Provider",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      height: Get.height * 0.075,
      width: Get.width,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: grey),
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          isExpanded: true,
          items: list.map((value) => DropdownMenuItem(
            child: Text(value ,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: black,
                  fontWeight: FontWeight.w500,
                )),
            value: value,

          )).toList(),
          onChanged: (selectedAccountType){
            setState(() {
              selectedValue= selectedAccountType as String?;

            });
          },

          value: selectedValue,
          hint: Text("Select one option",
              style: GoogleFonts.poppins(
                fontSize: 12,
                color: black,
                fontWeight: FontWeight.w500,
              )
          ),

        ),
      ),
    );
  }
}

class EmpYearDropDown extends StatelessWidget {
  const EmpYearDropDown({
    Key? key,
    required this.list,
    required this.text,
  }) : super(key: key);
  final List list;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text, style: kLabelTextStyle, textAlign: TextAlign.left),
        SizedBox(height: 7),
        Container(
            height: Get.height * 0.075,
            width: Get.width,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: grey),
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
            ),
            alignment: Alignment.center,

            child: DropdownButtonHideUnderline(
              child: ButtonTheme(
                alignedDropdown: true,
                child: DropdownButton<String>(
                  itemHeight: 50,
                  dropdownColor: Colors.white,
                  elevation: 0,
                  isExpanded: true,
                  iconSize: 30,
                  value: list[0],
                  items: [
                    DropdownMenuItem(
                        child: Text(
                          list[0],
                          style: TextStyle(
                            fontFamily: 'PoppinsMedium',
                            fontSize: 12,
                            color: Color(0xFF2E3034),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        value: list[0]),
                    DropdownMenuItem(
                        child: Text(
                          list[1],
                          style: TextStyle(
                            fontFamily: 'PoppinsMedium',
                            fontSize: 12,
                            color: Color(0xFF2E3034),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        value: list[1]),
                  ],
                  onChanged: (value) {
                    print(value);
                  },
                  icon: Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Icon(
                      FontAwesomeIcons.angleDown,
                      size: 20,
                      color: Color(0xFF0336FF),
                    ),
                  ),
                ),
              ),
            )),
      ],
    );
  }
}

class PropertiesDropdown extends StatefulWidget {
  double? height; double horizontalPadding;
  PropertiesDropdown({Key? key, this.height, this.horizontalPadding = 20}) : super(key: key);

  @override
  State<PropertiesDropdown> createState() => _PropertiesDropdownState();
}

class _PropertiesDropdownState extends State<PropertiesDropdown> {

  String? selectedValue;
  List list = [
    "Commercial Properties",
    "Residential Properties",
    "Industrial Properties",
    "Land",
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
          onChanged: (selectedAccountType) {
            setState(() {
              selectedValue = selectedAccountType as String?;
            });
          },

          value: selectedValue,
          hint: PoppinsText(text: "Commercial", fontWeight: FontWeight.w500)
          ),

        ),
    );
  }
}

class TypeDropdown extends StatefulWidget {
  double? height; double horizontalPadding;
  TypeDropdown({Key? key, this.height, this.horizontalPadding = 20}) : super(key: key);

  @override
  State<TypeDropdown> createState() => _TypeDropdownState();
}

class _TypeDropdownState extends State<TypeDropdown> {

  String? type;
  List list = [
    'Real Estate',
    'FSP',
    'Service Provider'
  ];

  @override
  Widget build(BuildContext context) {
    return MyContainer(
      horizontalPadding: widget.horizontalPadding,
      height: widget.height == null ? 45 : widget.height,
      width: Get.width, radius: 5, color: white,
      borderColor: black,
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
                type = val as String?;
              });
            },

            value: type,
            hint: PoppinsText(text: "Account type", fontWeight: FontWeight.w500)
        ),

      ),
    );
  }
}

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
            onChanged: (selectedAccountType) {
              setState(() {
                selectedValue = selectedAccountType as String?;
              });
            },

            value: selectedValue,
            hint: PoppinsText(text: "Cleaner  ", fontWeight: FontWeight.w500)
        ),

      ),
    );
  }
}

// class StatusDropDown extends StatelessWidget {
//   const StatusDropDown({
//     Key? key,
//     required this.list,
//     required this.text,
//   }) : super(key: key);
//   final List list;
//   final String text;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(text, style: kLabelTextStyle, textAlign: TextAlign.left),
//         SizedBox(height: 7),
//         Container(
//             height: Get.height * 0.075,
//             width: Get.width,
//             decoration: BoxDecoration(
//               border: Border.all(width: 1, color: kFieldBorderColor),
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(6),
//             ),
//             alignment: Alignment.center,
//
//             child: DropdownButtonHideUnderline(
//               child: ButtonTheme(
//                 alignedDropdown: true,
//                 child: DropdownButton<String>(
//                   itemHeight: 50,
//                   dropdownColor: Colors.white,
//                   elevation: 0,
//                   isExpanded: true,
//                   iconSize: 30,
//                   value: list[0],
//                   items: [
//                     DropdownMenuItem(
//                         child: Text(
//                           list[0],
//                           style: TextStyle(
//                             fontFamily: 'PoppinsMedium',
//                             fontSize: 12,
//                             color: Color(0xFF2E3034),
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                         value: list[0]),
//                     DropdownMenuItem(
//                         child: Text(
//                           list[1],
//                           style: TextStyle(
//                             fontFamily: 'PoppinsMedium',
//                             fontSize: 12,
//                             color: Color(0xFF2E3034),
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                         value: list[1]),
//                     DropdownMenuItem(
//                         child: Text(
//                           list[2],
//                           style: TextStyle(
//                             fontFamily: 'PoppinsMedium',
//                             fontSize: 12,
//                             color: Color(0xFF2E3034),
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                         value: list[2]),
//                     DropdownMenuItem(
//                         child: Text(
//                           list[3],
//                           style: TextStyle(
//                             fontFamily: 'PoppinsMedium',
//                             fontSize: 12,
//                             color: Color(0xFF2E3034),
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                         value: list[3]),
//                     DropdownMenuItem(
//                         child: Text(
//                           list[4],
//                           style: TextStyle(
//                             fontFamily: 'PoppinsMedium',
//                             fontSize: 12,
//                             color: Color(0xFF2E3034),
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                         value: list[4]),
//                   ],
//                   onChanged: (value) {
//                     print(value);
//                   },
//                   icon: Padding(
//                     padding: EdgeInsets.only(right: 10),
//                     child: Icon(
//                       FontAwesomeIcons.angleDown,
//                       size: 20,
//                       color: Color(0xFF0336FF),
//                     ),
//                   ),
//                 ),
//               ),
//             )),
//       ],
//     );
//   }
// }