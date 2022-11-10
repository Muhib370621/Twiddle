import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:state_agent/service_provider/sp_signup.dart';
import 'package:uuid/uuid.dart';

import '../constants/constants.dart';



class SPSignupNext extends StatefulWidget {
  String? name; String? email; String? password; String? contact; String? profession;
  SPSignupNext({Key? key,
    this.name, this.email, this.password, this.contact, this.profession
  }) : super(key: key);

  @override
  State<SPSignupNext> createState() => _SPSignupNextState();
}

class _SPSignupNextState extends State<SPSignupNext> {

  String profilePic = '';
  galleryImage() async{
    final _storage = FirebaseStorage.instance;
    final _picked = ImagePicker();
    PickedFile? image;

    /// Check Permissions
    await Permission.phone.request();

    var permissionStatus = await Permission.photos.status;

    if(permissionStatus.isGranted){
      /// Select Image
      image = await _picked.getImage(source: ImageSource.gallery);

      var file = File(image!.path);
      String fileName = Uuid().v1();


      if(image != null){
        /// Upload to Firebase Storage
        var snapshot = await _storage.ref().child('Images/$fileName.jpg').putFile(file);
        var downloadUrl = await snapshot.ref.getDownloadURL();

        // setState(() {
        //   imageUrl = downloadUrl;
        // });
        return profilePic = downloadUrl;
      }
      else{
        Fluttertoast.showToast(msg: 'No image received');
      }
    }
    else{
      Fluttertoast.showToast(msg: 'Grant Permissions and try again');
    }

  }

  captureImage() async{
    final _storage = FirebaseStorage.instance;
    final _picked = ImagePicker();
    PickedFile? image;

    /// Check Permissions
    await Permission.phone.request();

    var permissionStatus = await Permission.photos.status;

    if(permissionStatus.isGranted){
      /// Select Image
      image = await _picked.getImage(source: ImageSource.camera);

      var file = File(image!.path);
      String fileName = Uuid().v1();


      if(image != null){
        /// Upload to Firebase Storage
        var snapshot = await _storage.ref().child('Images/$fileName.jpg').putFile(file);
        var downloadUrl = await snapshot.ref.getDownloadURL();

        setState(() {
          profilePic = downloadUrl;
        });
        return profilePic = downloadUrl;
      }
      else{
        Fluttertoast.showToast(msg: 'No image received');
      }
    }
    else{
      Fluttertoast.showToast(msg: 'Grant Permissions and try again');
    }

  }

  final desc = TextEditingController(text: 'This is Martha Hill, I\'m a cleaner if you want your house lokks clean the hire me.');
  final location = TextEditingController(text: 'Abekah Lapaz');
  final price = TextEditingController(text: '62');

  bool show = false;

  TimeOfDay fromtime = TimeOfDay(hour: 08, minute: 00);
  TimeOfDay totime = TimeOfDay(hour: 10, minute: 00);

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
                            width: Get.width * 0.08,
                            height: Get.height * 0.05,
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
                      GestureDetector(
                        onTap: () {
                          galleryImage();
                        },
                        child: MyContainer(
                          color: lightButton, height: 60, width: 60,
                          radius: 50,
                          child: Icon(Icons.add_a_photo, color: hinttext)
                        ),
                      ),

                      Height(),
                      PoppinsText(text: 'Select a presentable photo for yourself this is very important.', size: 10, color: hinttext),
                      Height(size: 15,),
                      PoppinsText(text: 'DESCRIBE YOURSELF', fontWeight: FontWeight.w500),
                      Height(),
                      MyTextField(
                        color: white, borderColor: black, radius: 8,
                        height: 120, maxLines: 5, controller: desc,
                      ),
                      Height(size: 20),
                      PoppinsText(text: 'AVAILABILITY', fontWeight: FontWeight.w500,),

                      Height(),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              PoppinsText(text: 'FROM'),
                              Height(size: 5),
                              Row(
                                children: [

                                  MyContainer(
                                    width: 105, height: 40,
                                    horizontalPadding: 20, verticalPadding: 10,
                                    borderColor: black, radius: 8,
                                    child: PoppinsText(
                                        text: '${fromtime.hour.toString()} : ${fromtime.minute.toString()} ${fromtime.periodOffset.toString()}'
                                    )
                                  ),
                                  Width(),
                                  MyContainer(
                                    onTap: () async{
                                      TimeOfDay? newTime = await showTimePicker(
                                          context: context,
                                          initialTime: fromtime
                                      );
                                      if(newTime != null){
                                        setState(() {
                                          fromtime = newTime;
                                        });
                                      }
                                    },
                                    height: 40, width: 40, radius: 8, color: maincolor,
                                    child: Icon(Icons.access_time_filled, color: white,),
                                  )
                                ],
                              )
                            ],
                          ),
                          Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              PoppinsText(text: 'TO'),
                              Height(size: 5),
                              Row(
                                children: [

                                  MyContainer(
                                      width: 105, height: 40,
                                      borderColor: black, radius: 8,
                                      horizontalPadding: 20, verticalPadding: 10,
                                      child: PoppinsText(
                                          text: '${totime.hour.toString()} : ${totime.minute.toString()} ${totime.periodOffset.toString()}'
                                      )
                                  ),
                                  Width(),
                                  MyContainer(
                                    onTap: () async{
                                      TimeOfDay? newTime = await showTimePicker(
                                          context: context,
                                          initialTime: totime
                                      );
                                      if(newTime != null){
                                        setState(() {
                                          totime = newTime;
                                        });
                                      }
                                    },
                                    height: 40, width: 40, radius: 8, color: maincolor,
                                    child: Icon(Icons.access_time_filled, color: white,),
                                  )
                                ],
                              )
                            ],
                          ),
                        ],
                      ),

                      Height(size: 15,),
                      Row(
                        children: [

                          PoppinsText(text: 'LOCATION ', fontWeight: FontWeight.w500,),
                          PoppinsText(text: '(Pin the location form google map)',size: 10, color: hinttext,),

                        ],
                      ),
                      Height(),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: MyTextField(
                              borderColor: black, radius: 5, height: 50,
                              hint: 'Abekah Lapaz', color: white, controller: location,
                            ),
                          ),
                          Width(),
                          MyContainer(
                            onTap: () {},
                            height: 50, width: 50, radius: 8, color: maincolor,
                            child: Icon(Icons.my_location_outlined, color: white, size: 20.sp),
                          )
                        ],
                      ),
                      
                      Height(size: 15,),
                      PoppinsText(text: 'PER HOUR PRICING', fontWeight: FontWeight.w500,),
                      Height(),
                      MyTextField(
                        borderColor: black, radius: 5,
                        hint: '62', color: white, height: 50,
                        controller: price,
                      ),

                      Height(size: 30),
                      Button(
                        text: 'Finish', height: 50,
                        onTap: (){

                          if(desc.text.isEmpty || price.text.isEmpty || location.text.isEmpty){
                            Fluttertoast.showToast(msg: 'Enter all fields');
                          }
                          else {

                            createSPAccount(
                                '${widget.name}', widget.email,
                                widget.password, widget.contact,
                                widget.profession, desc, location,
                                price, profilePic, 'fromtime', 'totime'
                            );

                            //verifyNumber('${widget.contact}');

                            //Get.to(()=> PhoneVerification());

                          }

                        },
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