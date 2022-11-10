import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:state_agent/bottom_navigation/bottom_navigation.dart';

import '../../constants/constants.dart';
import '../../constants/hive/hive.dart';
import '../../constants/success_screen.dart';

class Wallet extends StatelessWidget {
  final amount;
  Wallet({Key? key, this.amount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: maincolor,
          automaticallyImplyLeading: false,
          elevation: 0,
          title: Row(
            children: [

              MyBackButton(
                color: white,
                iconColor: maincolor,
              ),

              Width(size: 10,),

              PoppinsText(text: 'Twiddle Wallet', size: 14, color: white)

            ],
          )
      ),
      body: SafeArea(
          child: Container(
            child: Column(
              children: [

                MyContainer(
                  horizontalPadding: 15,
                  color: maincolor,
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Height(size: 20),
                      PoppinsText(text: 'Available Balance', size: 14, color: white),

                      Height(),
                      PoppinsText(text: 'Ghc ${user.get('wallet')}', size: 22, color: white),

                      Height(size: 40)
                    ],
                  ),
                ),

                Expanded(child: Container()),

                amount != null?
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Button(
                    onTap: (){
                      Get.to(()=> SuccessScreen(
                        text: 'You have successfully made a payment!',
                        buttonText: 'Done',
                        onTap: (){
                          Get.to(()=> BottomNav());
                        },
                      ));
                    },
                    text: 'Pay Now',
                  ),
                ) : Container(),

                Height(size: 20)
              ],
            ),
          )
      ),
    );
  }
}
