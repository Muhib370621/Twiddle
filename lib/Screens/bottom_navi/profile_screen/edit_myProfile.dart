import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Utilities/comp_screen.dart';
import '../../../constants/constants.dart';
import '../../user_auth/signUpController.dart';
import 'edit_profileNext.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final fName = TextEditingController();
  final lname = TextEditingController();
  final contact = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final control = SignUpController();

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
                      SizedBox(height: 5),
                      PoppinsText(text: 'Respond to the following and proceed.', color: hinttext),
                      SizedBox(height: 20),
                      CustomEditedFiled(
                        enabled: false,
                        width: Get.width,
                        height: Get.height*0.075,
                        text: "PROFILE TYPE",
                        hintText: "Renter/User",
                        controller: fName,
                        hintTextColor: kCreateAccountHintColor,
                      ),
                      SizedBox(height: 15),
                      CustomEditProfile(
                        width: Get.width,
                        height: Get.height*0.075,
                        text: "FIRST NAME",
                        hintText: "Margaret",
                        controller: fName,
                        hintTextColor: kCreateAccountHintColor,
                      ),
                      SizedBox(height: 15),
                      CustomEditProfile(
                        width: Get.width,
                        height: Get.height*0.075,
                        text: "SURNAME NAME",
                        hintText: "Novakowska",
                        controller: lname,
                        hintTextColor: kCreateAccountHintColor,
                      ),
                      SizedBox(height: 15),
                      CustomEditProfile(
                        width: Get.width,
                        height: Get.height*0.075,
                        text: "PHONE",
                        hintText: "+233 30 366 9257",
                        controller: contact,
                        hintTextColor: kCreateAccountHintColor,
                      ),
                      SizedBox(height: 15),
                      CustomEditProfile(
                        width: Get.width,
                        height: Get.height*0.075,
                        text: "EMAIL",
                        hintText: "anne.carry@mail.com",
                        controller: email,
                        hintTextColor: kCreateAccountHintColor,
                      ),
                      SizedBox(height: 15),
                      CustomPassField(
                        hintText: "********",
                        controller: password,
                        signupController: control,
                        text: "PASSWORD",
                        hintTextColor: kCreateAccountHintColor,
                      ),
                      SizedBox(height: 40,),
                      CustomBlueButton(
                        width: Get.width,
                        height: Get.height*0.075,
                        fontSize: 15,
                        text: "Continue",
                        onPressed: () {Get.to(()=>EditProfNext());},
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
