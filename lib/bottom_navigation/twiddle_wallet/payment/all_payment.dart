import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/constants.dart';
import 'payment.dart';

class AllPayments extends StatelessWidget {
  const AllPayments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: transparent,
          automaticallyImplyLeading: false,
          elevation: 0,
          title: BackButtonText(text: 'Payments')
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            children: [

              Height(),

              Payments(
                paymentStatus: 'Cleared',
                amount: 250000,
              ),
              Payments(
                paymentStatus: 'Clear in 03 Days',
                amount: 30000,
              )

            ],
          ),
        ),
      ),
    );
  }
}
