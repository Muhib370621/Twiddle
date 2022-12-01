import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:state_agent/Api_Services/urlSchemes.dart';
import 'package:http/http.dart' as http;
import '../../bottom_navigation/home/models/propertyModel.dart';
import '../../landing_screen/animated_splash.dart';
import '../authHeaders.dart';
import '../localStorage.dart';

class RentServices {
  Future<PropertyModel> getRentPropertyList() async {
    /// Url
    String url = UrlSchemes.baseUrlDev + UrlSchemes.getRentProperties;

    /// Get Token
    String accessToken =
        LocalStorage.readString(key: LocalStorageKeys.accessToken);

    /// Headers
    var header = await AuthHeaders.getOnlyBearerHeaders(accessToken);

    /// Request
    // SharedPrefer.headertoken(header);
    var response = await http.get(
      Uri.parse(url),
      headers: header,
    );
    if (kDebugMode) {
      print("Called API: $url");
      print("Status Code: ${response.statusCode}");
      print("Response Body: ${response.body}");
      print("HEADERS: $header");
    }
    if (response.statusCode == 200) {
      print("response on 200: ${response.body}");
      return propertyModelFromJson(response.body);
    }
    if (response.statusCode == 401) {
      Get.offAll(() => AnimatedSplash());
      throw Exception('Not Authorized');
    }
    if (response.statusCode == 400) {
      throw Exception('Not found');
    }
    if (response.statusCode == 500) {
      throw Exception('Server Not Responding');
    } else {
      throw Exception('Something Went Wrong');
    }
  }

  Future<PropertyModel> getSalesPropertyList() async {
    /// Url
    String url = UrlSchemes.baseUrlDev + UrlSchemes.getSalesProperties;

    /// Get Token
    String accessToken =
        LocalStorage.readString(key: LocalStorageKeys.accessToken);

    /// Headers
    var header = await AuthHeaders.getOnlyBearerHeaders(accessToken);

    /// Request
    // SharedPrefer.headertoken(header);
    var response = await http.get(
      Uri.parse(url),
      headers: header,
    );
    if (kDebugMode) {
      print("Called API: $url");
      print("Status Code: ${response.statusCode}");
      print("Response Body: ${response.body}");
      print("HEADERS: $header");
    }
    if (response.statusCode == 200) {
      print("response on 200: ${response.body}");
      return propertyModelFromJson(response.body);
    }
    if (response.statusCode == 401) {
      Get.offAll(() => AnimatedSplash());
      throw Exception('Not Authorized');
    }
    if (response.statusCode == 400) {
      throw Exception('Not found');
    }
    if (response.statusCode == 500) {
      throw Exception('Server Not Responding');
    } else {
      throw Exception('Something Went Wrong');
    }
  }

  Future<PropertyModel> getShortStayPropertyList() async {
    /// Url
    String url = UrlSchemes.baseUrlDev + UrlSchemes.getShortStayProperties;

    /// Get Token
    String accessToken =
        LocalStorage.readString(key: LocalStorageKeys.accessToken);

    /// Headers
    var header = await AuthHeaders.getOnlyBearerHeaders(accessToken);

    /// Request
    // SharedPrefer.headertoken(header);
    var response = await http.get(
      Uri.parse(url),
      headers: header,
    );
    if (kDebugMode) {
      print("Called API: $url");
      print("Status Code: ${response.statusCode}");
      print("Response Body: ${response.body}");
      print("HEADERS: $header");
    }
    if (response.statusCode == 200) {
      print("response on 200: ${response.body}");
      return propertyModelFromJson(response.body);
    }
    if (response.statusCode == 401) {
      Get.offAll(() => AnimatedSplash());
      throw Exception('Not Authorized');
    }
    if (response.statusCode == 400) {
      throw Exception('Not found');
    }
    if (response.statusCode == 500) {
      throw Exception('Server Not Responding');
    } else {
      throw Exception('Something Went Wrong');
    }
  }

  Future<String> postProperty(
    String category,
    String stateType,
    String title,
    String description,
    String bedroom,
    String washroom,
    String carParking,
    String kitchen,
    String floorArea,
    String tapAvailable,
    String airCondition,
    String quarterAvailable,
    String price,
    String fullAddress,
    String houseNo,
    String streetNo,
    File file1,
    File file2,
    File file3,
    File file4,
    File file5,
    File file6,
    File file7,
    File file8,
    File file9,
  ) async {
    /// Url
    String url = UrlSchemes.baseUrlDev + UrlSchemes.property;

    /// Get Token
    String accessToken =
        LocalStorage.readString(key: LocalStorageKeys.accessToken);

    /// Headers
    var header = await AuthHeaders.getOnlyBearerHeaders(accessToken);

    var body = {
      'categery': category,
      "realStateType": stateType,
      'title': title,
      'description': description,
      'bedroom': bedroom,
      'washroom': washroom,
      'carparking': carParking,
      'kitchen': kitchen,
      'floorArea': floorArea,
      'tapAvailable': tapAvailable,
      'aircondition': airCondition,
      'quarterAvailable': quarterAvailable,
      'price': price,
      'fullAddress': fullAddress,
      'houseno': houseNo,
      'streetno': streetNo,
      'pictures': file1,
      'pictures': file2,
      'pictures': file3,
      'pictures': file4,
      'pictures': file5,
      'pictures': file6,
      'pictures': file7,
      'pictures': file8,
      'pictures': file9,
    };
    var request = http.MultipartRequest(
      'POST',
      Uri.parse(url),
    );
    Map<String, String> headers = header;
    request.files.add(
      http.MultipartFile(
        'image',
        file1.readAsBytes().asStream(),
        file1.lengthSync(),
        filename: file1.path.split('/').last,
      ),
    );
    request.headers.addAll(headers);
    print("request: " + request.toString());
    var res = await request.send();
    http.Response response = await http.Response.fromStream(res);

    // /// Request
    // // SharedPrefer.headertoken(header);
    // var response = await http.post(
    //   Uri.parse(url),
    //   headers: header,
    //   body: body,
    // );

    if (kDebugMode) {
      print("Called API: $url");
      print("Status Code: ${response.statusCode}");
      print("Response Body: ${response.body}");
      print("HEADERS: $header");
    }
    if (response.statusCode == 200) {
      print("response on 200: ${response.body}");
      return "Successfully Posted";
    }
    if (response.statusCode == 401) {
      Get.offAll(() => AnimatedSplash());
      throw Exception('Not Authorized');
    }
    if (response.statusCode == 400) {
      throw Exception('Not found');
    }
    if (response.statusCode == 500) {
      throw Exception('Server Not Responding');
    } else {
      throw Exception('Something Went Wrong');
    }
  }
}
