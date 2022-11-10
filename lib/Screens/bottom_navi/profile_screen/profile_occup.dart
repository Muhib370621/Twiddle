import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Utilities/comp_screen.dart';
import '../../../constants/constants.dart';
import '../../../constants/dropdowns.dart';

class ProfileOccDetail extends StatefulWidget {
  const ProfileOccDetail({Key? key}) : super(key: key);

  @override
  State<ProfileOccDetail> createState() => _ProfileOccDetailState();
}

class _ProfileOccDetailState extends State<ProfileOccDetail> {
  final fName = TextEditingController();
  final userName = TextEditingController();
  final mobile = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final control = SignUpController();



  bool isChecked = false;
  bool _switchValue1=true;
  bool _switchValue2=true;

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
                      Text("My Profile", style: kLargeTextStyle),
                      SizedBox(height: 10),
                      PoppinsText(text: 'Respond to the following and proceed.', color: hinttext),
                      SizedBox(height: 10),
                      Text("Occupational Details", style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold)),
                      SizedBox(height: 20),

                      Text("EMPLOYMENT STATUS:",style: kLabelTextStyle),
                      SizedBox(height: 7),
                      Container(
                        width: Get.width,
                        height: Get.height*0.075,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Colors.white,
                            border: Border.all(width: 1,color: Color(0xff707070))

                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Employed",style: TextStyle(fontSize: 15,color: Colors.black)),
                              Transform.scale(
                                scale: 0.7,
                                child: CupertinoSwitch(
                                  activeColor: Color(0XFF0336FF),

                                  value: _switchValue2,
                                  onChanged: (value) {
                                    setState(() {
                                      _switchValue2 = value;
                                    });
                                  },
                                ),
                              )



                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: Get.width,
                        height: Get.height*0.075,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Colors.white,
                            border: Border.all(width: 1,color: Color(0xff707070))

                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Self Employed",style: TextStyle(fontSize: 15,color: Colors.black)),

                              Transform.scale(
                                scale: 0.7,
                                child: CupertinoSwitch(
                                  activeColor: Color(0XFF0336FF),

                                  value: _switchValue1,
                                  onChanged: (value) {
                                    setState(() {
                                      _switchValue1 = value;
                                    });
                                  },
                                ),
                              )



                            ],
                          ),
                        ),
                      ),







                      SizedBox(height: 15),
                      CustomEditProfile(
                        width: Get.width,
                        height: Get.height*0.075,
                        text: "ROLE/DESIGNATION:",
                        hintText: "App Developer",
                        controller: fName,
                        hintTextColor: kCreateAccountHintColor,
                      ),
                      SizedBox(height: 15),
                      Text("NO. OF YEARS EMPLOYED:",style: kLabelTextStyle),
                      SizedBox(height: 7),
                      Container(
                        width: Get.width,
                        height: Get.height*0.075,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Colors.white,
                          border: Border.all(width: 1,color: Color(0xff707070))

                        ),
                        child: Center(
                          child: SimpleDropDown(
                            list: [
                              "5 Years",
                              "4 Years",
                              "3 Years",
                              "2 Years",
                            ],
                            text: "5 Years",
                            icon: Icon(Icons.arrow_drop_down, size: 25, color: Color(0xFF9C9C9C)),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      CustomEditProfile(
                        width: Get.width,
                        height: Get.height*0.075,
                        text: "NAME OF COMPANY:",
                        hintText: "Renexcode Software Development Compa...",
                        controller: mobile,
                        hintTextColor: kCreateAccountHintColor,
                      ),
                      SizedBox(height: 15),
                      CustomEditProfile(
                        width: Get.width,
                        height: Get.height*0.075,
                        text: "DIGITAL ADDRESS:",
                        hintText: "GS-236-8895",
                        controller: email,
                        hintTextColor: kCreateAccountHintColor,
                      ),
                      SizedBox(height: 15),
                      CustomEditProfile(
                        width: Get.width,
                        height: Get.height*0.075,
                        text: "EMPLOYER'S CONTACT:",
                        hintText: "+233271516321",
                        controller: userName,
                        hintTextColor: kCreateAccountHintColor,
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Container(
                            width: 30,
                            child:  Checkbox(
                              value: isChecked,
                              side: BorderSide(color: Colors.grey),
                              onChanged: (bool? value) { // This is where we update the state when the checkbox is tapped
                                setState(() {
                                  isChecked = value!;
                                });
                              },
                            ),
                          ),
                          Text(" I Agree to Twiddle INV's", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 14)),
                          Text(" Terms & Conditions", style: TextStyle(color: Color(0xff1492E6), fontWeight: FontWeight.w500, fontSize: 14)),

                        ],
                      ),







                      SizedBox(height: 40,),
                      CustomBlueButton(
                        width: Get.width,
                        height: Get.height*0.075,
                        fontSize: 15,
                        text: "Finish",
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pop(context);
                          Navigator.pop(context);
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






