import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../constants/methods.dart';
import 'bottom_navigation/dashboard/sp_dashboard.dart';



Future<User?> createSPAccount (
    String name, email, password, contact, profession, desc, location, price, profilePic, fromtime, totime
    ) async{

  try {
    User? user = (await auth.createUserWithEmailAndPassword(email: email, password: password))
        .user;

    if(user != null){

      await firestore.collection('users').doc(auth.currentUser?.uid).set({
        "name": name,
        "email": email,
        "contact": contact,
        "status": 'Service Provider',
        "profession": profession,
        'uid': auth.currentUser?.uid,
        'online': 'unavailable',
        'available': 'Available',
        'hired': 'false',
        'verified': 'false',
        'desc': desc,
        'location': location,
        'price': price,
        'fromtime': fromtime,
        'totime': totime,
        'profilePic': profilePic,
        'card_front': '',
        'card_back': '',
        'favorites': '',
        'wallet': 0.00
      });

      Fluttertoast.showToast(msg: 'Signup Successful');

      Get.to(()=> SPDashboard());
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

Future<User?> updateSPAccount (
    String desc, location, price, imageUrl, fromtime, totime) async{

  try {
      await firestore.collection('users').doc(auth.currentUser?.uid).update({

        'desc': desc,
        'location': location,
        'price': price,
        'fromtime': fromtime,
        'totime': totime,
        'imageUrl': imageUrl,
      });

      Fluttertoast.showToast(msg: 'Welcome');
      Get.to(()=> SPDashboard());
  }

  catch (e) {
    Fluttertoast.showToast(msg: e.toString());
    return null;
  }

}