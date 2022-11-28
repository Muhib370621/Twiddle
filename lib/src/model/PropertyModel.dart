// To parse this JSON data, do
//
//     final propertyModel = propertyModelFromJson(jsonString);

import 'dart:convert';

PropertyModel propertyModelFromJson(String str) => PropertyModel.fromJson(json.decode(str));

String propertyModelToJson(PropertyModel data) => json.encode(data.toJson());

class PropertyModel {
  PropertyModel({
    this.data,
  });

  List<Datum>? data;

  factory PropertyModel.fromJson(Map<String, dynamic> json) => PropertyModel(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.specification,
    this.id,
    this.user,
    this.catagery,
    this.realStateType,
    this.title,
    this.description,
    this.price,
    this.fullAddress,
    this.houseno,
    this.streetno,
    this.coverimage,
    this.propertyUpload,
    this.document,
    this.video,
    this.v,
  });

  Specification? specification;
  String? id;
  User? user;
  String? catagery;
  String? realStateType;
  String? title;
  String? description;
  String? price;
  String? fullAddress;
  String? houseno;
  String? streetno;
  String? coverimage;
  List<String>? propertyUpload;
  String? document;
  String? video;
  int? v;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    specification: Specification.fromJson(json["specification"]),
    id: json["_id"],
    user: User.fromJson(json["user"]),
    catagery: json["catagery"],
    realStateType: json["realStateType"],
    title: json["title"],
    description: json["description"],
    price: json["price"],
    fullAddress: json["fullAddress"],
    houseno: json["houseno"],
    streetno: json["streetno"],
    coverimage: json["coverimage"],
    propertyUpload: List<String>.from(json["propertyUpload"].map((x) => x)),
    document: json["document"],
    video: json["video"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "specification": specification?.toJson(),
    "_id": id,
    "user": user?.toJson(),
    "catagery": catagery,
    "realStateType": realStateType,
    "title": title,
    "description": description,
    "price": price,
    "fullAddress": fullAddress,
    "houseno": houseno,
    "streetno": streetno,
    "coverimage": coverimage,
    "propertyUpload": List<dynamic>.from(propertyUpload!.map((x) => x)),
    "document": document,
    "video": video,
    "__v": v,
  };
}

class Specification {
  Specification({
    this.bedroom,
    this.washroom,
    this.carparking,
    this.kitchen,
    this.floorArea,
    this.tapAvailable,
    this.aircondition,
    this.quarterAvailble,
  });

  String? bedroom;
  String? washroom;
  String? carparking;
  String? kitchen;
  String? floorArea;
  String? tapAvailable;
  String? aircondition;
  String? quarterAvailble;

  factory Specification.fromJson(Map<String, dynamic> json) => Specification(
    bedroom: json["bedroom"],
    washroom: json["washroom"],
    carparking: json["carparking"],
    kitchen: json["kitchen"],
    floorArea: json["floorArea"],
    tapAvailable: json["tapAvailable"],
    aircondition: json["aircondition"],
    quarterAvailble: json["quarterAvailble"],
  );

  Map<String, dynamic> toJson() => {
    "bedroom": bedroom,
    "washroom": washroom,
    "carparking": carparking,
    "kitchen": kitchen,
    "floorArea": floorArea,
    "tapAvailable": tapAvailable,
    "aircondition": aircondition,
    "quarterAvailble": quarterAvailble,
  };
}

class User {
  User({
    this.id,
    this.firstname,
    this.lastname,
    this.phone,
    this.email,
    this.avatar,
  });

  String? id;
  String? firstname;
  String? lastname;
  String? phone;
  String? email;
  String? avatar;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["_id"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    phone: json["phone"],
    email: json["email"],
    avatar: json["avatar"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "firstname": firstname,
    "lastname": lastname,
    "phone": phone,
    "email": email,
    "avatar": avatar,
  };
}
