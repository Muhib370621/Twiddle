import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../constants/constants.dart';

class PaymentOfInitialRent extends StatefulWidget {
  const PaymentOfInitialRent({Key? key}) : super(key: key);

  @override
  State<PaymentOfInitialRent> createState() => _PaymentOfInitialRentState();
}

class _PaymentOfInitialRentState extends State<PaymentOfInitialRent> {

  bool isChecked = false;
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
                
                Height(size: 50),
                
                BackButtonText(text: "PAYMENT OF INITIAL RENT", fontWeight: FontWeight.bold,),

                Height(size: 20,),

                PoppinsText(text: "Search Or Add Your Landlord's Details Below", color: maincolor, size: 16,),

                Height(size: 10,),
                
                PoppinsText(text: "text"),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                  width: Get.width,
                  height: 50.h,
                  decoration: BoxDecoration(
                    color: lightButton,
                    borderRadius: BorderRadius.circular(30.r)
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      label: PoppinsText(text: "Search landlord by name", color: silver, fontWeight: FontWeight.w500)
                    ),
                  )
                ),

                Height(size: 10,),

                PoppinsText(text: "Add New Landlord Here", size: 14, color: maincolor,),

                Height(size: 20,),

                kDivider(),

                Height(size: 20,),

                PoppinsText(text: "Advance Payments", size: 14, color: maincolor),

                Height(),

                Row(
                  children: [
                    PoppinsText(text: "The below was estimated based on your preference.", size: 10, color: silver, fontWeight: FontWeight.bold),
                    Width(),
                    PoppinsText(text: "Change?", size: 10, color: maincolor, fontWeight: FontWeight.bold)
                  ],
                ),

                Height(size: 15,),

                TextIcon(text1: "First Three (3) Months", text2: "Ghc 450", color1: silver, size1: 14,),

                Height(size: 20,),

                TextIcon(text1: "Mediation Fee", text2: "Ghc 216", color1: silver, size1: 14,),

                Height(size: 20,),

                kDivider(),

                Height(size: 20,),

                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PoppinsText(text: "Total", fontWeight: FontWeight.bold, size: 18, color: maincolor,),
                    PoppinsText(text: "Ghc 666", fontWeight: FontWeight.bold, size: 18, color: maincolor,),
                  ],
                ),

                Height(size: 30),

                Box(
                  height: 210,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
                    child: Column(
                      children: [
                        PoppinsText(text: "This option estimates the amount of money to be paid", size: 10, color: silver,),
                        Height(),
                        PoppinsText(text: "by the renter in order for the renter to qualify for", size: 10, color: silver,),
                        Height(),
                        PoppinsText(text: "Twiddle's Pay-as-you-stay offer.", size: 10, color: silver,),
                        Height(size: 20,),
                        PoppinsText(text: "The estimation is done by multiplying the rent rate by 3", size: 10, color: silver,),
                        Height(),
                        PoppinsText(text: " (e.g. GHC150 x 3 Months = GHC450). This is the minimum", size: 10, color: silver,),
                        Height(),
                        PoppinsText(text: "advance deposit required by Twiddle.", size: 10, color: silver,)
                      ],
                    ),
                  ),
                ),

                Height(size: 20,),
                
                Row(
                  children: [
                    Checkbox(
                        value: isChecked,
                        onChanged: (bool? value){
                          setState(() {
                            isChecked = value!;
                          });
                        }),
                    PoppinsText(text: "I Agree to Twiddle INV's"),
                    PoppinsText(text: "Terms & Conditions", color: maincolor,)
                  ],
                ),

                Height(size: 30,),
                
                Button(
                  onTap: (){

                  },
                  text: "Make Payment", size: 14, fontWeight: FontWeight.w500,),

                Height(size: 20,),

                Container(
                    padding: EdgeInsets.symmetric(horizontal: 25.w),
                    child: Column(
                      children: [
                        PoppinsText(text: "Note: Your instalment starts four weeks after this", size: 10, color: silver,),
                        Height(),
                        PoppinsText(text: "transaction. You may make payments anytime within", size: 10, color: silver,),
                        Height(),
                        PoppinsText(text: "this stipulated time.", size: 10, color: silver,),
                      ],
                    )),

                Height(size: 40,),
                
                ],
            ),
          ),
        ),
      ),
    );
  }
}