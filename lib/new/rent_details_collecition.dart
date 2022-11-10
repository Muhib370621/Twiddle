import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Utilities/comp_screen.dart';
import '../constants/constants.dart';
import 'rent_rate_details_and_breakdown.dart';


class RentDetailsCollection extends StatefulWidget {
  const RentDetailsCollection({Key? key}) : super(key: key);

  @override
  State<RentDetailsCollection> createState() => _RentDetailsCollectionState();
}

class _RentDetailsCollectionState extends State<RentDetailsCollection> {

  String? selectedFunder;
  List funder = [
    "Renter/User",
    "Property Owner",
    "Real Estate Agent",
    "FSP",
    "Service Provider"
  ];

  String? selectedYear;
  List years = [
    "One Year (12 Months)",
    "Two Year (24 Months)",
    "Three Year (36 Months)",
    "Four Year (48 Months)",
  ];

  String? selectedSchedule;
  List schedule = [
    "Weekly",
    "Monthly",
    "Yearly",
    "Decade"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(

        child: SingleChildScrollView(

          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,

              children: [


                Height(size: 50,),

                Row(
                  children: [
                    RoundBackButton(),
                    Width(size: 10),
                    PoppinsText(text: "RENT DETAILS COLLECTION", fontWeight: FontWeight.bold,)
                  ],
                ),

                Height(size: 20,),

                PoppinsText(text: "Make Advance Payments", color: maincolor, size: 14,),

                Height(),

                PoppinsText(text: "Switch to indicate your preference", color: silver, size: 10,),

                Height(size: 10,),
                
                TextSwitchButton(text: "First Three (3) Months", fontWeight: FontWeight.w500, boolValue: true),

                Height(size: 10,),

                TextSwitchButton(text: "First Six (6) Months", fontWeight: FontWeight.w500),

                Height(size: 15,),

                PoppinsText(text: "Period Occupancy", size: 14, color: maincolor),

                Height(),

                PoppinsText(text: "Tap to select how long you would want to stay in this property.", size: 10, color: silver,),

                Height(size: 10,),

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
                      icon: Icon(Icons.keyboard_arrow_down, color: maincolor,),
                      isExpanded: true,
                      items: years.map((value) => DropdownMenuItem(
                        child: Text(value ,
                            style: GoogleFonts.poppins(
                              fontSize: 12.sp,
                              color: black,
                            )),
                        value: value,

                      )).toList(),
                      onChanged: (selectedvalue){
                        setState(() {
                          selectedYear = selectedvalue as String?;

                        });
                      },

                      value: selectedYear,
                      hint: Text("3 Years (36 Months)",
                          style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            color: black,
                            fontWeight: FontWeight.w500,
                          )
                      ),

                    ),
                  ),
                ),

                Height(size: 15,),

                PoppinsText(text: "Instalment Frequency", color: maincolor, size: 14),

                Height(),

                PoppinsText(text: "Select your repayment schedule", size: 10, color: silver),

                Height(size: 10,),

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
                      icon: Icon(Icons.keyboard_arrow_down, color: maincolor,),
                      isExpanded: true,
                      items: schedule.map((value) => DropdownMenuItem(
                        child: Text(value ,
                            style: GoogleFonts.poppins(
                              fontSize: 12.sp,
                              color: black,
                            )),
                        value: value,

                      )).toList(),
                      onChanged: (selectedvalue){
                        setState(() {
                          selectedSchedule = selectedvalue as String?;

                        });
                      },

                      value: selectedSchedule,
                      hint: Text("Monthly",
                          style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            color: black,
                            fontWeight: FontWeight.w500,
                          )
                      ),

                    ),
                  ),
                ),

                Height(size: 15,),

                PoppinsText(text: "Funder", color: maincolor, size: 14),

                Height(),

                PoppinsText(text: "Select your preferred funder", size: 10, color: silver,),

                Height(size: 15,),

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
                      icon: Icon(Icons.keyboard_arrow_down, color: maincolor,),
                      isExpanded: true,
                      items: funder.map((value) => DropdownMenuItem(
                        child: Text(value ,
                            style: GoogleFonts.poppins(
                              fontSize: 12.sp,
                              color: black,
                            )),
                        value: value,

                      )).toList(),
                      onChanged: (selectedAccountType){
                        setState(() {
                          selectedFunder = selectedAccountType as String?;

                        });
                      },

                      value: selectedFunder,
                      hint: Text("Ghana Commercial Bank",
                          style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            color: black,
                            fontWeight: FontWeight.w500,
                          )
                      ),

                    ),
                  ),
                ),

                Height(size: 100,),
                
                Button(
                    onTap: (){
                      Get.to(RentRateDetailsAndBreakdown());
                    },
                    text: "Continue"),

                Height(size: 40,)




              ],
            ),
          ),
        ),
      ),
    );
  }
}
