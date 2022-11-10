import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_agent/Screens/bottom_navi/twiddle_wallet/top_up_twiddle_wallet.dart';
import 'package:state_agent/constants/constants.dart';

import '../../../bottom_navigation/dashboard/invest/pay_now.dart';
import '../service_screen/payWithWallet.dart';

class TopUpInvest extends StatefulWidget {
  const TopUpInvest({Key? key}) : super(key: key);

  @override
  State<TopUpInvest> createState() => _TopUpInvestState();
}

class _TopUpInvestState extends State<TopUpInvest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 15,right: 15),
        child: Column(
          children: [
            SizedBox(height: 40),
            BackButtonText(text: 'top-up twiddle wallet'),
            SizedBox(height: 30),
            selectInvest(tap: (){Get.to(()=>TopUpTwiddleWallet());},investImage: "assets/credit.png",titleInvest: "Pay with Credit or Debit Card"),
            SizedBox(height: 20),
            selectInvest(tap: (){Get.to(()=>PayWithWallet());},investImage: "assets/wallet.png",titleInvest: "Pay with Wallets"),

          ],
        ),
      ),
    );
  }
}
