import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:uuid/uuid.dart';

import '../constants/constants.dart';
import '../constants/methods.dart';
import 'id_card.dart';

class CaptureFrontCard extends StatefulWidget {
  const CaptureFrontCard({Key? key}) : super(key: key);

  @override
  State<CaptureFrontCard> createState() => _CaptureFrontCardState();
}

class _CaptureFrontCardState extends State<CaptureFrontCard> {
  XFile? frontCard;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(13, 31, 60, 0.8),
      appBar: AppBar(
        backgroundColor: transparent,
        elevation: 0,

        title: Container(
            width: Get.width *0.6,
            child: Center(child: PoppinsText(text: 'Scan Front Side', color: white, size: 18, fontWeight: FontWeight.w700))),
      ),
      body: Container(
        width: Get.width, height: Get.height,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Expanded(child: Container()),

            authUser['frontCard'] == null?
            Container(
              height: 220, width: 327,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  image: DecorationImage(
                      image: AssetImage('assets/sp/frontCard.png')
                  )
              ),
            ) : Container(
              height: 220, width: 327,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                image: DecorationImage(
                    image: NetworkImage(authUser['frontCard'])
                )
              ),
            ),

            Height(size: 35,),
            PoppinsText(text: 'Position your document inside the frame. Make sure that all the data is clearly visible.',
              size: 15, textAlign: TextAlign.center, color: white,
            ),
            Expanded(child: Container()),

            Button(
              text: authUser['frontCard'] == null?'Click':'Next', width: 200, height: 55,
              onTap: authUser['frontCard'] == null? () async{
                frontCardCap().then(
                  Get.to(()=> SPIdCard())
                );
              } : (){
                Get.to(()=> CaptureBackCard());
              },
            ),
            Height(size: 20)


          ],
        ),
      ),
    );
  }

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
          frontCard = downloadUrl as XFile?;
        });
        frontcard(frontCard.toString());
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

  @override
  void frontcard(String url) async{
    await firestore.collection('users').doc(auth.currentUser?.uid).update({
      'frontCard': url
    });
  }

}

class CaptureBackCard extends StatefulWidget {
  const CaptureBackCard({Key? key}) : super(key: key);

  @override
  State<CaptureBackCard> createState() => _CaptureBackCardState();
}

class _CaptureBackCardState extends State<CaptureBackCard> {
  XFile? backCard;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(13, 31, 60, 0.8),
      appBar: AppBar(
        backgroundColor: transparent,
        elevation: 0,

        title: Container(
            width: Get.width*0.6,
            child: Center(child: PoppinsText(text: 'Scan Back Side', color: white, size: 18, fontWeight: FontWeight.w700))),
      ),
      body: Container(
        width: Get.width, height: Get.height,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Expanded(child: Container()),

            authUser['backCard'] == null?
            Container(
              height: 220, width: 327,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  image: DecorationImage(
                      image: AssetImage('assets/sp/backCard.png')
                  )
              ),
            ) : Container(
              height: 220, width: 327,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  image: DecorationImage(
                      image: NetworkImage(authUser['backCard'])
                  )
              ),
            ),

            Height(size: 35,),
            PoppinsText(text: 'Position your document inside the frame. Make sure that all the data is clearly visible.',
              size: 15, textAlign: TextAlign.center, color: white,
            ),
            Expanded(child: Container()),

            Button(
              text: authUser['backCard'] == null?'Click':'Next', width: 200, height: 55,
              onTap: authUser['backCard'] == null? () async{
                backCardCap().then(
                    Get.to(()=> SPIdCard())
                );
              } : (){
                Get.to(()=> SPIdCard());
              },
            ),
            Height(size: 20)


          ],
        ),
      ),
    );
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
          backCard = downloadUrl as XFile?;
        });
        frontcard(backCard.toString());
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
      'backCard': url
    });
  }

}

