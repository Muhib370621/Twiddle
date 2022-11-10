import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../Utilities/comp_screen.dart';
import '../../../bottom_navigation/dashboard/invest/pay_now.dart';
import '../../../constants/constants.dart';
import '../../../constants/success_screen.dart';
import 'hired_service.dart';


class PayWithWallet extends StatefulWidget {
  const PayWithWallet({Key? key}) : super(key: key);

  @override
  State<PayWithWallet> createState() => _PayWithWalletState();
}

class _PayWithWalletState extends State<PayWithWallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: Get.height * 0.06),
            Row(
              children: [
                RoundBackButton(),
                SizedBox(width: 10),
                Text('INVEST NOW', style: TextStyle(fontFamily: "PoppinsBold", fontSize: 15,fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: Get.height * 0.04),
            selectInvest(tap: (){showDialog(context: context, builder: (context) => dialogBox3(context),);},investImage: "assets/paypalicon.png",titleInvest: "PayPal"),
          ],
        ),
      ),
    );
  }
}

AlertDialog dialogBox3(context) {
  return AlertDialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(
        30,
      ),
    ),
    title: Column(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: Color(0xFF9C9C9C),
                shape: BoxShape.circle,
              ),
              child: Icon(
                FontAwesomeIcons.xmark,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 0),
          child: SvgPicture.asset('assets/payPal.svg'),
        ),
      ],
    ),
    elevation: 20,
    content: Padding(
      padding: EdgeInsets.only(top: 10, left: Get.width * 0.155),
      child: Text(
        'Log In with PayPal',
        style: kLargeTextStyle.copyWith(
            fontFamily: "PoppinsSemiBold", fontSize: 15),
      ),
    ),
    actions: [
      SizedBox(
        height: Get.height * 0.02,
      ),
      Padding(
        padding: EdgeInsets.only(
          left: 10,
          right: 10,
          bottom: Get.height * 0.04,
        ),
        child: CustomBlueButton(
          height: Get.height * 0.055,
          width: Get.width * 0.6,
          text: 'Log In',
          onPressed: () {
            Get.to(()=>SuccessScreen(
              text: 'You succesfully maked a payment!',
              buttonText: 'Go To Hired',
              onTap: (){
                Get.to(()=>HiredService());
              },
            ));
          },
          fontSize: 14,
        ),
      ),
      SizedBox(
        height: Get.height * 0.02,
      ),
    ],
  );
}
