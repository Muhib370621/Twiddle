// import 'package:hive_flutter/adapters.dart';
// import 'package:state_agent/Api_Services/user/login_controller.dart';
//
// final user = Hive.box('user');
//
// void write() {
//   user.put('id', LoginController.User['_id']);
//   user.put('full_name', LoginController.User['full_name']);
//   user.put('type', LoginController.User['type']);
//   user.put('first_name', LoginController.User['first_name']);
//   user.put('last_name', LoginController.User['last_name']);
//   user.put('wallet', LoginController.User['wallet']);
//   user.put('phone', LoginController.User['phone']);
//   user.put('profile_pic', LoginController.User['img']);
//   user.put('email', LoginController.User['email']);
//   user.put('date', LoginController.User['date']);
//   user.put('password', LoginController.User['password']);
//   user.put('install', 'true');
//
// }
// void read() {
//   user.get('id');
//   user.get('full_name');
//   user.get('type');
//   user.get('first_name');
//   user.get('last_name');
//   user.get('wallet');
//   user.get('phone');
//   user.get('profile_pic');
//   user.get('email');
//   user.get('date');
//   user.get('password');
//   user.get('install');
//
//   // print('id: '+user.get('id').toString());
//   // print('name: '+user.get('full_name').toString());
//   // print('type: '+user.get('type').toString());
//   // print('first name: '+user.get('first_name').toString());
//   // print('last name: '+user.get('last_name').toString());
//   // print('wallet: '+user.get('wallet').toString());
//   // print('phone: '+user.get('phone').toString());
//   // print('profile_pic: '+user.get('profile_pic').toString());
//   // print('email: '+user.get('email').toString());
//   // print('date: '+user.get('date').toString());
//   // print('password: '+user.get('password').toString());
//   // print('install: '+user.get('install').toString());
//
// }
// void delete() {
//   user.delete('id');
//   user.delete('full_name');
//   user.delete('type');
//   user.delete('first_name');
//   user.delete('last_name');
//   user.delete('wallet');
//   user.delete('phone');
//   user.delete('profile_pic');
//   user.delete('email');
//   user.delete('date');
//   user.delete('password');
// }