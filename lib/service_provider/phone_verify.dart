import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:state_agent/service_provider/bottom_navigation/dashboard/sp_dashboard.dart';

final auth = FirebaseAuth.instance;
String? verifyId;

void verifyNumber(String number) async{

  auth.verifyPhoneNumber(
      phoneNumber: number,
      verificationCompleted: (PhoneAuthCredential credential){
        auth.signInWithCredential(credential).then((value) => {
          Fluttertoast.showToast(msg: 'Phone number verified')
        });
      },
      verificationFailed: (FirebaseAuthException e){
        Fluttertoast.showToast(msg: e.toString());
        print(e.toString());
      },
      codeSent: (String verificationId, int? resendToken){
        verifyId = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId){

      }
  );
}

verifyCode(String otp) async{
  PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verifyId!, smsCode: otp);
  
  await auth.signInWithCredential(credential).then((value) => {
    Get.to(()=> SPDashboard())
  });
}