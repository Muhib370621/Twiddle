// import 'package:get/get.dart';
// import 'package:flutter/material.dart';
// import 'package:state_agent/Utilities/constants.dart';
// import 'package:state_agent/Utilities/roundBackButton.dart';
// import '../../Utilities/bigWhiteButton.dart';
// import '../RentProperty/rentDetail3.dart';
// import 'investNow.dart';
//
// class BuySummary extends StatefulWidget {
//   const BuySummary({Key? key}) : super(key: key);
//
//   @override
//   State<BuySummary> createState() => _BuySummaryState();
// }
//
// class _BuySummaryState extends State<BuySummary> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Padding(
//         padding: const EdgeInsets.only(left: 20, right: 20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(height: Get.height * 0.06),
//             Row(
//               children: [
//                 RoundBackButton(),
//                 SizedBox(width: 15),
//                 Text(
//                   'SUMMARY',
//                   style: TextStyle(
//                     fontFamily: "PoppinsBold",
//                     fontSize: 12,
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: Get.height * 0.03,
//             ),
//             Text(
//               'Property Payment Details',
//               style: kBlueHeadingStyle.copyWith(fontSize: 16),
//             ),
//             SizedBox(height: Get.height * 0.014),
//             priceField('Property Price', 'GHC 876,988'),
//             SizedBox(height: Get.height * 0.02),
//             divider(),
//             SizedBox(height: Get.height * 0.014),
//             Text(
//               'Service Fees/Charges',
//               style: kBlueHeadingStyle.copyWith(fontSize: 16),
//             ),
//             SizedBox(height: Get.height * 0.014),
//             priceField('Mediation Fee (4%)', 'Ghc 35,079.52'),
//             SizedBox(height: Get.height * 0.02),
//             divider(),
//             SizedBox(height: Get.height * 0.02),
//             Row(
//               children: [
//                 Text('Total Payment', style: kGreySmallText.copyWith(fontSize: 14,  color: kBlueButtonColor),),
//                 Spacer(),
//                 Text(
//                   'GHC 912,067.52',
//                   style: TextStyle(
//                     fontFamily: "PoppinsMedium",
//                     fontSize: 14,
//                     color: kBlueButtonColor,
//                   ),
//                 ),
//                 SizedBox(
//                   width: Get.width * 0.022,
//                 ),
//                 Icon(
//                   Icons.info_outline,
//                   color: Color(0xFF1492E6),
//                   size: 20,
//                 )
//               ],
//             ),
//             Spacer(),
//             CustomBlueButton(
//               height: Get.height * 0.08,
//               width: Get.width,
//               text: "Continue",
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) {
//                     return InvestNow();
//                   }),
//                 );
//               },
//               fontSize: 14,
//             ),
//             SizedBox(
//               height: Get.height * 0.06,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// Widget divider() {
//   return Container(
//     height: 0.2,
//     width: Get.width,
//     color: Color(0xFF707070),
//   );
// }
//
//
