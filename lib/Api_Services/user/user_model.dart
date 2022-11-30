// import 'dart:convert';
//
// import 'package:http/http.dart' as http;
//
// import 'login_controller.dart';
//
// class UserModel{
//
//   final id;
//   final String fname;
//   final String lname;
//   final String full_name;
//   final String type;
//   final String number;
//   final String email;
//   final String password;
//
//   UserModel({
//     required this.id,
//     required this.fname,
//     required this.full_name,
//     required this.lname,
//     required this.type,
//     required this.number,
//     required this.email,
//     required this.password
// });
//
//   static Future<UserModel> fetchUser() async {
//     final response = await http
//         .post(Uri.parse(LoginController.baseUrl+'/login'),
//         body: {
//           'type': 'Real Estate',
//           'email': 'mary@gmail.com',
//           'password': '123',
//         }
//     );
//
//     if (response.statusCode == 200) {
//       // If the server did return a 200 OK response,
//       // then parse the JSON.
//       return UserModel.fromJson(jsonDecode(response.body));
//     } else {
//       throw Exception('Failed to get User');
//     }
//   }
//
//   factory UserModel.fromJson(Map json){
//     return UserModel(
//         id: json['_id'],
//         full_name: json['full_name'],
//         fname: json['first_name'],
//         lname: json['last_name'],
//         type: json['type'],
//         number: json['phone'],
//         email: json['email'],
//         password: json['password']
//     );
//   }
//
// }