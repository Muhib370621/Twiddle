import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../Screens/bottom_navi/home_screen/dashboard_screen.dart';
import '../constants/methods.dart';


Future<User?> createAccount (String fname, lname, email, password, contact, accType) async{

  try {
    User? user = (await auth.createUserWithEmailAndPassword(email: email, password: password))
        .user;

    if(user != null){

      await firestore.collection('users').doc(auth.currentUser?.uid).set({
        'name': '${fname} ${lname}',
        'fname': fname,
        'lname': lname,
        'email': email,
        'password': password,
        'contact': contact,
        'accType': accType,
        'uid':auth.currentUser?.uid,
        'online': 'unavailable',
        'profilePic': 'profilePic',
        'favorites': '',
        'wallet': 0.00
      });

      Fluttertoast.showToast(msg: 'Signup Successful');
      Get.to(()=>Dashboard());
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