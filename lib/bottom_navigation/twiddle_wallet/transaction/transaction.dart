import 'package:flutter/material.dart';

import '../../../constants/constants.dart';

class Transactions extends StatelessWidget {
  String? type; String? date; double? amount;
  Transactions({Key? key, this.type, this.date, this.amount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyContainer(
      horizontalPadding: 10, color: white,
      radius: 15, verticalPadding: 15,
      shadowColor: maincolor.withOpacity(0.1),
      verticalMargin: 5,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PoppinsText(text: type!, fontWeight: FontWeight.w500),
                  PoppinsText(text: date!, color: hinttext),
                ],
              ),

              type == 'Withdrawal Completed Successfully' ||
                  type == 'Invested Successfully'?
              PoppinsText(text: 'GHC ${amount}', color: redtext, fontWeight: FontWeight.w500) :
              PoppinsText(text: 'GHC ${amount}', color: active, fontWeight: FontWeight.w500)

            ],
          )

        ],
      ),
    );
  }
}