import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:state_agent/constants/constants.dart';

import '../../../../Utilities/comp_screen.dart';
import '../../bottom_navi/twiddle_wallet/dash_twiddleWall.dart';
import '../../bottom_navi/twiddle_wallet/topUp_invest.dart';


class DemoDashboardInvest extends StatefulWidget {
  const DemoDashboardInvest({Key? key}) : super(key: key);

  @override
  State<DemoDashboardInvest> createState() => _DemoDashboardInvestState();
}

class _DemoDashboardInvestState extends State<DemoDashboardInvest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCFDFF),
      body: Container(
        height: Get.height, width: Get.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 500.h,//Get.height*0.61,
              padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
              color: maincolor,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: Get.height * 0.06),
                    Row(
                      children: [
                        WhiteBackButton(),
                        SizedBox(width: Get.width * 0.04),
                        Text(
                          "Investment Dashboard",
                          style: TextStyle(
                            fontFamily: "PoppinsMedium",
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: Get.height * 0.03,),

                    Align(
                      alignment: FractionalOffset.topCenter,
                      child:  Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'No. Of Projects',
                                style: TextStyle(
                                  fontFamily: "PoppinsMedium",
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: Get.height * 0.01),
                              Text(
                                'Net Profit',
                                style: TextStyle(
                                  fontFamily: "PoppinsMedium",
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                            ],),

                          Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'See Projects',
                                    style: TextStyle(
                                      fontFamily: "PoppinsMedium",
                                      fontSize: 12,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    ' 02',
                                    style: TextStyle(
                                      fontFamily: "PoppinsSemiBold",
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: Get.height * 0.01),
                              Text(
                                'GHC 5,350',
                                style: TextStyle(
                                  fontFamily: "PoppinsSemiBold",
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ],)

                        ],
                      ),
                    ),

                    SizedBox(height: Get.height * 0.028),
                    Container(
                      height: Get.height * 0.12,
                      width: Get.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Rent Paid',
                                  style: TextStyle(
                                    color: Color(0xFF696A6D),
                                    fontFamily: "PoppinsMedium",
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  'GHC 2,350',
                                  style: TextStyle(
                                    color: maincolor,
                                    fontFamily: "PoppinsMedium",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),

                              ],
                            ),
                            SizedBox(width: 40),
                            Container(width: 1, height: Get.height * 0.052, color: Colors.black),
                            SizedBox(width: 40),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Rent Remaining',
                                  style: TextStyle(
                                    color: Color(0xFF696A6D),
                                    fontFamily: "PoppinsMedium",
                                    fontSize: 13,
                                  ),
                                ),
                                Text(
                                  '-GHC 3,000',
                                  style: TextStyle(
                                    color: maincolor,
                                    fontFamily: "PoppinsMedium",
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),

                              ],
                            ),

                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: Get.height * 0.058),

                    Center(
                      child: Container(
                        width: Get.width*0.7,
                        height: Get.height*0.3,
                        color: Color(0xFFEBEFFF),

                        child: Column(
                            children: [
                              SizedBox(height: 5),
                              Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Row(children: [
                                    Text("Instalments",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: "Poppins, Light"
                                      ),),
                                    Text("Return on Investment",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: "Poppins, Light"
                                        )
                                    ),
                                  ]),

                                  Container(
                                    height: 30, width: 30,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(7)
                                    ),
                                    child: Center(
                                      child: Icon(Icons.more_vert),
                                    ),
                                  )
                                ],
                              ),
                            ]
                        ),
                      ),
                    )

                  ],
                ),
              ),
            ),

            SizedBox(height: Get.height * 0.04),
            Container(
              width: Get.width,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Padding(
                    padding: EdgeInsets.only(left: Get.width * 0.05, right: Get.width * 0.05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Payment(onTap: (){},title: "Withdraw\n Money",titleImage: "assets/walletic.svg"),
                        Container(
                          width: Get.width*0.28,
                          height: Get.height*0.15,
                          decoration: BoxDecoration(
                              color: Color(0xff0336FF),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [BoxShadow(
                                color: Color(0xffF2F6FE).withOpacity(1),
                                spreadRadius: 10,
                                blurRadius: 10,
                                offset: Offset(0, 2),
                              )]),

                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Send\n Money",textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 15)),
                              SizedBox(height: 10),
                              SvgPicture.asset("assets/send.svg",width: 40,height: 40)

                            ],
                          ),
                        ),
                        Payment(onTap: (){Get.to(()=>TopUpInvest());},title: "Top-Up\n Balance",titleImage: "assets/top.svg"),




                      ],
                    ),
                  ),



                ],
              ),
            ),
            SizedBox(height: 25),
            Container(
                padding: EdgeInsets.only(left: Get.width * 0.05, right: Get.width * 0.05),
                child: Text("Recent Transactions",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Poppins, Regular'
                    ))),
            SizedBox(height: Get.height * 0.015),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(left: Get.width * 0.05, right: Get.width * 0.05),
                  child: reusableCard2(
                    image: SizedBox(
                      height: 40.h, width: 40.h,
                      child: CircleAvatar(
                        backgroundImage: AssetImage("assets/background.png"),
                      ),
                    ),
                    title: "Mall Of Africa Project",
                    type: "TWD321321",
                    id: "GHA193445C",
                    date: "July 25, 2022",
                    time: "12:15pm",
                    amount: "GHC150",
                    method: "Instalment",
                  ),


                  /*Column(


                    children: [

                      Wrap(
                        children: List.generate(3, (index) =>
                            Column(children: [
                              reusableCard2(
                                image: CircleAvatar(
                                  backgroundImage: AssetImage("assets/background.png"),
                                ),
                                title: "Mall Of Africa Project",
                                type: "TWD321321",
                                id: "GHA193445C",
                                date: "July 25, 2022",
                                time: "12:15pm",
                                amount: "GHC150",
                                method: "Instalment",
                              ),
                              SizedBox(height: 10.h)
                            ],),
                        ),
                      ),
                      SizedBox(height: 20.h),
                    ],
                  ),*/
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget reusableCard2({
  Widget image = const Text('image not found'),
  String title = 'title',
  String type = 'type',
  String id = 'id',
  String date = 'date',
  String time = 'time',
  String amount = 'amount',
  String method = 'method',
}) {
  return Padding(
    padding: EdgeInsets.only(
      bottom: Get.height * 0.03,
    ),
    child: Container(
      height: Get.height * 0.14,
      width: Get.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Color(0xFFEBEFFF),
              spreadRadius: 10,
              offset: Offset(4, 10),
              blurRadius: 10),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: Get.width * 0.04,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: Get.height * 0.02,
              ),
              Row(
                children: [
                  image,
                  SizedBox(
                    width: Get.width * 0.03,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                              fontSize: 10.sp,
                              fontFamily: "PoppinsMedium",
                            ),
                          ),
                          SizedBox(
                            width: Get.width * 0.015,
                          ),
                          Text(
                            "($type)",
                            style: kSmallTextStyle.copyWith(
                              fontSize: 10.sp,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: Get.height * 0.007,
                      ),
                      Text(
                        'Payment ID: $id',
                        style: kSmallTextStyle,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: Get.height * 0.015,
              ),
              Text(
                "Date: $date    Time: $time",
                style: TextStyle(
                  color: Color(
                    0xFF2E3034,
                  ),
                  fontSize: 10.sp,
                  fontFamily: "PoppinsMedium",
                ),
              ),
            ],
          ),
          Spacer(),
          Column(
            children: [
              SizedBox(
                height: Get.height * 0.02,
              ),
              Text(
                'Amount Paid',
                style: kSmallTextStyle,
              ),
              SizedBox(
                height: Get.height * 0.0025,
              ),
              Container(
                height: Get.height * 0.022,
                width: Get.width * 0.125,
                decoration: BoxDecoration(
                  color: Color(0xffFF6060),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Center(
                  child: Text(
                    amount,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "PoppinsMedium",
                      fontSize: 9.sp,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: Get.height * 0.0025,
              ),
              Text(
                method,
                style: kSmallTextStyle,
              ),
              SizedBox(
                height: Get.height * 0.005,
              ),
              Text(
                'View Details',
                style: TextStyle(
                  fontFamily: "PoppinsMedium",
                  fontSize: 9.sp,
                  decoration: TextDecoration.underline,
                  color: Color(0xFF1492E6),
                ),
              ),
            ],
          ),
          SizedBox(
            width: Get.width * 0.04,
          ),
        ],
      ),
    ),
  );
}

TextStyle kSmallTextStyle = GoogleFonts.poppins(
  color: Color(0xFF9C9C9C),
  fontSize: 9.sp,
);


