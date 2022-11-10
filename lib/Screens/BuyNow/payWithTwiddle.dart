// import 'package:get/get.dart';
// import 'package:flutter/material.dart';
// import 'package:state_agent/Screens/paymentSuccess.dart';
// import '../../Utilities/bigWhiteButton.dart';
// import '../../Utilities/constants.dart';
// import '../../Utilities/roundBackButton.dart';
//
//
// class PayWithTwiddl extends StatefulWidget {
//   const PayWithTwiddle({Key? key}) : super(key: key);
//
//   @override
//   State<PayWithTwiddle> createState() => _PayWithTwiddleState();
// }
//
// class _PayWithTwiddleState extends State<PayWithTwiddle> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFFFCFDFF),
//       body: Column(
//         children: [
//           Container(
//               padding: EdgeInsets.only(
//                   left: Get.width * 0.05, right: Get.width * 0.05),
//               color: kBlueButtonColor,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(
//                     height: Get.height * 0.06,
//                   ),
//                   Row(
//                     children: [
//                       WhiteBackButton(),
//                       SizedBox(
//                         width: Get.width * 0.04,
//                       ),
//                       Text(
//                         'Twiddle Wallet',
//                         style: TextStyle(
//                             fontFamily: "PoppinsMedium",
//                             fontSize: 14,
//                             color: Colors.white),
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     height: Get.height * 0.03,
//                   ),
//                   Text(
//                     'Available Balance',
//                     style: TextStyle(
//                         fontFamily: "PoppinsMedium",
//                         fontSize: 14,
//                         color: Colors.white),
//                   ),
//                   Text(
//                     'Ghc 50,532.00',
//                     style: TextStyle(
//                       fontFamily: "PoppinsMedium",
//                       fontSize: 22,
//                       color: Colors.white,
//                     ),
//                   ),
//                   SizedBox(
//                     height: Get.height * 0.025,
//                   ),
//                   Image.asset(
//                     'assets/twiddleCard.png',
//                   ),
//                   SizedBox(
//                     height: Get.height * 0.05,
//                   ),
//                 ],
//               )),
//           Spacer(),
//           CustomBlueButton(
//             height: Get.height * 0.07,
//             width: Get.width * 0.9,
//             text: 'Continue',
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) {
//                   return PaymentSuccess();
//                 }),
//               );
//             },
//             fontSize: 14,
//           ),
//           SizedBox(height: Get.height * 0.04),
//         ],
//       ),
//     );
//   }
// }
