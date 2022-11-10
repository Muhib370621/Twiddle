import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../Utilities/comp_screen.dart';
import '../navi_ownerPro.dart';

class EmailVerOwner extends StatefulWidget {
  const EmailVerOwner({Key? key}) : super(key: key);

  @override
  State<EmailVerOwner> createState() => _EmailVerOwnerState();
}

class _EmailVerOwnerState extends State<EmailVerOwner> {
  bool isEmailVerified=false;
  bool canResentEmail= false;
  Timer? timer;


  @override
  void initState() {
    super.initState();
    isEmailVerified=FirebaseAuth.instance.currentUser!.emailVerified;

    if (!isEmailVerified){
      sendVerificationEmail();

      timer= Timer.periodic(Duration(seconds: 3), (_)=>checkEmailVerified());
    }
  }
  @override
  void dispose(){
    timer?.cancel();
    super.dispose();
  }

  Future checkEmailVerified()async{
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      isEmailVerified=FirebaseAuth.instance.currentUser!.emailVerified;
    });
    if (isEmailVerified)timer?.cancel();

  }

  Future sendVerificationEmail()async{
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();

      setState(() =>canResentEmail=false);
      await Future.delayed(Duration(seconds: 5));
      setState(() =>canResentEmail=true);


    }catch(e){
      Fluttertoast.showToast(
          msg: "Email is not verified",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.SNACKBAR,
          timeInSecForIosWeb: 1,
          backgroundColor: Color(0xFF1E272E),
          textColor: Colors.white,
          fontSize: 16.0
      );

    }

  }

  @override
  Widget build(BuildContext context) => isEmailVerified ? NaviOwnerPro():
  Scaffold(
    backgroundColor: Colors.white,
    body:  Padding(
      padding: const EdgeInsets.only(left: 15,right: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Verification email hase been sent to your email check spam folder.',textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontSize: 20,fontFamily: 'Quicksand',fontWeight: FontWeight.w600)),
          SizedBox(height: 50),

          CustomBlueButton(
              width: Get.width,
              height: Get.height*0.075,
              fontSize: 15,
              text: "Resent Email",
              onPressed: (){canResentEmail ? sendVerificationEmail : null;}

          ),
          SizedBox(height: 20),
          CustomWhiteButton(
            width: Get.width,
            height: Get.height*0.075,
            fontSize: 15,
            color: Colors.black,
            text: "Cancel",
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.pop(context);
              },

          ),

        ],
      ),
    ),

  );

}
