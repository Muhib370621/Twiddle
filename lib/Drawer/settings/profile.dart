// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:provider/provider.dart';
// import 'package:state_agent/Screens/user_auth/CreateAccount/createAcount.dart';
//
// import '../../constants/constants.dart';
// import '../../constants/hive/hive.dart';
// import '../../user/google_signin.dart';
//
// class Profile extends StatefulWidget {
//   const Profile({Key? key}) : super(key: key);
//
//   @override
//   State<Profile> createState() => _ProfileState();
// }
//
// class _ProfileState extends State<Profile> {
//   bool show = true;
//   final fname = TextEditingController(text: user.get('first_name'));
//   final lname = TextEditingController(text: user.get('last_name'));
//   final phone = TextEditingController(text: user.get('phone'));
//   final email = TextEditingController(text: user.get('email'));
//   final password = TextEditingController(text: user.get('password'));
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: shadowcolor,
//       appBar: AppBar(
//         title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             BackButtonText(
//                 text: 'Edit Profile', size: 16,
//               buttonColor: white,
//               iconColor: black,
//             ),
//             PoppinsText(text: 'Save', size: 14, color: maincolor, fontWeight: FontWeight.w700)
//           ],
//         ),
//         automaticallyImplyLeading: false,
//         elevation: 0,
//         backgroundColor: shadowcolor,
//       ),
//       body: SafeArea(
//           child: Container(
//             color: white,
//             width: Get.width, height: Get.height,
//             padding: EdgeInsets.symmetric(horizontal: 15.w),
//             child: SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//
//                   Height(size: 20,),
//                   PoppinsText(text: 'Respond to the following and proceed.', size: 14,
//                     fontWeight: FontWeight.w500, color: hinttext,),
//
//                   Height(size: 15),
//                   Stack(
//                     children: [
//
//                       user.get('img').toString().isURL?
//                           Picture(
//                             size: 60,
//                             url: user.get('img').toString(),
//                           ) : Picture(
//                         size: 60,
//                         file: user.get('img').toString(),
//                       ),
//
//                       Positioned(
//                         right: 0, bottom: 0,
//                           child: Icon(Icons.add_a_photo, color: grey)
//                       )
//
//                     ],
//                   ),
//
//                   Height(),
//                   PoppinsText(
//                       text: 'Select a presentable photo for yourself this is very important.',
//                       color: hinttext, size: 10),
//
//                   Field(
//                     text: 'FIRST NAME',
//                     controller: fname,
//                   ),
//                   Field(
//                     text: 'LAST NAME',
//                     controller: lname,
//                   ),
//                   Field(
//                     text: 'PHONE NUMBER',
//                       controller: phone,
//                   ),
//                   Field(
//                     text: 'EMAIL ADDRESS',
//                       controller: email,
//                   ),
//
//                   Height(size: 15,),
//                   PoppinsText(text: 'PASSWORD', fontWeight: FontWeight.w500),
//                   Height(),
//                   MyTextField(
//                     radius: 5, height: 45,
//                     borderColor: black,
//                     onSuffixIconTap: (){
//                       setState(() {
//                         show = !show;
//                       });
//                     },
//                     controller: password,
//                     obscureText: show,
//                     suffixIcon: show == false ? Icons.remove_red_eye : Icons.visibility_off_rounded,
//                   ),
//
//                   Height(size: 20),
//                   PoppinsText(text: 'Optional Information', size: 16, fontWeight: FontWeight.w500),
//                   Height(size: 15,),
//                   PoppinsText(text: 'GOOGLE ACCOUNT', fontWeight: FontWeight.w500),
//
//                   Height(),
//                   Button(
//                     onTap: (){
//                       final provider = Provider.of<GoogleSigninProvider>(context, listen: false);
//                       provider.disconnect();
//                     },
//                     borderColor: black,
//                     text: 'Disconnect',
//                     color: black,
//                     buttonColor: white,
//                     radius: 5,
//                   ),
//
//                   Height(size: 20),
//
//                 ],
//               ),
//             ),
//           )
//       ),
//     );
//   }
// }
