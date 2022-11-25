import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../model/PropertyModel.dart';
import '../../presentation/screens/onboarding/splashScreen.dart';
import '../endpoints.dart';
import '../headers.dart';
import '../local storage/local storage.dart';

class RentServices{

  Future<PropertyModel> getRentPropertyList() async {
    /// Url
    String url = UrlSchemes.baseUrlDev + UrlSchemes.getRentProperties;

    /// Get Token
    String accessToken = LocalStorage.readString(key: LocalStorageKeys.accessToken);
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
      Get.offAll(() => const SplashScreen());
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
    String accessToken = LocalStorage.readString(key: LocalStorageKeys.accessToken);
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
      Get.offAll(() => const SplashScreen());
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
    String accessToken = LocalStorage.readString(key: LocalStorageKeys.accessToken);
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
      Get.offAll(() => const SplashScreen());
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