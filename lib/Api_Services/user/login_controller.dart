import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../Screens/user_auth/authenticate.dart';
import '../../constants/hive/hive.dart';
import '../../landing_screen/welcome_page.dart';

class LoginController extends GetxController {

  static const baseUrl = 'https://google6666.herokuapp.com';

  static var User;

  /// LOGIN
  Future<void> login(Map userData) async {
    var url = Uri.parse(baseUrl + '/login');

    try {
      final response = await http.post(url, body: userData);

      if (response.statusCode == 200) {
        User = jsonDecode(response.body);
        write();

        Fluttertoast.showToast(msg: 'Welcome');
        Get.to(() => Authentication());

        //return UserModel.fromJson(jsonDecode(response.body));
      }
      else if (response.statusCode == 500) {
        Fluttertoast.showToast(msg: response.body);
      }
      else if (response.statusCode == 401) {
        Fluttertoast.showToast(msg: 'Invalid email & password');
      }

      else {
        print(response.statusCode);
        Fluttertoast.showToast(msg: response.body);
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
      print('Error: ' + e.toString());
    }
  }

  ///LOGOUT
  Future<void> logout() async {
    var url = Uri.parse(baseUrl + '/logout');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        delete();
        //Fluttertoast.showToast(msg: response.body);
        Fluttertoast.showToast(msg: 'Logout Successful');
        Get.to(() => WelcomePage());
      }
      // else if (response.statusCode == 404) {
      //   delete();
      //   //Fluttertoast.showToast(msg: response.body);
      //   Fluttertoast.showToast(
      //       msg: '${response.statusCode}: Logout Successful');
      //   Get.to(() => WelcomePage());
      // }
      else {
        print(response.statusCode);
        Fluttertoast.showToast(msg: response.body);
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
      print('Error: ' + e.toString());
    }
  }

}