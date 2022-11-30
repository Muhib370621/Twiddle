import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:state_agent/bottom_navigation/drawer.dart';
import 'package:state_agent/bottom_navigation/twiddle_wallet/more_vert/twidder_id.dart';
import 'package:state_agent/bottom_navigation/twiddle_wallet/payment/all_payment.dart';
import 'package:state_agent/bottom_navigation/twiddle_wallet/rent/rent_dashboard.dart';
import 'package:state_agent/bottom_navigation/twiddle_wallet/tw_body.dart';

import '../../Screens/bottom_navi/drawer_screen/install_dash/pay_install.dart';
import '../../constants/constants.dart';
import '../../constants/hive/hive.dart';
import 'more_vert/topup_wallet.dart';
import 'payment/payment.dart';
import 'transaction/all_transaction.dart';
import 'transaction/transaction.dart';

class TwiddleWallet extends StatefulWidget {
  TwiddleWallet({Key? key}) : super(key: key);

  @override
  State<TwiddleWallet> createState() => _TwiddleWalletState();
}

class _TwiddleWalletState extends State<TwiddleWallet> {
  String body = 'payment';
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> walletKey = GlobalKey();
    return Scaffold(
      key: walletKey,
      appBar: AppBar(
        backgroundColor: maincolor,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: MyContainer(
            color: transparent,

            child: Row(
              children: [

                GestureDetector(
                  onTap: (){
                    walletKey.currentState!.openDrawer();
                  },
                  child: MyContainer(
                    height: 40, width: 40, radius: 40,
                    horizontalPadding: 5, verticalPadding: 5,
                    color: white,
                    child: Icon(FontAwesomeIcons.barsStaggered, color: black, size: 20.sp),
                  ),
                ),

                Width(size: 15),

                PoppinsText(text: 'Twiddle Wallet', size: 14, color: white,),

                Expanded(child: Container()),

                Menu()

              ],
            ),
          )
      ),
      drawer: MyDrawer(),
      body: SafeArea(
        child: Container(
          width: Get.width, height: Get.height,
          child: Column(
            children: [

              TwHeader(
                amount:"100",
              ),

              Height(size: 20,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Row(
                  children: [
                    Button(
                      width: 100, height: 40,
                      size: 12,
                      text: 'Payments', radius: 5,
                      color: body == 'payment'? white : black,
                      buttonColor: body == 'payment'? maincolor : lightButton,
                      onTap: (){
                        setState(() {
                          body = 'payment';
                        });
                      },
                    ),
                    Width(size: 15),
                    Button(
                      width: 100, height: 40, size: 12,
                      color: body == 'transaction'? white : black,
                      buttonColor: body == 'transaction'? maincolor : lightButton,
                      text: 'Transactions', radius: 5,
                      onTap: (){
                        setState(() {
                          body = 'transaction';
                        });
                      },
                    )
                  ],
                ),
              ),

              Height(size: 15,),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PoppinsText(
                        text: body == 'payment'? 'Recent Payments' : 'Recent Transactions',
                        size: 16,
                        fontWeight: FontWeight.w500
                    ),


                    GestureDetector(
                      onTap: body == 'payment'?
                          ()=> Get.to(()=> AllPayments()) :
                          ()=> Get.to(()=> AllTransactions()),
                      child: Column(
                        children: [
                          PoppinsText(text: 'View All', color: maincolor, fontWeight: FontWeight.w500),
                          MyContainer(
                            color: maincolor,
                            width: 55,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),

              Height(),
              body == 'payment'?
              Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: Column(
                        children: [

                          Payments(
                            paymentStatus: 'Cleared',
                            amount: 250000,
                          ),

                          Payments(
                            paymentStatus: 'Clear in 03 Days',
                            amount: 30000,
                          ),


                        ],
                      ),
                    ),
                  )
              ) : Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: Column(
                        children: [

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
                  )
              )

            ],
          ),
        ),
      ),
    );
  }
}

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (){
          showDialog(
              context: context,
              builder: (context) =>
                  Dialog(
                    alignment: Alignment.topRight,
                    child: MyContainer(
                      horizontalPadding: 15,
                      verticalPadding: 15,
                      width: 200,
                      child: ListView(
                        shrinkWrap: true,
                        children: [

                          PoppinsText(text: 'More Menu', color: maincolor, size: 14),
                          Height(),
                          GestureDetector(
                              onTap: (){
                                Get.to(()=> PayInstallment());
                              },
                              child: PoppinsText(text: 'View Your Investment Dashboard', color: hinttext)),
                          Height(),
                          GestureDetector(
                              onTap: (){
                                Get.to(()=> RentDashboard());
                              },
                              child: PoppinsText(text: 'View Your Rent Dashboard', color: hinttext)),
                          Height(),
                          GestureDetector(
                              onTap: (){
                                Get.to(()=> TopUpWallet());
                              },
                              child: PoppinsText(text: 'Top-Up Your Twiddle Balance', color: hinttext)),
                          Height(),
                          GestureDetector(
                              onTap: (){
                                twiddleIDdialog(context);
                              },
                              child: PoppinsText(text: 'See Your Twiddle Wallet Id', color: hinttext)
                          ),

                        ],
                      ),
                    ),
                  )
          );
        },
        child: Icon(Icons.more_vert, size: 40, color: white,)
    );
  }
}
