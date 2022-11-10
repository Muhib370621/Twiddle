// import 'package:state_agent/Utilities/roundBackButton.dart';
// import 'package:get/get.dart';
// import 'package:flutter/material.dart';
// import '../../Utilities/bigWhiteButton.dart';
//
//
// class PayWithCard extends StatefulWidget {
//   const PayWithCard({Key? key}) : super(key: key);
//
//   @override
//   State<PayWithCard> createState() => _PayWithCardState();
// }
//
// class _PayWithCardState extends State<PayWithCard> {
//   final controller = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       backgroundColor: Colors.white,
//       body: Padding(
//         padding: const EdgeInsets.only(left: 20, right: 20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(
//               height: Get.height * 0.06,
//             ),
//             Row(
//               children: [
//                 RoundBackButton(),
//                 SizedBox(
//                   width: 10,
//                 ),
//                 Text(
//                   'PAY WITH CARD',
//                   style: TextStyle(
//                     fontFamily: "PoppinsBold",
//                     fontSize: 12,
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: Get.height * 0.035,
//             ),
//             Text(
//               'Card Details',
//               style: TextStyle(
//                 color: Color(0xFF2E3034),
//                 fontSize: 18,
//                 fontFamily: "PoppinsMedium",
//               ),
//             ),
//             SizedBox(
//               height: Get.height * 0.02,
//             ),
//             Text(
//               'Card Number',
//               style: labelStyle,
//             ),
//             SizedBox(
//               height: Get.height * 0.015,
//             ),
//             Container(
//               height: Get.height * 0.06,
//               width: Get.width,
//               padding: EdgeInsets.only(
//                 left: Get.width * 0.025,
//                 bottom: Get.height * 0.002,
//               ),
//               decoration: BoxDecoration(
//                 boxShadow: [
//                   BoxShadow(
//                     color: Color(0xFFF2F6FE),
//                     spreadRadius: 0.5,
//                   )
//                 ],
//                 shape: BoxShape.rectangle,
//                 color: Color(0xFFF2F6FE),
//                 borderRadius: BorderRadius.circular(6),
//                 border: Border.all(color: Color(0xFFF2F6FE), width: 1),
//               ),
//               child: TextField(
//                 controller: controller,
//                 style:
//                     TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
//                 decoration: InputDecoration(
//                   suffixIcon: Image.asset(
//                     'assets/masterCard.png',
//                     scale: 2,
//                   ),
//                   border: InputBorder.none,
//                   hintText: '0000 0000 0000 0000',
//                   hintStyle: TextStyle(
//                     color: Color(0xFFB4B6BA),
//                     fontSize: 12,
//                     fontFamily: "PoppinsMedium",
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: Get.height * 0.022,
//             ),
//             Text(
//               'Cardholder Name',
//               style: labelStyle,
//             ),
//             SizedBox(
//               height: Get.height * 0.015,
//             ),
//             blueTextField(controller, 0.06, 'Jon Doe', 1, 1, 0),
//             SizedBox(
//               height: Get.height * 0.022,
//             ),
//             Row(
//               children: [
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Expire Date',
//                       style: labelStyle,
//                     ),
//                     SizedBox(
//                       height: Get.height * 0.015,
//                     ),
//                     blueTextField(controller, 0.06, '00/00', 0.43, 1, 0),
//                   ],
//                 ),
//                 Spacer(),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'CVV',
//                       style: labelStyle,
//                     ),
//                     SizedBox(
//                       height: Get.height * 0.015,
//                     ),
//                     blueTextField(controller, 0.06, '000', 0.43, 1, 0),
//                   ],
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: Get.height * 0.07,
//             ),
//             Center(
//               child: CustomBlueButton(
//                 height: Get.height * 0.072,
//                 width: Get.width * 0.88,
//                 text: 'Continue',
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) {
//                       return PayWithCard();
//                     }),
//                   );
//                 },
//                 fontSize: 14,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// const labelStyle = TextStyle(
//   fontFamily: "PoppinsMedium",
//   fontSize: 14,
//   color: Color(0xFF2E3034),
//   fontWeight: FontWeight.w100,
// );
//
// Widget blueTextField(
//   final controller,
//   double fieldHeight,
//   String hintText,
//   double fieldWidth,
//   int lines,
//   double topPadding,
// ) {
//   return Container(
//     height: Get.height * fieldHeight,
//     width: Get.width * fieldWidth,
//     padding: EdgeInsets.only(
//       left: Get.width * 0.025,
//       bottom: Get.height * 0.002,
//     ),
//     decoration: BoxDecoration(
//       boxShadow: [
//         BoxShadow(
//           color: Color(0xFFF2F6FE),
//           spreadRadius: 0.5,
//         )
//       ],
//       shape: BoxShape.rectangle,
//       color: Color(0xFFF2F6FE),
//       borderRadius: BorderRadius.circular(8),
//       border: Border.all(
//         color: Color(0xFFF2F6FE),
//         width: 1,
//       ),
//     ),
//     child: TextField(
//       maxLines: lines,
//       controller: controller,
//       style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
//       decoration: InputDecoration(
//         contentPadding: EdgeInsets.only(
//           bottom: Get.height * 0.02,
//           top: Get.height * topPadding,
//         ),
//         border: InputBorder.none,
//         hintText: hintText,
//         hintStyle: TextStyle(
//           color: Color(0xFFB4B6BA),
//           fontSize: 12,
//           fontFamily: "PoppinsMedium",
//         ),
//       ),
//     ),
//   );
// }
