import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:state_agent/Screens/bottom_navi/profile_screen/profile_occup.dart';

import '../../../Utilities/comp_screen.dart';
import '../../../constants/constants.dart';
import '../../user_auth/signUpController.dart';



class EditProfNext extends StatefulWidget {
  const EditProfNext({Key? key}) : super(key: key);

  @override
  State<EditProfNext> createState() => _EditProfNextState();
}

class _EditProfNextState extends State<EditProfNext> {

  final fName = TextEditingController();
  final userName = TextEditingController();
  final mobile = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final control = SignUpController();
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  String? selectedStatus;

  List status = [
    "Renter/User",
    "Property Owner",
    "Real Estate Agent",
    "FSP",
    "Service Provider"
  ];

  String? selectedmaritalStatus;

  List maritalStatus = [
    "Married",
    "Unmarried",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            child: SizedBox(
                width: Get.width,
                height: Get.height * 0.3,
                child: Container(
                    width: Get.width,
                    height: 32,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/reg.png"))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 40),
                        Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Container(
                            width: Get.width*0.08,
                            height: Get.height*0.05,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Icon(Icons.arrow_back_ios_rounded, color: Colors.black, size: 20,),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ))

            ),
          ),
          Positioned.fill(
            top: Get.height * 0.22,
            child: Container(
              height: Get.height * 0.6,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(26),
                  topRight: Radius.circular(26),
                ),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 25,right: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 30),
                      Text("My Profile ", style: kLargeTextStyle),
                      SizedBox(height: 5),
                      Text("Respond to the following and proceed.", style: TextStyle(fontSize: 11,color: Color(0xff8F92A1))),
                      SizedBox(height: 10),
                      Image.asset("assets/profile.png",width: 70,height: 70),
                      SizedBox(height: 10),
                      Text("Select a presentable photo for yourself this is very important.", style: TextStyle(fontSize: 11,color: Color(0xff8F92A1))),
                      SizedBox(height: 20),

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

                              });
                            },

                            value: selectedStatus,
                            hint: Text("Renter/User",
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  color: black,
                                  fontWeight: FontWeight.w500,
                                )
                            ),

                          ),
                        ),
                      ),

                      SizedBox(height: 15),
                      Text("DATE OF BIRTH:", style: kLabelTextStyle, textAlign: TextAlign.left),
                      SizedBox(height: 10),
                      InkWell(
                        onTap: () => _selectDate(context),
                        child: Container(
                          width: Get.width,
                          height: Get.height*0.075,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(width: 1,color: Color(0xff707070))

                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15,right: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("${selectedDate.toLocal()}".split(' ')[0],style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold)),
                                SvgPicture.asset("assets/calendar.svg",width: 25,height: 25)
                              ],
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 15),
                      CustomEditedFiled(
                        width: Get.width,
                        height: Get.height*0.075,
                        text: "IDENTIFICATION TYPE:",
                        hintText: "Ghana Card",
                        controller: fName,
                        hintTextColor: kCreateAccountHintColor,
                      ),



                      SizedBox(height: 15),
                      Text("UPLOAD PHOTO OF ID:", style: kLabelTextStyle, textAlign: TextAlign.left),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Photo("assets/camera.png","Front"),
                          Photo("assets/camera.png","Back"),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Submitted",style: TextStyle(color: Color(0xff01E08F),fontSize: 15)),
                                  SizedBox(width: 5),
                                  Icon(Icons.check_circle, color: active, size: 20.sp)
                                ]

                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text("Approved",style: TextStyle(color: Color(0xff1492E6),fontSize: 15)),
                                    SizedBox(width: 7),
                                    Icon(Icons.check_circle, color: maincolor, size: 20.sp)
                                  ]

                              )

                            ],
                          )
                        ],
                      ),







                      SizedBox(height: 15),

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

                            items: maritalStatus.map((value) => DropdownMenuItem(
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
                                selectedmaritalStatus = selectedAccountType as String?;

                              });
                            },

                            value: selectedmaritalStatus,
                            hint: Text("MARITAL STATUS",
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  color: black,
                                  fontWeight: FontWeight.w500,
                                )
                            ),

                          ),
                        ),
                      ),

                      SizedBox(height: 15),
                      CustomEditProfile(
                        width: Get.width,
                        height: Get.height*0.075,
                        text: "MONTHLY INCOME:",
                        hintText: "Ghc 2000 - Ghc 5000",
                        controller: email,
                        hintTextColor: kCreateAccountHintColor,
                      ),
                      SizedBox(height: 40),
                      CustomBlueButton(
                        width: Get.width,
                        height: Get.height*0.075,
                        fontSize: 15,
                        text: "Continue",
                        onPressed: () {
                          Get.to(()=>ProfileOccDetail());
                        },
                      ),
                      SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}


Widget Photo(String camera,String title){
  return MyContainer(
    width: 110, radius: 10,
    height: 50, color: hinttext,
     child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(camera,width: 30,height: 30),
        SizedBox(width:5),
        Text(title,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15))

      ],
    ),
  );
}