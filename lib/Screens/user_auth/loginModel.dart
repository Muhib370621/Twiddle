// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.userdetail,
    this.token,
  });

  Userdetail? userdetail;
  String? token;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    userdetail: Userdetail.fromJson(json["userdetail"]),
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "userdetail": userdetail!.toJson(),
    "token": token,
  };
}

class Userdetail {
  Userdetail({
    this.fullname,
    this.type,
    this.email,
    this.avatar,
  });

  String? fullname;
  String? type;
  String? email;
  String? avatar;

  factory Userdetail.fromJson(Map<String, dynamic> json) => Userdetail(
    fullname: json["fullname"],
    type: json["type"],
    email: json["email"],
    avatar: json["avatar"],
  );

  Map<String, dynamic> toJson() => {
    "fullname": fullname,
    "type": type,
    "email": email,
    "avatar": avatar,
  };
}
