import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:uuid/uuid.dart';

import '../Utilities/comp_screen.dart';
import '../constants/constants.dart';
import '../constants/methods.dart';
import 'confirmation.dart';

class SPIdCard extends StatefulWidget {
  SPIdCard({Key? key}) : super(key: key);

  @override
  State<SPIdCard> createState() => _SPIdCardState();
}

class _SPIdCardState extends State<SPIdCard> {

  Stream<QuerySnapshot> info = FirebaseFirestore.instance.collection("users").snapshots();

  @override
  void initState() {
    getCard();
    super.initState();
  }
  var front, back;
  getCard() async{
    QuerySnapshot UserSnap = await firestore.collection('users').where('email', isEqualTo: auth.currentUser?.uid).get();
    if(UserSnap != null && UserSnap.docs.isNotEmpty){
      setState(() {
        front = UserSnap.docs[0]['frontCard'];
        back = UserSnap.docs[0]['backCard'];
      });

      print('Front $front');
      print('Back $back');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: shadowcolor.withOpacity(0.2),
        width: Get.width, height: Get.height,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            Height(size: 40),
            Row(
              children: [
                RoundBackButton(
                  color: transparent,
                  iconColor: black,
                  size: 20,
                ),
                Width(size: 20),

                Container(
                  width: Get.width*0.7,
                    child: Center(child: PoppinsText(text: 'National ID Scan', size: 18, fontWeight: FontWeight.w700)))

              ],
            ),

            Height(size: 30,),

            MyContainer(
              color: maincolor, shadowColor: maincolor.withOpacity(0.5),
              horizontalMargin: 40,
            ),

            Height(size: 25),

            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.r),
                      topRight: Radius.circular(20.r),
                    )
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [

                      Height(size: 25),

                      PoppinsText(text: 'Have a final check if all data is clearly visible and that it matches the information you have entered in previous steps.',
                        textAlign: TextAlign.center,
                      ),

                      Height(size: 20,),

                      PoppinsText(text: 'Front Side', size: 18, fontWeight: FontWeight.w500, color: hinttext),

                      Height(),


                      authUser['frontCard'] == null?
                      MyContainer(
                        height: 200, radius: 20,
                        child: Image.asset('assets/sp/frontCard.png'),
                      ) : Container(
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          image: DecorationImage(
                              image: NetworkImage(authUser['frontCard'])
                          )
                        ),
                      ),

                      Height(size: 15,),

                      GestureDetector(
                          onTap: (){
                            frontCardCap();
                          },
                          child: PoppinsText(text: 'Click Again', size: 14, fontWeight: FontWeight.w500, color: maincolor)),

                      Height(),
                      MyDivider(),
                      Height(),

                      PoppinsText(text: 'Back Side', size: 18, fontWeight: FontWeight.w500, color: hinttext),

                      Height(),

                      authUser['backCard'] == null?
                      MyContainer(
                        height: 200, radius: 20,
                        child: Image.asset('assets/sp/backCard.png'),
                      ) : Container(
                        height: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                            image: DecorationImage(
                                image: NetworkImage(authUser['backCard'])
                            )
                        ),
                      ),

                      Height(size: 15,),

                      GestureDetector(
                          onTap: (){
                            backCardCap();
                          },
                          child: PoppinsText(text: 'Click Again', size: 14, fontWeight: FontWeight.w500, color: maincolor)),

                      Height(size: 30),

                      Button(
                        text: 'Finish Verification', width: 200, height: 55, radius: 20,
                        onTap: (){
                          Get.to(()=> SPConfirmation());
                        },
                      ),

                      Height(size: 30),

                    ],
                  ),
                ),
              ),
            )

          ],
        ),
      ),
    );
  }

  String? frontCard;

  String? backCard;

  frontCardCap() async{
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
        var snapshot = await _storage.ref().child('id_cards/$fileName.jpg').putFile(file);
        var downloadUrl = await snapshot.ref.getDownloadURL();

        setState(() {
          frontCard = downloadUrl;
        });
        frontcard(frontCard!);
        return frontCard;
      }
      else{
        Fluttertoast.showToast(msg: 'No image received');
      }
    }
    else{
      Fluttertoast.showToast(msg: 'Grant Permissions and try again');
    }

  }

  backCardCap() async{
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
        var snapshot = await _storage.ref().child('id_cards/$fileName.jpg').putFile(file);
        var downloadUrl = await snapshot.ref.getDownloadURL();

        setState(() {
          backCard = downloadUrl;
        });
        backcard(backCard!);
        return backCard;
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
  void frontcard(String url) async{
    await firestore.collection('users').doc(auth.currentUser?.uid).update({
      'frontCard': url
    });
  }

  @override
  void backcard(String url) async{
    await firestore.collection('users').doc(auth.currentUser?.uid).update({
      'backCard': url
    });
  }
}
