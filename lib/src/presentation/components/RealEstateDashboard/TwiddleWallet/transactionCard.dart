import 'package:flutter/material.dart';
import 'package:twiddle_refactored/src/core/utils/app_colors.dart';

import '../myContainer.dart';

class TransactionCard extends StatelessWidget {
  String? type;
  String? date;
  double? amount;
  TransactionCard({Key? key, this.type, this.date, this.amount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyContainer(
      horizontalPadding: 8,
      color: AppColors.kWhite,
      radius: 15,
      verticalPadding: 2,
      shadowColor: AppColors.mainColor.withOpacity(0.1),
      verticalMargin: 1,
      horizontalMargin: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    type!,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  Text(
                    date!,
                    style: const TextStyle(color: AppColors.kLightGrey),
                  )
                ],
              ),
              type == 'Withdrawal Completed Successfully' ||
                      type == 'Invested Successfully'
                  ? Text('GHC $amount',
                      style: const TextStyle(
                          color: AppColors.redText,
                          fontWeight: FontWeight.w500))
                  : Text(
                      'GHC $amount',
                      style: const TextStyle(
                        color: AppColors.kGreenAccent,
                        fontWeight: FontWeight.w500,
                      ),
                    )
            ],
          )
        ],
      ),
    );
  }
}
