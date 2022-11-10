// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:state_agent/Utilities/constants.dart';
// import 'package:state_agent/Utilities/roundBackButton.dart';
// import '../BuyNow/payWithCard.dart';
// import '../bottom_navi/home_screen/ad.dart';
//
// class ReportAgent extends StatefulWidget {
//   const ReportAgent({Key? key}) : super(key: key);
//
//   @override
//   State<ReportAgent> createState() => _ReportAgentState();
// }
//
// class _ReportAgentState extends State<ReportAgent> {
//   final controller = TextEditingController();
//   final controller2 = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       backgroundColor: Colors.white,
//       body: Padding(
//         padding: EdgeInsets.only(
//           top: Get.height * 0.058,
//           left: Get.width * 0.05,
//           right: Get.width * 0.05,
//         ),
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 RoundBackButton(),
//                 SizedBox(
//                   width: Get.width * 0.04,
//                 ),
//                 Text(
//                   'Report Agent',
//                   style: TextStyle(
//                     fontFamily: "PoppinsBold",
//                     fontSize: 16,
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: Get.height * 0.05,
//             ),
//             Container(
//               height: Get.height * 0.45,
//               width: Get.width,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(25),
//                 color: Colors.white,
//                 boxShadow: [
//                   BoxShadow(
//                       color: Color(0xFFEBEFFF),
//                       spreadRadius: 8,
//                       offset: Offset(2, 12),
//                       blurRadius: 10),
//                 ],
//               ),
//               child: Padding(
//                 padding: EdgeInsets.only(
//                     top: Get.height * 0.03,
//                     left: Get.width * 0.035,
//                     right: Get.width * 0.035),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'What do you want to report us?',
//                       style: TextStyle(
//                         color: Color(
//                           0xFF2E3034,
//                         ),
//                         fontFamily: "PoppinsMedium",
//                         fontSize: 12,
//                       ),
//                     ),
//                     SizedBox(
//                       height: Get.height * 0.012,
//                     ),
//                     // Center(
//                     //   child: blueTextField(
//                     //     controller,
//                     //     0.06,
//                     //     'Subject',
//                     //     0.815,
//                     //     1,
//                     //     0,
//                     //   ),
//                     // ),
//                     SizedBox(
//                       height: Get.height * 0.02,
//                     ),
//                     // Center(
//                     //   child: blueTextField(
//                     //     controller2,
//                     //     0.175,
//                     //     'Report...',
//                     //     0.815,
//                     //     5,
//                     //     0.01,
//                     //   ),
//                     // ),
//                     SizedBox(
//                       height: Get.height * 0.033,
//                     ),
//                     Center(
//                       child: GestureDetector(
//                         onTap: () {
//                           dialogBox2(context, 'Report Submitted.', "Done",
//                               SvgPicture.asset('assets/check.svg'), () {
//                             Get.to(()=>ProductDetails());
//                           });
//                         },
//                         child: Container(
//                           height: 35,
//                           width: Get.width * 0.815,
//                           alignment: Alignment.center,
//                           decoration: BoxDecoration(
//                             color: kBlueButtonColor,
//                             borderRadius: BorderRadius.circular(9),
//                           ),
//                           child: Text(
//                             "Submit Report",
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 12,
//                               fontWeight: FontWeight.w600,
//                               fontFamily: "PoppinsMedium",
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
