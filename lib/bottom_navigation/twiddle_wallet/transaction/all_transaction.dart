import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/constants.dart';
import 'transaction.dart';

class AllTransactions extends StatelessWidget {
  const AllTransactions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: transparent,
          automaticallyImplyLeading: false,
          elevation: 0,
          title: BackButtonText(text: 'Transactions')
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            children: [

              Height(),
              Transactions(
                type: 'Withdrawal Completed Successfully',
                date: '10-Aug-2022',
                amount: 150,
              ),
              Transactions(
                type: 'Top Up Successfully',
                date: '08-Aug-2022',
                amount: 500,
              ),
              Transactions(
                type: 'Paid For Service Successfully',
                date: '08-Aug-2022',
                amount: 200,
              ),
              Transactions(
                type: 'Invested Successfully',
                date: '06-Aug-2022',
                amount: 10000,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
