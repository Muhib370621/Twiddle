import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Utilities/widgets.dart';
import '../../../constants/constants.dart';


class CashOutReturn extends StatefulWidget {
  const CashOutReturn({Key? key}) : super(key: key);

  @override
  State<CashOutReturn> createState() => _CashOutReturnState();
}

class _CashOutReturnState extends State<CashOutReturn> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: transparent,
            automaticallyImplyLeading: false,
            elevation: 0,
            title: BackButtonText(text: 'Cash out returns')
        ),
        body: SafeArea(
          child: SingleChildScrollView(

            child: Column(
              children: [
                
                Height(size: 20,),
                MyDivider(),

                Container(
                  height: 50.h,
                  margin: EdgeInsets.only(left: 25.w),
                  child: TabBar(
                      labelColor: maincolor,
                      unselectedLabelColor: black,

                      tabs: [
                        Tab(
                            child: tabtext("Mobile Money Wallet", 12)),
                        Tab(
                            child: tabtext("Twiddle", 12)),

                      ]),
                ),

                MyDivider(),

                Container(
                  height: MediaQuery.of(context).size.height*0.8,
                  margin: EdgeInsets.symmetric(horizontal: 25.w),
                  child: TabBarView(
                      children: [
                        SingleChildScrollView(
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 15.h,),
                              mytext("Cash out to your memo wallet...", 10, silver),
                              SizedBox(height: 20.h,),
                              Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                    mytext("Amount", 12, black),
                                      SizedBox(height: 12.h,),
                                    container(45.h, 155.w, shadowcolor, 10,
                                        Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                                          child: Center(
                                            child: mytext("Enter cash out amount", 10, grey),
                                          ),
                                        )
                                    ),
                                  ],),

                                  SizedBox(width: 7.w,),

                                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                    mytext("Wallet Number", 12, black),
                                    SizedBox(height: 12.h,),
                                    container(45.h, 155.w, shadowcolor, 10,
                                        Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                                          child: Center(
                                            child: mytext("Type memo number here...", 10, grey),
                                          ),
                                        )
                                    ),
                                  ],),
                                ],
                              ),
                              SizedBox(height: 15.h,),
                              mytext("Network", 12, black),
                              SizedBox(height: 12.h,),
                              container(45, 400, shadowcolor, 0,
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 10.w),
                                padding: EdgeInsets.symmetric(horizontal: 15.w),
                                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  mytext("Select Operator", 12, black),
                                  Icon(Icons.keyboard_arrow_down, size: 20.sp,),
                                ],
                              ),)
                              ),
                              SizedBox(height: 65.h,),
                              container(50, 380, maincolor, 30,
                                  Container(
                                    margin: EdgeInsets.symmetric(horizontal: 10.w),
                                    child:
                                    Center(
                                        child: mytextbold("Cash Our Payment", 14, white)),)
                              ),



                            ],
                          )
                        ),
                        SingleChildScrollView(
                            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 15.h,),
                                mytext("Cash out as Top-Up to your Twiddle Account.", 10, silver),
                                SizedBox(height: 20.h,),
                                Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        mytext("Amount", 12, black),
                                        SizedBox(height: 12.h,),
                                        container(45.h, 155.w, shadowcolor, 10,
                                            Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                                              child: Center(
                                                child: mytext("Enter cash out amount", 10, grey),
                                              ),
                                            )
                                        ),
                                      ],),

                                    SizedBox(width: 7.w,),

                                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        mytext("Twiddle Payment ID", 12, black),
                                        SizedBox(height: 12.h,),
                                        container(45.h, 155.w, shadowcolor, 10,
                                            Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                                              child: Center(
                                                child: mytext("Type memo number here...", 10, grey),
                                              ),
                                            )
                                        ),
                                      ],),
                                  ],
                                ),
                                SizedBox(height: 15.h,),
                                mytext("Network", 12, black),

                                SizedBox(height: 65.h,),
                                container(50, 380, maincolor, 30,
                                    Container(
                                      margin: EdgeInsets.symmetric(horizontal: 10.w),
                                      child:
                                      Center(
                                          child: mytextbold("Top Up", 14, white)),)
                                )

                              ],
                            )
                        ),
                      ]
                  ),
                ),



              ],
            ),
          ),
        ),
      ),
    );
  }
}
