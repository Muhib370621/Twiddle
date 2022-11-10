import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'property_model.dart';


class PropertyController extends GetxController {

  static const baseUrl = 'https://twiddleagent.herokuapp.com';

  List <PropertyModel> property = [];

  Future<void> uploadProperty(Map propertyDate) async {
    var url = Uri.parse(baseUrl + '/property/upload');

    try {
      final response = await http.post(url, body: propertyDate);

      if (response.statusCode == 200) {
        print(json.decode(response.body));

        var res = json.decode(response.body);
        property = json.decode(response.body);



        Fluttertoast.showToast(msg: 'Welcome');

      }
      else {
        print(response.statusCode);

      }
    } catch (e) {

      print('Error: ' + e.toString());
    }
  }


  Future<void> updateProperty(Map propertyDate) async {
    var url = Uri.parse(baseUrl + '/property/upload');

    try {
      final response = await http.post(url, body: propertyDate);

      if (response.statusCode == 200) {
        print(json.decode(response.body));

        var res = json.decode(response.body);
        property = json.decode(response.body);



        Fluttertoast.showToast(msg: 'Welcome');

      }
      else {
        print(response.statusCode);

      }
    } catch (e) {

      print('Error: ' + e.toString());
    }
  }

}