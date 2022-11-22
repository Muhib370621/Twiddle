import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../model/LoginModel.dart';
import 'endpoints.dart';
import 'local storage/local storage.dart';

class AuthenticationServices{

  Future<LoginModel> login({
    required String email,
    required String pass,
  }) async {
    /// Url
    String url = UrlSchemes.baseUrlDev + UrlSchemes.userLogin;

    /// Headers
    // var headers = AuthHeaders.getOnlyContentTypeHeaders();

    /// Request
    var response = await http.post(
      Uri.parse(url),
      body:
        {
          'type': 'Real Estate',
          'email': email,
          'password': pass
        }
    );

    if (kDebugMode) {
      print("Called API: $url");
      print("Status Code: ${response.statusCode}");
      print("Response Body: ${response.body}");
    }

    var resp = loginModelFromJson(response.body);

    /// Save Login Token
    LocalStorage.writeString(
      key: LocalStorageKeys.accessToken,
      value: resp.token.toString(),
    );

    /// Get Token
    String accessToken = LocalStorage.readString(
      key: LocalStorageKeys.accessToken,
    );

    if (kDebugMode) {
      print("ACCESS TOKEN ON LOGIN: $accessToken");
    }

    if (response.statusCode == 200) {
      return loginModelFromJson(response.body);
    } else if (response.statusCode == 401) {
      throw Exception('Not Authorized');
    } else if (response.statusCode == 500) {
      throw Exception('Server Not Responding');
    } else {
      throw Exception('Something Went Wrong');
    }
  }


  Future<LoginModel> signUp({
    required String firstName,
    required String lastName,
    required String phoneNo,
    required String email,
    required String pass,
    required String confirmPass,
  }) async {
    /// Url
    String url = UrlSchemes.baseUrlDev + UrlSchemes.userSignUp;

    /// Headers
    // var headers = AuthHeaders.getOnlyContentTypeHeaders();

    /// Request
    var response = await http.post(
        Uri.parse(url),
        body:
        {
          'type': 'Real Estate',
          'firstname' : firstName,
          'lastname' : lastName,
          'phone': phoneNo,
          'email': email,
          'password': pass
        }
    );

    if (kDebugMode) {
      print("Called API: $url");
      print("Status Code: ${response.statusCode}");
      print("Response Body: ${response.body}");
    }


    if (response.statusCode == 200) {
      return loginModelFromJson(response.body);
    } else if (response.statusCode == 401) {
      throw Exception('Not Authorized');
    } else if (response.statusCode == 500) {
      throw Exception('Server Not Responding');
    } else {
      throw Exception('Something Went Wrong');
    }
  }



}