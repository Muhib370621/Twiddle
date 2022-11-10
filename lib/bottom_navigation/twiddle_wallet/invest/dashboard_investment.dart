import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:state_agent/bottom_navigation/twiddle_wallet/transaction/transaction.dart';
import 'package:state_agent/constants/constants.dart';

import '../../../Screens/property_owner/dashboard_screen/cash_out_return.dart';
import '../../../Utilities/widgets.dart';
import '../../dashboard/invest/invest_now.dart';
import 'chart.dart';


class DashboardInvest extends StatefulWidget {
  const DashboardInvest({Key? key}) : super(key: key);

  @override
  State<DashboardInvest> createState() => _DashboardInvestState();
}

class _DashboardInvestState extends State<DashboardInvest> {

  bool showAvg = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: maincolor,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: BackButtonText(
          buttonColor: white,
          iconColor: maincolor,
          color: white,
          text: 'Investment Dashboard'
        ),
      ),
      backgroundColor: white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [

              MyContainer(
                color: maincolor,
                horizontalPadding: 25,
                child: Column(
                  children: [

                    Height(size: 20,),

                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 35.w),
                      child: Column(
                        children: [
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              mytext("No. Of Projects", 12, white),
                              SizedBox(height: Get.height * 0.01),
                              mytext("Net Profit", 12, white),
                            ],),

                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  mytext("See Projects", 12, white),
                                  mytext(" 02", 16, white),

                                ],
                              ),
                              SizedBox(height: Get.height * 0.01),
                              mytextbold("GHC 5,350", 18, white),

                            ],)

                        ],
                      ),
                    ),

                    SizedBox(height: 16.h,),

                    Container(
                      height: 80.h,

                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              mytext("Amount Invested", 12, black),
                              mytextbold("GHC 2,350", 16, maincolor),
                            ],
                          ),
                          SizedBox(width: 40),
                          Container(width: 1, height: Get.height * 0.052, color: Colors.black),
                          SizedBox(width: 40),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              mytext("Returns Gained", 12, black),
                              mytextbold("GHC 3,000", 16, maincolor),

                            ],
                          ),

                        ],
                      ),
                    ),

                    SizedBox(height: 20.h,),

                    Container(
                      //height: .0,
                      //color: Colors.amberAccent,
                      child: Stack(
                        children: <Widget>[
                          AspectRatio(
                            aspectRatio: 1.60,
                            child: Container(
                              decoration:
                              BoxDecoration(color: Color(0xff0336FF)),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    right: 18.0,
                                    left: 12.0,
                                    top: 10,
                                    bottom: 10),
                                child: LineChart(
                                  showAvg ? avgData() : mainData(),
                                ),
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),


                    SizedBox(
                      width: 60,
                      height: 34,
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            showAvg = !showAvg;
                          });
                        },
                        child: Text(
                          'avg',
                          style: TextStyle(
                              fontSize: 12,
                              color: showAvg
                                  ? Colors.white.withOpacity(0.0)
                                  : Colors.white),
                        ),
                      ),
                    ),


                  ],
                ),
              ),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 15.w),

                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    SizedBox(height: 25.h,),

                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: (){
                              Get.to(()=>CashOutReturn());
                            },
                            child: Container(
                              width: Get.width*0.26, height: Get.height/8,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                        color: shadowcolor,
                                        blurRadius: 10
                                    )
                                  ]
                              ),

                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [

                                  PoppinsText(text: 'Cash Out\nReturns', size: 10, color: maincolor, textAlign: TextAlign.center),
                                  Height(size: 5,),
                                  SvgPicture.asset("assets/walletic.svg", height: Get.height/25,),


                                ],
                              ),
                            ),
                          ),

                          GestureDetector(
                            onTap: (){
                              Get.to(()=>InvestNow());
                            },
                            child: Container(
                              width: Get.width*0.26, height: Get.height/8,
                              decoration: BoxDecoration(
                                color: maincolor,
                                borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                        color: shadowcolor,
                                        blurRadius: 10
                                    )
                                  ]
                              ),

                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  PoppinsText(text: 'Top Up\n Investment', size: 10, color: white, textAlign: TextAlign.center,),
                                  Height(size: 5,),
                                  SvgPicture.asset("assets/send.svg"),
                                ],
                              ),
                            ),
                          ),

                          GestureDetector(
                            onTap: (){
                              Get.to(()=>InvestNow());
                            },
                            child: Container(
                              width: Get.width*0.26, height: Get.height/8,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                        color: shadowcolor,
                                        blurRadius: 10
                                    )
                                  ]
                              ),

                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  PoppinsText(text: 'Invest In\n Projects', size: 10, color: maincolor, textAlign: TextAlign.center,),
                                  Height(size: 5,),
                                  SvgPicture.asset("assets/top.svg", height: Get.height/25,),

                                ],
                              ),
                            ),
                          ),


                        ]),

                    SizedBox(height: 28.h,),

                    PoppinsText(text: 'Recent Transactions', size: 16),
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
                    Transactions(
                      type: 'Invested Successfully',
                      date: '06-Aug-2022',
                      amount: 10000,
                    ),

                  ],),
              )
            ],
          ),
        ),
      ),
    );
  }
}


