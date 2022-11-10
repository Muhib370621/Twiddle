import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:state_agent/constants/constants.dart';
import 'package:state_agent/constants/methods.dart';

class SPWallet extends StatelessWidget {
  const SPWallet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        width: Get.width, height: Get.height,
        child: Column(
          children: [

            Container(
              height: Get.height/(812/200), width: Get.width,
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              decoration: BoxDecoration(
                color: maincolor,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20.r),
                  bottomLeft: Radius.circular(20.r)
                )
              ),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Height(size: 40),
                  PoppinsText(text: 'Twiddle Wallet', size: 24, fontWeight: FontWeight.w500, color: white,),

                  Height(size: 15),
                  PoppinsText(text: 'Total Earning', size: 14, color: white,),

                  PoppinsText(text: 'Ghc ${authUser['wallet']}', size: 22, fontWeight: FontWeight.bold, color: white,),

                ],
              ),
            ),

            MyContainer(
              horizontalPadding: 20, color: transparent,
              child: Column(
                children: [

                  Height(size: 20),

                  Iconbutton(
                      shadowColor: maincolor.withOpacity(0.1),
                      buttonColor: white, color: maincolor, iconColor: maincolor,
                      icon: Icons.account_balance_wallet_outlined, iconSize: 20,
                      text: 'Withdraw Money'
                  ),

                  Height(size: 20),

                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      PoppinsText(text: 'Recent Withdrawal', size: 16),

                      GestureDetector(
                        onTap: (){
                          Get.to(AllRecentWithdrawal());
                        },
                        child: Container(
                          width: 50.w,
                          child: Column(
                            children: [
                              PoppinsText(text: 'view all', color: maincolor),
                              Container(color: maincolor, height: 1)
                            ],
                          ),
                        ),
                      ),

                    ],
                  ),

                  Height(size: 15),

                  Container(

                    child: RecentWithdrawal(),
                  )

                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}

class AllRecentWithdrawal extends StatelessWidget {
  const AllRecentWithdrawal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width, height: Get.height,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            
            Height(size: 40,),
            BackButtonText(text: 'Withdrawal', size: 16),
            Height(size: 20,),
            Column(
              children: List.generate(3, (index) => Column(
                children: [

                  RecentWithdrawal(),
                  Height()
                ],
              )),
            )
            
          ],
        ),
      ),
    );
  }
}


class RecentWithdrawal extends StatelessWidget {
  const RecentWithdrawal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyContainer(
      horizontalPadding: 20, verticalPadding: 15,
      radius: 15, shadowColor: lightButton,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          PoppinsText(text: 'Withdrawal Completed Successfully', fontWeight: FontWeight.w500,),
          Height(),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PoppinsText(text: '08-Aug-2022', color: hinttext),
              PoppinsText(text: 'GHC 150', color: active, fontWeight: FontWeight.w500,)
            ],
          )

        ],
      ),
    );
  }
}

