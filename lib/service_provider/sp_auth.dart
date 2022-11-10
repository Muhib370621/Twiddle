import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../constants/constants.dart';
import 'signup_next.dart';




class ServiceProviderSignup extends StatefulWidget {
  const ServiceProviderSignup({Key? key}) : super(key: key);

  @override
  State<ServiceProviderSignup> createState() => _ServiceProviderSignupState();
}

class _ServiceProviderSignupState extends State<ServiceProviderSignup> {

  final name = TextEditingController(text: 'Martha Hill');
  final contact = TextEditingController(text: '+233');
  final email = TextEditingController(text: 'm@gmail.com');
  final password = TextEditingController(text: 'martha123');

  String? verifyemail = 'empty';
  verifyEmail(String checkemail) async{

      QuerySnapshot emailSnap = await FirebaseFirestore.instance.collection('users').where('email', isEqualTo: checkemail).get();
        if(emailSnap.docs != null && emailSnap.docs.isNotEmpty){
          setState(() {
            verifyemail = emailSnap.docs[0]['email'];
          });
          if(verifyemail == checkemail){
            Fluttertoast.showToast(msg: 'Email already in use');
          }
        }

      else {
        Get.to(()=> SPSignupNext(
          name: name.text,
          profession: profession,
          contact: contact.text,
          password: password.text,
          email: email.text,
        ));
      }


  }



  String profession = 'Cleaner';
  bool show = false;

  List professions = [
    "Cleaner",
    "Painter",
    "Mechanic",
    "Gardener",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
                            image: AssetImage("assets/sp/bg2.png"))),
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
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Height(size: 30),
                      PoppinsText(text: 'Become a Service Provider', size: 22, fontWeight: FontWeight.bold,),
                      PoppinsText(text: 'Respond to the following and proceed.', size: 14, fontWeight: FontWeight.w500, color: hinttext,),
                      Height(size: 20,),
                      PoppinsText(text: 'SIGNUP AS:', fontWeight: FontWeight.w500),
                      Height(),
                      MyTextField(
                        color: white, borderColor: black, radius: 5, hintColor: maincolor,
                        hint: 'Service Provider', enabled: false, height: 50,
                        suffixIcon: Icons.keyboard_arrow_down, suffixIconColor: maincolor
                      ),

                      Height(size: 15,),
                      PoppinsText(text: 'DISPLAY NAME', fontWeight: FontWeight.w500),
                      Height(),
                      MyTextField(
                        color: white, borderColor: black, radius: 5,
                        hint: 'Martha Hill',  height: 50,
                        controller: name,
                      ),

                      Height(size: 15,),
                      PoppinsText(text: 'PROFESSION:', fontWeight: FontWeight.w500),
                      Height(),
                      MyContainer(
                        height: Get.height * 0.075, radius: 5,
                        width: Get.width, borderColor: black,
                        horizontalPadding: 20,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            icon: Icon(Icons.keyboard_arrow_down, color: maincolor,),
                            isExpanded: true,
                            items: professions.map((value) => DropdownMenuItem(
                              child: PoppinsText(text: value, fontWeight: FontWeight.w500),
                              value: value,

                            )).toList(),
                            onChanged: (val){
                              setState(() {
                                profession = (val as String?)!;

                              });
                            },
                            value: profession,
                            hint: PoppinsText(text: "Cleaner", fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),

                      Height(size: 15,),
                      PoppinsText(text: 'PHONE', fontWeight: FontWeight.w500),
                      Height(),
                      MyTextField(
                        color: white, borderColor: black, radius: 5, hint: '',
                        controller: contact,  height: 50, hintColor: black,
                      ),

                      Height(size: 15,),
                      PoppinsText(text: 'EMAIL', fontWeight: FontWeight.w500),
                      Height(),
                      MyTextField(
                          color: white, borderColor: black, radius: 5,
                          hint: 'anne.carry@mail.com', height: 50, controller: email,
                      ),

                      Height(size: 15,),
                      PoppinsText(text: 'PASSWORD', fontWeight: FontWeight.w500),
                      Height(),
                      MyTextField(
                        onSuffixIconTap: (){
                          setState(() {
                            show = !show;
                          });
                        },  height: 50,
                        color: white, borderColor: black, radius: 5,
                        hint: '● ● ● ● ● ●', controller: password,
                        obscureText: show ? false : true,
                        suffixIcon:
                            show ? Icons.remove_red_eye_rounded : Icons.visibility_off_rounded,
                        suffixIconColor: hinttext,

                      ),

                      Height(size: 30),

                      Button(
                        onTap: () {

                          if(name.text.isEmpty || email.text.isEmpty || password.text.isEmpty || contact.text.isEmpty){
                            Fluttertoast.showToast(msg: 'Enter all fields');
                          }
                          else if(!email.text.contains('@')||!email.text.contains('.com')){
                            Fluttertoast.showToast(msg: 'Invalid Email');
                          }
                          else if(profession == null){
                            Fluttertoast.showToast(msg: 'Please select Profession');
                          }
                          else {
                            verifyEmail(email.text);
                          }
                        },
                        height: 50,
                        text: 'Continue',
                      ),

                      Height(size: 30),


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