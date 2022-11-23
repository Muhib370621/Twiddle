import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:twiddle_refactored/src/core/utils/app_assets.dart';
import 'package:twiddle_refactored/src/core/utils/app_colors.dart';

import '../myContainer.dart';
import 'iconText.dart';

class PaymentCard extends StatelessWidget {
  String? paymentStatus;
  double? amount;
  PaymentCard({Key? key, this.paymentStatus, this.amount}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MyContainer(
      // horizontalPadding: 10,
      color: AppColors.kWhite,
      // radius: 15,
      // verticalPadding: 15,
      // verticalMargin: 5,
      shadowColor: AppColors.mainColor.withOpacity(0.1),
      child: Row(
        children: [
          SvgPicture.asset(AppAssets.bottomPay),
          SizedBox(
            width: 1.w,
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Twiddle INV',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    Text(
                      'GHC $amount',
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconText(
                          icon: Icons.wallet,
                          text: 'Upcoming',
                          color: AppColors.kWhite,
                          iconColor: AppColors.kWhite,
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        IconText(
                          icon: Icons.check_circle,
                          text: 'Property Rent ',
                          color: AppColors.kWhite,
                          iconColor: AppColors.kWhite,
                        ),
                      ],
                    ),
                    Text(
                      paymentStatus!,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: paymentStatus == 'Cleared'
                            ? AppColors.kGreenAccent
                            : AppColors.kLightOrange,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
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
