import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:state_agent/constants/constants.dart';

import '../bottom_navigation/chat_screen/messages.dart';
import '../bottom_navigation/home/filters.dart';
import '../property/property_ads/profile_property_ad.dart';
import '../property/property_details.dart';

class UserProfile extends StatefulWidget {
  String? uid;
  UserProfile({Key? key,
    this.uid,
  }) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {

  final ref = FirebaseDatabase.instance.ref().child("Property");

  var uid;
  String? imageUrl;

  uploadImage() async{
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
      if(image != null){
        /// Upload to Firebase Storage
        var snapshot = await _storage.ref().child('Images/imageName').putFile(file);
        var downloadUrl = await snapshot.ref.getDownloadURL();

        setState(() {
          imageUrl = downloadUrl;
        });
      }
      else{
        Fluttertoast.showToast(msg: 'No image received');
      }
    }
    else{
      Fluttertoast.showToast(msg: 'Grant Permissions and try again');
    }

  }

  @override
  Widget build(BuildContext context) {
    if(adposter == null){
      return Scaffold(
        body: Container(
          width: Get.width, height: Get.height,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    }
    return Scaffold(
      backgroundColor: white,
      body: Column(
        children: [
          Container(
            width: Get.width,
            padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 40.h),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                BackButtonText(text: 'Details', size: 18, fontWeight: FontWeight.bold),

                Height(size: 20),
                Row(
                  children: [

                    Picture(
                      size: 80,
                      borderWidth: 3,
                      borderColor: maincolor,
                      url: adposter['profilePic'],
                    ),
                    Width(size: 15,),

                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PoppinsText(text: adposter['name'], size: 14, fontWeight: FontWeight.w500,),
                        Row(
                          children: [
                            Icon(Icons.security_rounded, size: 13.sp, color: maincolor),
                            Width(),
                            PoppinsText(text: adposter['accType'], size: 12),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.mail_outline, size: 13.sp, color: hinttext),
                            Width(),
                            PoppinsText(text: adposter['email'], size: 12, color: hinttext,),
                          ],
                        )
                      ],
                    )
                  ],
                ),
                Height(size: 15),
                Iconbutton(
                  onTap: (){
                    Get.to(()=>ChatRoom(
                      receiverId: adposter['uid'],
                    ));
                  },

                  text: 'Start Chat',
                  height: Get.height/18.h,
                  icon: Icons.chat_bubble,
                  shadowColor: maincolor.withOpacity(0.4),
                ),
                Height(size: 15),
                Iconbutton(
                  onTap: (){},
                  text: 'Schedule Appointment',
                  height: Get.height/18.h,
                  icon: Icons.phone,
                  buttonColor: Color(0xff9A03FF),
                  shadowColor: Color(0xff9A03FF).withOpacity(0.4),
                ),
                Height(size: 30),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PoppinsText(text: 'Property Listings', size: 18, fontWeight: FontWeight.w500),
                    GestureDetector(
                      onTap: () {
                        Get.to(()=>FilterScreen());
                      },
                      child: Container(
                        height: Get.height/20.h, width: Get.height/20.h,
                        decoration: BoxDecoration(
                          color: maincolor,
                          shape: BoxShape.circle,
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(8.sp),
                          child: SvgPicture.asset(
                            'assets/home/filter.svg',
                            color: white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Height(size: 20),

              ],
            ),
          ),
          Expanded(
            child: FirebaseAnimatedList(
              query: ref,
              itemBuilder: (BuildContext context, DataSnapshot snapshot,
                  Animation<double> animaiton, int index){

                var value = Map<String, dynamic>.from(snapshot.value as Map);

                uid = value['uid'];

                if(uid == widget.uid){
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: (){
                          Get.to(()=> PropertyDetails(
                            title: value['title'],
                            bedroom: value['bedrooms'],
                            location: value['desc'],
                            type: value['type'],
                            price: value['price'],
                            ac: value['ac'],
                            desc: value['desc'],
                            kitchen: value['kitchens'],
                            parking: value['parking'],
                            quarters: value['quarters'],
                            tap: value['tap'],
                            washroom: value['washrooms'],
                            uid: value['uid'],
                            visitCharges: value['visitCharges'],
                          ));
                        },
                        child: ProfilePropertyAD(
                            index: index,
                            type: value['type'],
                            bedrooms: value['bedrooms'],
                            title: value['title'],
                            price: value['price'],
                            location: value['desc']
                        ),
                      ),
                      Height(size: 20),
                    ],
                  );
                }

                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }
}
