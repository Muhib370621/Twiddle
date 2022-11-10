import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../Screens/user_auth/authenticate.dart';
import 'login_controller.dart';

class SignupController extends GetxController {


  ///IMAGE UPLOAD
  Future uploadData(imageFilePath, name, Map userData) async {

    var url = Uri.parse(LoginController.baseUrl + '/signup');

      var request = http.MultipartRequest('POST', url);

      await http.MultipartFile.fromPath(
        'profile_pic',
        imageFilePath,
        filename:
        'image_$name.jpg',

      );

  }

  /// SIGNUP
  Future<void> register(Map userData) async {
    var url = Uri.parse(LoginController.baseUrl + '/signup');

    print(userData);
    try {
      final response = await http.post(url, body: userData);

      if (response.statusCode == 200) {
        Fluttertoast.showToast(msg: response.body);
        Get.to(() => Authentication());
      }
      else if (response.statusCode == 401) {
        Fluttertoast.showToast(msg: response.body);
      }
      else {
        print(response.statusCode);
        Fluttertoast.showToast(msg: response.body);
        print(response.body);
        print(response.statusCode);
        //Fluttertoast.showToast(msg: 'Account Exits');
      }
    } catch (e) {

      Fluttertoast.showToast(msg: e.toString());
      print('Error: ' + e.toString());
    }
  }

}