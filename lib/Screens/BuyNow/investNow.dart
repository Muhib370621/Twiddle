// import 'package:get/get.dart';
// import 'package:flutter/material.dart';
// import 'package:state_agent/Screens/BuyNow/payWithCard.dart';
// import 'package:state_agent/Screens/BuyNow/payWithTwiddle.dart';
// import 'package:state_agent/Utilities/roundBackButton.dart';
// import '../bottom_navi/service_screen/invest_now.dart';
//
//
// class InvestNo extends StatefulWidget {
//   const InvestNow({Key? key}) : super(key: key);
//
//   @override
//   State<InvestNow> createState() => _InvestNowState();
// }
//
// class _InvestNowState extends State<InvestNow> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Padding(
//         padding: const EdgeInsets.only(left: 15,right: 15),
//         child: Column(
//           children: [
//             SizedBox(height: 40),
//             Row(
//               children: [
//                 RoundBackButton(),
//                 SizedBox(width: 10),
//                 Text("INVEST NOW",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold))
//               ],
//             ),
//             SizedBox(height: 30),
//             selectInvest(tap: (){Get.to(()=>PayWithTwiddle());},investImage: "assets/twiddle.png",titleInves: "Pay with Twiddle Wallet"),
//             SizedBox(height: 20),
//             selectInvest(tap: (){Get.to(()=>PayWithCard());},investImage: "assets/credit.png",titleInves: "Pay with Credit or Debit Card"),
//             SizedBox(height: 20),
//             selectInvest(tap: (){Get.to(()=>PayWithCard());},investImage: "assets/wallet.png",titleInves: "Pay with Wallets"),
//
//           ],
//         ),
//       ),
//     );
//
//   }
// }
//
//
