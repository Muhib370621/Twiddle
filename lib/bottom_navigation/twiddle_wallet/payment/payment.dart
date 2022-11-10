import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants/constants.dart';

class Payments extends StatelessWidget {
  String? paymentStatus; double? amount;
  Payments({Key? key, this.paymentStatus, this.amount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyContainer(
      horizontalPadding: 10, color: white,
      radius: 15, verticalPadding: 15,
      verticalMargin: 5,
      shadowColor: maincolor.withOpacity(0.1),
      child: Row(
        children: [
          SvgPicture.asset('assets/twiddle/payment.svg'),
          Width(),
          Expanded(
            child: Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PoppinsText(text: 'Twiddle INV', fontWeight: FontWeight.w500),
                    PoppinsText(text: 'GHC ${amount}', size: 14, fontWeight: FontWeight.bold)
                  ],
                ),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconText(icon: Icons.wallet, text: 'Upcoming', color: hinttext, iconColor: hinttext),
                        Width(),
                        IconText(icon: Icons.check_circle, text: 'Property Rent ', color: hinttext, iconColor: hinttext),
                      ],
                    ),



                    PoppinsText(
                        text: paymentStatus!,
                        size: 10,
                        color: paymentStatus == 'Cleared'?
                        active : orange ,
                        fontWeight: FontWeight.w500),
                  ],
                )
              ],
            ),
          )

        ],
      ),
    );
  }
}