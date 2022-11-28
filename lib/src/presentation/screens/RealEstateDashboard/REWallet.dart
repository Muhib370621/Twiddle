import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:twiddle_refactored/src/core/utils/app_colors.dart';

import '../../../controller/Real State Controllers/bottomWalletController.dart';
import '../../components/RealEstateDashboard/TwiddleWallet/Wallet Header.dart';
import '../../components/RealEstateDashboard/TwiddleWallet/allPayments.dart';
import '../../components/RealEstateDashboard/TwiddleWallet/allTransactions.dart';
import '../../components/RealEstateDashboard/TwiddleWallet/button.dart';
import '../../components/RealEstateDashboard/TwiddleWallet/menu.dart';
import '../../components/RealEstateDashboard/TwiddleWallet/paymentCard.dart';
import '../../components/RealEstateDashboard/TwiddleWallet/transactionCard.dart';
import '../../components/RealEstateDashboard/drawer.dart';
import '../../components/RealEstateDashboard/myContainer.dart';

class REWallet extends StatelessWidget {
  final BottomWalletController reWalletController = Get.put(BottomWalletController());
   REWallet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> walletKey = GlobalKey();
    return Scaffold(
      key: walletKey,
      appBar: AppBar(
          backgroundColor: AppColors.mainColor,
          automaticallyImplyLeading: false,
          elevation: 0,
          title: MyContainer(
            color: AppColors.transparent,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    walletKey.currentState!.openDrawer();
                  },
                  child: Container(
                    height: 5.h,
                    width: 12.w,
                    decoration: const BoxDecoration(


                        color: AppColors.kWhite,
                        shape: BoxShape.circle

                    ),
                    // shape: BoxShape.circle,
                    // radius: 100,
                    // horizontalPadding: 10,
                    // verticalPadding: 5,
                    // shadowColor: AppColors.mainBg,

                    child: Icon(FontAwesomeIcons.barsStaggered,
                        size: 16.5.sp, color: AppColors.welcomeTwiddle),
                  ),
                ),
                SizedBox(
                  width: 7.w,
                ),
                Text('Twiddle Wallet',
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: AppColors.kWhite,
                    )),
                Expanded(child: Container()),
                const Menu()
              ],
            ),
          )),
      drawer: const MyDrawer(),
      body: Obx(() => SizedBox(
        // width:100.w,
        // height: Get.height,
        child: Column(
          children: [
            TwHeader(
              amount: "200",
            ),
            SizedBox(
              height: 2.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.w),
              child: Row(
                children: [
                  Button(
                    width: 100.w,
                    height: 40.h,
                    size: 14.5.sp,
                    text: 'Payments',
                    radius: 5,
                    color: reWalletController.body.value == 'payment' ? AppColors.kWhite : AppColors.welcomeTwiddle,
                    buttonColor: reWalletController.body.value == 'payment' ? AppColors.mainColor : AppColors.kWhite,
                    onTap: () {
                      // setState(() {
                      reWalletController.body.value = 'payment';
                      // });
                    },
                  ),
                  SizedBox(width: 4.w),
                  Button(
                    width: 100.w,
                    height: 40.h,
                    size: 14.5.sp,
                    color: reWalletController.body.value == 'transaction' ? AppColors.kWhite : AppColors.welcomeTwiddle,
                    buttonColor:
                    reWalletController.body.value == 'transaction' ? AppColors.mainColor : AppColors.kWhite,
                    text: 'Transactions',
                    radius: 5,
                    onTap: () {
                      // setState(() {
                      reWalletController.body.value = 'transaction';
                      // });
                    },
                  )
                ],
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 7.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    reWalletController.body.value == 'payment'
                        ? 'Recent Payments'
                        : 'Recent Transactions',
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500),),
                  GestureDetector(
                    onTap: reWalletController.body.value == 'payment'
                        ? () => Get.to(() => const AllPayments())
                        : () => Get.to(() => const AllTransactions()),
                    child: Column(
                      children: [
                        const Text(
                          'View All',
                          style: TextStyle(
                              color: AppColors.mainColor,
                              fontWeight: FontWeight.w500),),
                        MyContainer(
                          color: AppColors.mainColor,
                          width: 40.w,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 1.h,),
            reWalletController.body.value == 'payment'
                ? Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      PaymentCard(
                        paymentStatus: 'Cleared',
                        amount: 250000,
                      ),
                      PaymentCard(
                        paymentStatus: 'Clear in 03 Days',
                        amount: 30000,
                      ),
                    ],
                  ),
                ))
                : Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      TransactionCard(
                        type: 'Withdrawal Completed Successfully',
                        date: '10-Aug-2022',
                        amount: 150,
                      ),
                      TransactionCard(
                        type: 'Top Up Successfully',
                        date: '08-Aug-2022',
                        amount: 500,
                      ),
                      TransactionCard(
                        type: 'Paid For Service Successfully',
                        date: '08-Aug-2022',
                        amount: 200,
                      ),
                      TransactionCard(
                        type: 'Invested Successfully',
                        date: '06-Aug-2022',
                        amount: 10000,
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),)

    );
  }
}
