import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:state_agent/Api_Services/user/login_controller.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Screens/user_auth/authenticate.dart';
import '../../constants/hive/hive.dart';

class GoogleController extends GetxController{


  // Future<void> logout1() async {
  //   delete();
  //   Fluttertoast.showToast(msg: 'Logout successful');
  //   Get.to(()=> Authentication());
  // }

  /// GOOGLE SIGNUP HTTP
  Future<void> googleSingup(String type) async {

    //HttpServer _redirectServer = await HttpServer.bind("/google/type", 8082);

    Map data = {'type': type};
    var url = Uri.parse(LoginController.baseUrl+'/google/type');

    try{

      final response = await http.post(url, body: data);

      if (response.statusCode == 302){

        launchUrl(LoginController.baseUrl+'/auth/google');

        final res = await http.get(
            Uri.parse(LoginController.baseUrl+'/google/signin')
        );
        if (res.statusCode == 200){


          LoginController.User = jsonDecode(res.body);
          write();
          Fluttertoast.showToast(msg: 'Welcome');
          Get.to(() => Authentication());
        }
        else{
          Fluttertoast.showToast(msg: res.body);
        }

      }
      else{
        print(response.statusCode);
        Fluttertoast.showToast(msg: response.body);
      }

    } catch (e){

      Fluttertoast.showToast(msg: e.toString());
      print('Error: '+e.toString());
    }
  }

  Future launchUrl(String url) async {

    if (!await canLaunch(url)){
      await launch(url, forceWebView: true);
    }
    else{
      Fluttertoast.showToast(msg: 'Can\'t signin');
    }
    await closeWebView();
  }

}

/// GOOGLE SIGNUP DIO
// Future<void> googleSingup(String type) async {
//
//   Map data = {'type': type};
//
//   var dio = Dio();
//   try{
//     final response = await dio.post(LoginController.baseUrl+'/google/type', data: data);
//
//     if (response.statusCode == 302){
//
//       // final res = await dio.get(
//       //     LoginController.baseUrl+'/auth/google',
//       //     options: Options(
//       //         followRedirects: false,
//       //         //method: 'GET',
//       //         // validateStatus: (status){
//       //         //   return status! < 500;
//       //         // }
//       //     ));
//
//       launchUrl(LoginController.baseUrl+'/auth/google');
//
//       Get.to(()=> Authentication());
//     }
//     else{
//       print(response.statusCode);
//       Fluttertoast.showToast(msg: response.data);
//     }
//   }on DioError catch (e){
//     //Fluttertoast.showToast(msg: e.toString());
//     print('Error: '+e.toString());
//     print('Code: '+e.response!.statusCode.toString());
//   }
// }