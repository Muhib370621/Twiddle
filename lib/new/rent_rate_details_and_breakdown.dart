import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../constants/constants.dart';
import 'payment_of_initial_rent_before.dart';

class RentRateDetailsAndBreakdown extends StatelessWidget {
  const RentRateDetailsAndBreakdown({Key? key}) : super(key: key);

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

              BackButtonText(text: "RENT RATE DETAILS AND BREAKDOWN", fontWeight: FontWeight.bold,),

              Height(size: 20),

              PoppinsText(text: "Rent Payment Details", size: 16, color: maincolor,),

              Height(size: 12,),

              TextIcon(text1: "Rent Rate Per Month", text2: "Ghc 150"),

              Height(size: 20,),

              TextIcon(text1: "3 Years (36 Months)", text2: "Ghc 5,400"),

              Height(size: 20,),

              kDivider(),

              Height(size: 20,),

              PoppinsText(text: "Service Fees/Charges", size: 16, color: maincolor,),

              Height(size: 12,),

              TextIcon(text1: "Mediation Fee (4%)", text2: "Ghc 216"),

              Height(size: 20,),

              TextIcon(text1: "3% Interest Per Month", text2: "Ghc 148.5"),

              Height(size: 20,),

              TextIcon(text1: "Frist Three (3) Months Rent Deposit", text2: "Ghc 450"),

              Height(size: 20,),

              kDivider(),

              Height(size: 20,),

              PoppinsText(text: "Repayment Details", size: 16, color: maincolor,),

              Height(size: 12,),

              TextIcon(text1: "Instalment Frequency", text2: "Monthly", color2: maincolor),

              Height(size: 20,),

              TextIcon(text1: "Monthly Instalment", text2: "Ghc 154.5"),

              Height(size: 20,),

              TextIcon(text1: "No. Of Instalments", text2: "36"),

              Height(size: 20,),

              kDivider(),

              Height(size: 20,),

              TextIcon(text1: "Actual Rent", text2: "Ghc 4,950", color1: black),

              Height(size: 12,),

              TextIcon(text1: "36 Months Interest", text2: "Ghc 5,346", color1: black),

              Height(size: 20,),

              TextIcon(text1: "Total Rent Payment", text2: "Ghc 10,296", color2: maincolor, color1: maincolor),

              Height(size: 20,),
              
              Button(
                  onTap: (){
                    Get.to(PaymentOfInitialRent());
                  },
                  text: "Continue"),
              
              Height(size: 40,),



            ],),
          ),
        ),
      ),
    );
  }
}
