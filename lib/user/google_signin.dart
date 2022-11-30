import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:state_agent/Api_Services/user/login_controller.dart';

import '../Api_Services/user/signup_controller.dart';
import '../Screens/user_auth/accountSelection.dart';
import '../constants/hive/hive.dart';

SignupController signupController = Get.put(SignupController());

class GoogleSigninProvider with ChangeNotifier{

  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _user;

  GoogleSignInAccount get user => _user!;

  Future googleSignin(String type) async{
    try {
      final googleUser = await googleSignIn.signIn();
      
      if(googleUser == null) return null;
      
      _user = googleUser;
      final googleAuth = await googleUser.authentication;
      
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      
      await FirebaseAuth.instance.signInWithCredential(credential);

      Map userData = {
        'full_name': user.displayName,
        'last_name': user.displayName?.split(' ').last,
        'first_name': user.displayName?.split(' ').first,
        'type': type,
        'email': user.email,
        'img': user.photoUrl,
        'idToken': user.id,
      };

      // signupController.register(userData);

    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
      print(e.toString());
    }

    notifyListeners();

  }

  // Future googleLogin(String email) async{
  //   try {
  //     final googleUser = await googleSignIn.signIn();
  //
  //     if(googleUser == null) return null;
  //
  //     _user = googleUser;
  //     final googleAuth = await googleUser.authentication;
  //
  //     final credential = GoogleAuthProvider.credential(
  //       accessToken: googleAuth.accessToken,
  //       idToken: googleAuth.idToken,
  //     );
  //
  //     await FirebaseAuth.instance.signInWithCredential(credential);
  //     login(email);
  //
  //   } catch (e) {
  //     Fluttertoast.showToast(msg: e.toString());
  //     print(e.toString());
  //   }
  //
  //   notifyListeners();
  //
  // }

  // Future<void> login(String email) async {
  //
  //   var url = Uri.parse(LoginController.baseUrl + '/google_login');
  //
  //   try{
  //
  //     final response = await http.post(url, body: email);
  //
  //     if (response.statusCode == 200){
  //
  //       // LoginController.User = jsonDecode(response.body);
  //       // write();
  //
  //       Fluttertoast.showToast(msg: 'Welcome');
  //       Get.to(()=> AccountSelection());
  //
  //       //return UserModel.fromJson(jsonDecode(response.body));
  //     }
  //     else if(response.statusCode == 500){
  //       Fluttertoast.showToast(msg: response.body);
  //     }
  //     else if(response.statusCode == 401){
  //       Fluttertoast.showToast(msg: 'Invalid email & password' );
  //     }
  //
  //     else{
  //       print(response.statusCode);
  //       Fluttertoast.showToast(msg: response.body);
  //     }
  //
  //   }catch (e){
  //
  //     Fluttertoast.showToast(msg: e.toString());
  //     print('Error: '+e.toString());
  //   }
  // }

  // Future disconnect() async{
  //   try {
  //     await googleSignIn.disconnect();
  //
  //     Get.to(()=> Authentication());
  //   } on Exception catch (e) {
  //     Fluttertoast.showToast(msg: e.toString());
  //   }
  // }

}