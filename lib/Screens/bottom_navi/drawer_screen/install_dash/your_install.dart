import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_agent/constants/constants.dart';

import '../../../../Utilities/comp_screen.dart';
import 'pay_install.dart';

class RenterInstall extends StatefulWidget {
  const RenterInstall({Key? key}) : super(key: key);

  @override
  State<RenterInstall> createState() => _RenterInstallState();
}

class _RenterInstallState extends State<RenterInstall> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCFDFF),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: Get.width * 0.05, right: Get.width * 0.05),
            color: maincolor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: Get.height * 0.06),
                Row(
                  children: [
                    WhiteBackButton(),
                    SizedBox(width: Get.width * 0.04),
                    Text(
                      "Renter's Instalment Dashboard",
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
                  alignment: FractionalOffset.topRight,
                  child:  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total Rent Due:',
                        style: TextStyle(
                          fontFamily: "PoppinsMedium",
                          fontSize: 12,
                          color: Colors.white,
                        ),
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

              ],
            ),
          ),
          SizedBox(height: Get.height * 0.03),
          Center(
            child: CustomBlueButton(
              height: Get.height * 0.07,
              width: Get.width * 0.9,
              text: 'Pay your Instalment' ,
              onPressed: () {
                Get.to(()=>PayInstallment());
              },
              fontSize: 14,
            ),
          ),
          SizedBox(height: Get.height * 0.04),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              'Recent Transactions',
              style: TextStyle(
                fontFamily: "PoppinsMedium",
                fontSize: 17,
                color: Color(0xFF696A6D),
              ),
            ),
          ),
          SizedBox(height: Get.height * 0.015),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(left: Get.width * 0.05, right: Get.width * 0.05),
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    reusableCard2(
                      image: Image.asset(
                        'assets/ellipse.png',
                        scale: 2,
                      ),
                      title: "Pipe Bank LLC",
                      type: "Your Funder",
                      id: "GHA193445C",
                      date: "July 25, 2022",
                      time: "12:15pm",
                      amount: "GHC150",
                      method: "Instalment",
                    ),
                    reusableCard2(
                      image: Image.asset(
                        'assets/ellipse.png',
                        scale: 2,
                      ),
                      title: "Pipe Bank LLC",
                      type: "Your Funder",
                      id: "GHA193445C",
                      date: "July 25, 2022",
                      time: "12:15pm",
                      amount: "GHC150",
                      method: "Instalment",
                    ),
                    reusableCard2(
                      image: Image.asset(
                        'assets/ellipse.png',
                        scale: 2,
                      ),
                      title: "Pipe Bank LLC",
                      type: "Your Funder",
                      id: "GHA193445C",
                      date: "July 25, 2022",
                      time: "12:15pm",
                      amount: "GHC150",
                      method: "Instalment",
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
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
                              fontSize: 11,
                              fontFamily: "PoppinsMedium",
                            ),
                          ),
                          SizedBox(
                            width: Get.width * 0.015,
                          ),
                          Text(
                            "($type)",
                            style: kSmallTextStyle.copyWith(
                              fontSize: 11,
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
                  fontSize: 10,
                  fontFamily: "PoppinsMedium",
                ),
              ),
            ],
          ),
          Spacer(),
          Column(crossAxisAlignment: CrossAxisAlignment.end,
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
                  color: maincolor,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Center(
                  child: Text(
                    amount,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "PoppinsMedium",
                      fontSize: 9,
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
                  fontSize: 10,
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

const kSmallTextStyle = TextStyle(
  color: Color(0xFF9C9C9C),
  fontSize: 9,
  fontFamily: "PoppinsMedium",
);
