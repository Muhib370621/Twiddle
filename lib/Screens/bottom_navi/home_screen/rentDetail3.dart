import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:state_agent/constants/constants.dart';

import '../../../Utilities/comp_screen.dart';
import '../service_screen/paymentSuccess.dart';
import 'addLandLord.dart';


class RentDetail3 extends StatefulWidget {
  const RentDetail3({Key? key}) : super(key: key);

  @override
  State<RentDetail3> createState() => _RentDetail3State();
}

class _RentDetail3State extends State<RentDetail3> {
  final search = TextEditingController();
  bool? checkBoxValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: Get.height * 0.06,
              ),
              Row(
                children: [
                  RoundBackButton(),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'PAYMENT OF INITIAL RENT',
                    style: TextStyle(
                      fontFamily: "PoppinsBold",
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              Text(
                "Search Or Add Your Landlord's\nDetails Below",
                style: kBlueHeadingStyle.copyWith(fontSize: 16),
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              SearchBar(),
              SizedBox(
                height: Get.height * 0.015,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return AddLandLord();
                    }),
                  );
                },
                child: Text(
                  'Add New Landlord Here',
                  style: TextStyle(
                    fontFamily: "PoppinsMedium",
                    fontSize: 14,
                    decoration: TextDecoration.underline,
                    color: Color(0xFF1492E6),
                  ),
                ),
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              divider(),
              SizedBox(
                height: Get.height * 0.02,
              ),
              Text(
                "Advance Payments",
                style: kBlueHeadingStyle.copyWith(fontSize: 16),
              ),
              SizedBox(
                height: Get.height * 0.008,
              ),
              Row(
                children: [
                  Text(
                    'The below was estimated based on your preference.',
                    style: kGreySmallText,
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Text(
                    'Change?',
                    style: kGreySmallText.copyWith(color: Color(0xFF1492E6)),
                  ),
                ],
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              priceField('First Three (3) Months', 'Ghc 450'),
              SizedBox(
                height: Get.height * 0.03,
              ),
              priceField('Mediation Fee', 'Ghc 216'),
              SizedBox(
                height: Get.height * 0.02,
              ),
              divider(),
              SizedBox(
                height: Get.height * 0.02,
              ),
              Row(
                children: [
                  Text(
                    'Total',
                    style: kBlueHeadingStyle.copyWith(
                      fontFamily: "PoppinsBold",
                      fontSize: 18,
                    ),
                  ),
                  Spacer(),
                  Text(
                    'Ghc 666',
                    style: kBlueHeadingStyle.copyWith(
                      fontFamily: "PoppinsBold",
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: Get.height * 0.04,
              ),
              Container(
                height: Get.height * 0.28,
                width: Get.width,
                decoration: BoxDecoration(
                  color: Color(0xFFF2F5FF),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      spreadRadius: 0.1,
                    ),
                  ],
                ),
                padding:
                    EdgeInsets.only(top: 30, bottom: 30, left: 25, right: 25),
                child: Text(
                  "This option estimates the amount of money to be paid by the renter in order for the renter to qualify for Twiddle's Pay-as-you-stay offer\n\n. The estimation is done by multiplying the rent rate by 3 (e.g. GHC150 x 3 Months = GHC450). This is the minimum advance deposit required by Twiddle.",
                  style: kGreySmallText.copyWith(wordSpacing: 1),
                ),
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    value: checkBoxValue,
                    onChanged: (value) {
                      setState(() {
                        checkBoxValue = value;
                      });
                    },
                  ),
                  Text(
                    "I Agree to Twiddle INV's",
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: "PoppinsMedium",
                        color: Color(0xFF2E3034)),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Terms & Conditions',
                    style: TextStyle(
                      color: bhinttext,
                      decoration: TextDecoration.underline,
                      fontSize: 12,
                      fontFamily: "PoppinsMedium",
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),

              checkBoxValue == true?
              CustomBlueButton(
                height: Get.height * 0.075,
                width: Get.width,
                text: 'Make Payment',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return PaymentSuccess();
                    }),
                  );
                },
                fontSize: 14,
              ) :
              CustomBlueButton(
                height: Get.height * 0.075,
                width: Get.width,
                text: 'Make Payment',
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) {
                  //     return PaymentSuccess();
                  //   }),
                  // );
                  showDialog(
                      context: (context),
                      builder: (context)=>
                          Dialog(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              height: 60.h, width: double.infinity,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 18.h),
                                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        PoppinsText(text: "First agree to our "),
                                        PoppinsText(text: "Terms & conditions", color: maincolor,),
                                      ],
                                    ),
                                    InkWell(
                                      onTap: (){
                                        //Navigator.pop(context);
                                        Get.back();
                                        },
                                      child: Center(
                                        child: PoppinsText(text: "OK", fontWeight: FontWeight.bold, color: Colors.green,),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                  );
                },
                fontSize: 14,
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: Get.height * 0.06,
        width: Get.width,
        padding: const EdgeInsets.only(left: 22, bottom: 3),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Color(0xFFE9E9EC),
          borderRadius: BorderRadius.circular(40),
        ),
        child: TextField(
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontFamily: "PoppinsMedium",
            fontSize: 12,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Search landlord by name',
            hintStyle: GoogleFonts.poppins(
              fontSize: 12.sp,
              color: hinttext
            ),
          ),
        ),
      ),
    );
  }
}

Widget divider() {
  return Container(
    height: 0.2,
    width: Get.width,
    color: Color(0xFF707070),
  );
}

Widget priceField(String text, String price,) {return Row(
    children: [
      Text(
        text,
        style: kGreySmallText.copyWith(fontSize: 14),
      ),
      Spacer(),
      Text(
        price,
        style: TextStyle(
          fontFamily: "PoppinsMedium",
          fontSize: 14,
          color: Color(0xFF2E3034),
        ),
      ),
      SizedBox(
        width: Get.width * 0.022,
      ),
      Icon(
        Icons.info_outline,
        color: Color(0xFF1492E6),
        size: 20,
      ),
    ],
  );}
