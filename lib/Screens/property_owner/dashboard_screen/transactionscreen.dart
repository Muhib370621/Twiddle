import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:state_agent/constants/constants.dart';

import '../../bottom_navi/twiddle_wallet/dash_twiddleWall.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: maincolor,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        color: white,
        child: Column(
          children: [
            Height(size: 40),
            BackButtonText(text: 'Transactions', size: 16, fontWeight: FontWeight.bold),
            Height(size: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Wrap(
                  children: List.generate(3, (index) =>
                      Column(children: [
                        RecentTransaction(),
                        SizedBox(height: 10)
                      ],),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
