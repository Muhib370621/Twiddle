import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:state_agent/Screens/property_owner/user_details/signup_bank.dart';
import 'package:state_agent/Utilities/datePicker.dart';

import '../../../Utilities/comp_screen.dart';
import '../../../constants/constants.dart';
import '../../../constants/methods.dart';
import '../../user_auth/signUpController.dart';

class SignUpOwner extends StatefulWidget {
  const SignUpOwner({Key? key}) : super(key: key);

  @override
  State<SignUpOwner> createState() => _SignUpOwnerState();
}

class _SignUpOwnerState extends State<SignUpOwner> {

  final name = TextEditingController();
  final houseNo = TextEditingController();
  final streetName = TextEditingController();
  final gpsName = TextEditingController();
  final contact = TextEditingController();
  final email = TextEditingController();
  final social = TextEditingController();
  final nationalId = TextEditingController();
  final password = TextEditingController();
  final control = SignUpController();

  final ImagePicker _picker = ImagePicker();

  XFile? _image;

  Future getImagefromcamera() async {
    var image = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
      print(_image!.path);
    });
  }

  Future getImagefromGallery() async {
    var image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {

      _image = image;

      print('file path----${_image!.path}');
    });
  }

  List status = [
    "Renter/User",
    "Property Owner",
    "Real Estate Agent",
    "FSP",
    "Service Provider"
  ];
  List idtype = [
    "ID Type 1",
    "ID Type 2",
    "ID Type 3",
    "ID Type 4",
  ];
  String? nationalIdType;
  String selectedStatus = "Property Owner";

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        getImagefromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      getImagefromcamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }




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
                      SizedBox(height: 25),
                      Text("Create new account", style: kLargeTextStyle),
                      SizedBox(height: 3),
                      PoppinsText(text: 'Respond to the following and proceed.', color: hinttext),
                      SizedBox(height: 10),
                      _image != null ?
                      Container(
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.file(File(_image!.path), width: 50, height: 50, fit: BoxFit.cover,)),
                      ) :
                      Container(
                          height: 70,
                          width: 70,
                          decoration: const BoxDecoration(
                              color: Color(0xffE9E9EC),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50),
                                topRight: Radius.circular(50),
                                bottomRight: Radius.circular(50),
                                bottomLeft: Radius.circular(50),
                              )
                          ),
                          child: InkWell(
                              onTap: (){
                                _showPicker(context);
                              },
                              child:Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Image.asset("assets/camp.png",color: Colors.black,width: 10,height: 10,),
                              )
                          ),
                      ),

                      SizedBox(height: 10),
                      PoppinsText(text: 'Select a presentable photo for yourself this is very important.', color: hinttext),
                      SizedBox(height: 20),
                      Text("SIGNUP AS:", style: kLabelTextStyle, textAlign: TextAlign.left),
                      SizedBox(height: 5),

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
                            onChanged: null,
                            value: selectedStatus,
                            hint: Text("Property Owner",
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
                      CustomEditedFiled(
                        width: Get.width,
                        height: Get.height*0.075,
                        text: "FULL LEGAL NAME OF PROPERTY OWNER",
                        hintText: "Margaret Novakowska",
                        controller: name,
                        hintTextColor: kCreateAccountHintColor,
                      ),

                      SizedBox(height: 15),
                      DatePicker(text: "DATE OF BIRTH OF PROP. OWNER.", hintTextColor: Colors.black),

                      SizedBox(height: 20),
                      Text("ADDRESS",style: TextStyle(color: Color(0xff0336FF),fontSize: 20,fontWeight: FontWeight.bold)),

                      SizedBox(height: 15),
                      CustomEditedFiled(
                        width: Get.width,
                        height: Get.height*0.075,
                        text: "HOUSE NUMBER",
                        hintText: "G-586",
                        controller: houseNo,
                        hintTextColor: kCreateAccountHintColor,
                      ),
                      SizedBox(height: 15),
                      CustomEditedFiled(
                        width: Get.width,
                        height: Get.height*0.075,
                        text: "STREET NAME",
                        hintText: "Awulen Kodjo Street",
                        controller: streetName,
                        hintTextColor: kCreateAccountHintColor,
                      ),

                      SizedBox(height: 15),
                      CustomEditedFiled(
                        width: Get.width,
                        height: Get.height*0.075,
                        text: "GPS ADDRESS",
                        hintText: "https://goo.gl/maps/t3R2moqBuVwULmE77",
                        controller: gpsName,
                        hintTextColor: kCreateAccountHintColor,
                      ),

                      SizedBox(height: 20),
                      Text("CONTACT",style: TextStyle(color: Color(0xff0336FF),fontSize: 20,fontWeight: FontWeight.bold)),

                      SizedBox(height: 15),
                      CustomEditedFiled(
                        width: Get.width,
                        height: Get.height*0.075,
                        text: "PHONE NUMBER",
                        hintText: "+233302513314",
                        controller: contact,
                        hintTextColor: kCreateAccountHintColor,
                      ),

                      SizedBox(height: 15),
                      CustomEditedFiled(
                        width: Get.width,
                        height: Get.height*0.075,
                        text: "EMAIL ADDRESS",
                        hintText: "larry.jones@mail.com",
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


                      SizedBox(height: 15),
                      CustomEditedFiled(
                        width: Get.width,
                        height: Get.height*0.075,
                        text: "SOCIAL MEDIA HANDLES (OPTIONAL)",
                        hintText: "www.facebook.com/renexcode",
                        controller: social,
                        hintTextColor: kCreateAccountHintColor,
                      ),

                      SizedBox(height: 20),
                      Text("IDENTIFICATION",style: TextStyle(color: Color(0xff0336FF),fontSize: 20,fontWeight: FontWeight.bold)),

                      SizedBox(height: 15),
                      Text("NATIONAL ID TYPE", style: kLabelTextStyle, textAlign: TextAlign.left),
                      SizedBox(height: 5),

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
                            items: idtype.map((value) => DropdownMenuItem(
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
                                nationalIdType = selectedAccountType as String?;

                              });
                            },

                            value: nationalIdType,
                            hint: Text("Choose ID Type",
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
                      CustomEditedFiled(
                        width: Get.width,
                        height: Get.height*0.075,
                        text: "NATIONAL ID NUMBER",
                        hintText: "https://goo.gl/maps/t3R2moqBuVwULmE77",
                        controller: nationalId,
                        hintTextColor: kCreateAccountHintColor,
                      ),

                      SizedBox(height: 20),
                      Text("UPLOAD OF FRONT AND BACK OF NATIONAL ID",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold)),

                      SizedBox(height: 10),
                      Row(
                        children: [
                          _image != null ?
                          Container(
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.file(File(_image!.path), width: 50, height: 50, fit: BoxFit.cover,)),

                          ) :
                          Container(
                            height: 50,
                            width: 140,
                            decoration: const BoxDecoration(
                                color: Color(0xff1492E6),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                )
                            ),
                            child: InkWell(
                                onTap: (){
                                  _showPicker(context);
                                },
                                child:Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset("assets/camp.png",color: Colors.white,width: 25,height: 25),
                                    SizedBox(width: 10),
                                    Text("Front",style: TextStyle(color: Colors.white,fontSize: 17))


                                  ],
                                )
                            ),
                          ),


                          SizedBox(width: 20),


                          _image != null ?
                          Container(
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.file(File(_image!.path), width: 50, height: 50, fit: BoxFit.cover,)),

                          ) :
                          Container(
                            height: 50,
                            width: 140,
                            decoration: const BoxDecoration(
                                color: Color(0xff1492E6),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                )
                            ),
                            child: InkWell(
                                onTap: (){
                                  _showPicker(context);
                                },
                                child:Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset("assets/camp.png",color: Colors.white,width: 25,height: 25),
                                    SizedBox(width: 10),
                                    Text("Back",style: TextStyle(color: Colors.white,fontSize: 17))


                                  ],
                                )
                            )
                          ),

                        ],
                      ),






                      SizedBox(height: 30),
                      CustomBlueButton(
                        width: Get.width,
                        height: Get.height*0.075,
                        fontSize: 15,
                        text: "Continue",
                        onPressed: () {

                          if(name.text.isEmpty||houseNo.text.isEmpty||streetName.text.isEmpty||gpsName.text.isEmpty||contact.text.isEmpty||social.text.isEmpty||nationalId.text.isEmpty||email.text.isEmpty||password.text.isEmpty){
                            Fluttertoast.showToast(
                                msg: "Enter All Fields ",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.SNACKBAR,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Color(0xFF1E272E),
                                textColor: Colors.white,
                                fontSize: 16.0
                            );
                            //print("enter");

                          }else if(!email.text.contains('@')||!email.text.contains('.com')){
                            Fluttertoast.showToast(
                                msg: "Invalid Email",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.SNACKBAR,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Color(0xFF1E272E),
                                textColor: Colors.white,
                                fontSize: 16.0
                            );
                          }else{
                            //signUp();
                            createOwnerAccount(
                                name.text,
                                email.text,
                                password.text,
                                contact.text,
                                selectedStatus,
                                houseNo.text,
                                streetName.text,
                                nationalId.text,
                                nationalIdType,
                                gpsName.text,
                                social.text
                            );
                            Get.to(()=>BankDetails());
                          }
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

