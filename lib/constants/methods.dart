import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:state_agent/Screens/user_auth/accountSelection.dart';


import '../Screens/property_owner/navi_ownerPro.dart';
import '../landing_screen/welcome_page.dart';

FirebaseAuth auth = FirebaseAuth.instance;
FirebaseFirestore firestore = FirebaseFirestore.instance;


var authUser, userAccType;

Future<User?> createOwnerAccount (
    String name, email, password, contact, accType, houseNo,
    streetName, nationalId, nationalIdType, gpsName, social) async{

  try {
    User? user = (await auth.createUserWithEmailAndPassword(email: email, password: password))
        .user;

    if(user != null){

      await firestore.collection('users').doc(auth.currentUser?.uid).set({
        "name":name,
        "houseNo":houseNo,
        "streetName":streetName,
        "gpsName":gpsName,
        "contact":contact,
        "email":email,
        "social":social,
        "nationalId":nationalId,
        "accType":accType,
        "selectedIdType":nationalIdType,
        'uid':auth.currentUser?.uid,
        'status': 'unavailable',
        'profilePic': 'profilePic',
        'favorites': '',
        'wallet': 0.00
      });

      Fluttertoast.showToast(msg: 'Signup Successful');
      Get.to(()=>NaviOwnerPro());
      return user;
    }
    else{
      Fluttertoast.showToast(msg: 'Signup failed');
      return user;
    }
  }catch (e) {
    Fluttertoast.showToast(msg: 'Email already in use');
    return null;
  }

}

Future<User?> login (String email, password) async{

  try {
    User? user = (await auth.signInWithEmailAndPassword(email: email, password: password))
        .user;
    if(user != null){
      Fluttertoast.showToast(msg: 'Login as $userAccType');

      Get.to(()=>AccountSelection());
      return user;
    }
    else{
      Fluttertoast.showToast(msg: 'Login Failed');

      return user;
    }
  }catch (e) {
    Fluttertoast.showToast(msg: 'Invalid email & password');
    return null;
  }
}

Future<User?> loginWithAccType (String email, password, type) async{

  QuerySnapshot userSnap = await firestore.collection('users').where('email', isEqualTo: email).get();

  if(userSnap.docs != null && userSnap.docs.isNotEmpty){

      userAccType = userSnap.docs[0]['accType'];

    if(type == userAccType){
      login(email, password);
    }
    else{
      Fluttertoast.showToast(msg: 'Invalid account type');
    }
  }
  else{
    Fluttertoast.showToast(msg: 'Invalid email & password');
  }
}

@override
void setStatus(String status) async{
  await firestore.collection('users').doc(auth.currentUser?.uid).update({
    'status': status
  });
}

Future logout() async{
  try {
    await auth.signOut();
    Fluttertoast.showToast(msg: 'Logout Successful');

    Get.off(()=>WelcomePage());
  } catch (e) {
    Fluttertoast.showToast(msg: e.toString());
    return null;
  }
}