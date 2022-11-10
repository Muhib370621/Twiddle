import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:state_agent/constants/constants.dart';

import '../../../Screens/bottom_navi/service_screen/credit_card.dart';
import '../../../Screens/bottom_navi/service_screen/payWithWallet.dart';

class InvestScreen extends StatefulWidget {
  final payment;
  InvestScreen({Key? key, this.payment}) : super(key: key);

  @override
  State<InvestScreen> createState() => _InvestScreenState();
}

class _InvestScreenState extends State<InvestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: BackButtonText(text: 'INVEST NOW'),
        elevation: 0,
        backgroundColor: transparent,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            children: [

              Height(size: 20),
              selectInvest(tap: ()=> print('${widget.payment}'),investImage: "assets/twiddle.png",titleInvest: "Pay with Twiddle Wallet"),
              Height(size: 20),
              selectInvest(tap: ()=> ()=> Get.to(()=>CreditCard()) ,investImage: "assets/credit.png",titleInvest: "Pay with Credit or Debit Card"),
              Height(size: 20),
              selectInvest(tap: ()=> ()=> Get.to(()=>PayWithWallet()),investImage: "assets/wallet.png",titleInvest: "Pay with Wallets"),

            ],
          ),
        ),
      ),
    );
  }
}

Widget selectInvest({required VoidCallback tap, String? investImage,String? titleInvest}){
  return InkWell(
      onTap: tap,
      child:  MyContainer(
        shadowColor: maincolor.withOpacity(0.1), radius: 20,
        verticalPadding: 10, color: white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            Width(size: 15),
            Picture(
              size: 60,
              asset: investImage,
            ),

            Width(size: 20),
            PoppinsText(text: titleInvest!, size: 14),

          ],
        ),

      )
  );
}