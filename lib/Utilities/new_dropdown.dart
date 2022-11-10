import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/constants.dart';
import '../constants/dropdowns.dart';
import 'comp_screen.dart';

class NewDropdown extends StatefulWidget {


  const NewDropdown({
    Key? key,
  }) : super(key: key);

  @override
  State<NewDropdown> createState() => _NewDropdownState();
}

class _NewDropdownState extends State<NewDropdown> {


  String? selectedStatus;
  Color color = Color(0xFF2E3034);

  List status = [
    "Renter/User",
    "Property Owner",
    "Real Estate Agent",
    "FSP",
    "Service Provider"
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomDropDown(
                  text: "Renter/User",
                  item1: "Renter/User",
                  item2: "Property Owner",
                  item3: "Real Estate Agent",
                  item4: "FSP",
                  item5: "Service Provider",
                              ),
                SizedBox(height: 20.h,),

                Container(
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
                      items: status.map((value) => DropdownMenuItem(
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
                          selectedStatus = selectedAccountType as String?;
                          color = maincolor;
                        });
                      },

                      value: selectedStatus,
                      hint: Text("Choose Status Type",
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: color,
                            fontWeight: FontWeight.w500,
                          )
                      ),

                    ),
                  ),
                ),

                SizedBox(height: 20.h,),

                PublicDropdown(),
                SizedBox(height: 20.h,),

                CustomEditedSearch(
                  width: Get.width,
                  height: 50.h,
                  controller: TextEditingController(),
                  hintText: "",
                ),

                SizedBox(height: 20.h,),

                SizedBox(height: 20.h,),

                SizedBox(height: 20.h,),


                SizedBox(height: 20.h,),

                WhiteBackButton(),
                SizedBox(height: 20.h,),
                RoundBackButton(),
                SizedBox(height: 20.h,),



                CustomSuccess(
                  height: 60.h, width: 200.w,
                  text: "TEXT",
                  onPressed: (){
                    print("Pressed");
                  },
                ),

                SizedBox(height: 20.h,),

                CustomListP(
                  height: 60.h, width: 200.w,
                  text: "TEXT",
                  fontSize: 18.sp,
                  onPressed: (){
                    print("Pressed");
                  },
                ),

                SizedBox(height: 20.h,),

                CustomListUnSel(
                  height: 60.h, width: 200.w,
                  text: "TEXT",
                  fontSize: 18.sp,
                  onPressed: (){
                    print("Pressed");
                  },
                ),



                SizedBox(height: 20.h,),

                Otp(),

                SizedBox(height: 20.h,),

                RaisedButton(onPressed: (){
                  print(selectedStatus);
                },
                child: Text("Press"),)
              ],
            ),
          ),

        ),
    );
  }
}


class CustomDropDown extends StatefulWidget {
  final String text;
  final String item1;
  final String item2;
  final String item3;
  final String item4;
  final String item5;

  const CustomDropDown({
    Key? key,
    required this.text,
    required this.item1,
    required this.item2,
    required this.item3,
    required this.item4,
    required this.item5
  }) : super(key: key);

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {

  GlobalKey? actionkey;
  double? height, width, xPosition, yPosition;
  bool isOpened = false;
  OverlayEntry? floatingDropdown;

  @override
  void initState() {
    actionkey = LabeledGlobalKey(widget.text);
    super.initState();
  }

  void findDropdownData(){

    RenderBox renderBox = actionkey?.currentContext!.findRenderObject()! as RenderBox;
    height = renderBox.size.height;
    width = renderBox.size.width;
    Offset offset = renderBox.localToGlobal(Offset.zero);
    xPosition = offset.dx;
    yPosition = offset.dy;
  }


  OverlayEntry createFloatingDropdown(){
    return OverlayEntry(
        builder: (context){
          return Positioned(
            left: xPosition,
            width: width,
            top: yPosition! + height!,
            height: 5*height!+40,
            child: Dropdown(itemheight: 5,
                item1: widget.item1,
                item2: widget.item2,
                item3: widget.item3,
                item4: widget.item4,
                item5: widget.item5
            )
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: actionkey,
      onTap: (){

        setState(() {
          if(isOpened == false){
            findDropdownData();
            floatingDropdown = createFloatingDropdown();
            Overlay.of(context)?.insert(floatingDropdown!);
            isOpened = true;
          }else{
            floatingDropdown?.remove();
            isOpened = false;
          }
        });
      },
      child: Container(
        height: Get.height * 0.075,
        width: Get.width,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: grey),
          color: Colors.white,
          borderRadius: BorderRadius.circular(6.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.text,
                style: TextStyle(
                  fontFamily: "Poppins, Medium",
                  fontSize: 12
                ),
              ),
              isOpened ?
              Icon(Icons.keyboard_arrow_up, size: 20.sp, color: Color(0xff0336FF)) :
              Icon(Icons.keyboard_arrow_down, size: 20.sp, color: Color(0xff0336FF))
            ],
          ),
        ),
      ),
    );
  }
}

class Dropdown extends StatelessWidget {
  const Dropdown({
    Key? key,
    required this.item1,
    required this.item2,
    required this.item3,
    required this.item4,
    required this.item5,
    required this.itemheight,
  }) : super(key: key);

  final String item1, item2, item3, item4, item5;
  final double itemheight;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4*itemheight,
      child: Column(
        children: [
          DropdownItem(text: item1),
          DropdownItem(text: item2),
          DropdownItem(text: item3),
          DropdownItem(text: item4),
          DropdownItem(text: item5),
        ],
      ),
    );
  }
}

class DropdownItem extends StatefulWidget {
  final String text;
  bool isSelected;

  DropdownItem({
    Key? key,
    required this.text,
    this.isSelected = false,
  }) : super(key: key);

  @override
  State<DropdownItem> createState() => _DropdownItemState();
}

class _DropdownItemState extends State<DropdownItem> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 20,
      child: InkWell(
        onTap: (){
          setState(() {
            widget.isSelected = true;

          });
        },
        child: Container(
          height: Get.height * 0.075,
          width: Get.width,

          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
            child: Text(widget.text,
              style: TextStyle(
                  fontFamily: "Poppins, Medium",
                  fontSize: 12,
                color: widget.isSelected?Color(0xff0336FF) : Color(0XFF9C9C9C)
              ),
            ),
          ),
        ),
      ),
    );
  }
}

