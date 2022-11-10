import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_agent/constants/constants.dart';

import '../../../Utilities/comp_screen.dart';
import '../../../constants/dropdowns.dart';
import 'rentDetail2.dart';

class RentDetail extends StatefulWidget {
  int? price;
  RentDetail({Key? key, this.price}) : super(key: key);

  @override
  State<RentDetail> createState() => _RentDetailState();
}

class _RentDetailState extends State<RentDetail> {
  bool _three = false;
  bool _six = false;


  Widget _buildSwitchListTile(String title, bool currentValue, updateValue) {
    return Container(
      height: Get.height * 0.075,
      width: Get.width,
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
                blurRadius: 0.5,
                color: Colors.grey,
                offset: Offset(0, 0),
                spreadRadius: 0.2)
          ]
      ),
      child: Padding(
        padding: EdgeInsets.only(left: Get.width * 0.06),
        child:Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold)),

            Transform.scale(
              scale: 0.7,
              child: Padding(
                padding: const EdgeInsets.only(right: 13),
                child: CupertinoSwitch(
                    value: currentValue,
                    onChanged: updateValue,
                    thumbColor: Colors.white,
                    activeColor: maincolor,
                    trackColor: Color(0xFFC2C2C2)),
              ),

              // )
            ),
          ],
        )
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            Row(
              children: [
                RoundBackButton(),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'RENT DETAILS COLLECTION',
                  style: TextStyle(
                    fontFamily: "PoppinsBold",
                    fontSize: 17,
                  ),
                ),
              ],
            ),

            Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5,right: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        SizedBox(height: Get.height * 0.03),
                        Text('Make Advance Payments', style: kBlueHeadingStyle),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          'Switch to indicate your preference',
                          style: kGreySmallText,
                        ),
                        SizedBox(height: Get.height * 0.01),
                        _buildSwitchListTile("First Three (3) Months", _three, (newValue) {
                          setState(
                                () {
                              _three = newValue;
                            },
                          );
                        }),
                        SizedBox(
                          height: Get.height * 0.015,
                        ),
                        _buildSwitchListTile("First Six (6) Months", _six, (newValue) {
                          setState(
                                () {
                              _six = newValue;
                            },
                          );
                        }),
                        SizedBox(height: Get.height * 0.018),
                        Text('Period Occupancy', style: kBlueHeadingStyle),
                        Text('Tap to select how long you would want to stay in this property.', style: kGreySmallText,),
                        SizedBox(height: Get.height * 0.01),
                        Container(
                          height: Get.height * 0.075,
                          width: Get.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 0.5,
                                  color: Colors.grey,
                                  offset: Offset(0, 0),
                                  spreadRadius: 0.2)
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5,right: 10),
                            child: SimpleDropDown(
                              list: [
                                "Cleaner",
                                "Painter",
                                "Mechanic",
                                "Gardener",
                              ],
                              text: "Commercial",
                              icon: Icon(Icons.arrow_drop_down, size: 25, color: Color(0xFF9C9C9C)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.018,
                        ),
                        Text(
                          'Instalment Frequency',
                          style: kBlueHeadingStyle,
                        ),
                        Text(
                          'Select your repayment schedule',
                          style: kGreySmallText,
                        ),
                        SizedBox(
                          height: Get.height * 0.01,
                        ),
                        Container(
                          height: Get.height * 0.075,
                          width: Get.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 0.5,
                                  color: Colors.grey,
                                  offset: Offset(0, 0),
                                  spreadRadius: 0.2)
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5,right: 10),
                            child: SimpleDropDown(
                              list: [
                                "Cleaner",
                                "Painter",
                                "Mechanic",
                                "Gardener",
                              ],
                              text: "Commercial",
                              icon: Icon(Icons.arrow_drop_down, size: 25, color: Color(0xFF9C9C9C)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.018,
                        ),
                        Text(
                          'Funder',
                          style: kBlueHeadingStyle,
                        ),
                        Text(
                          'Select your preferred funder',
                          style: kGreySmallText,
                        ),
                        SizedBox(
                          height: Get.height * 0.01,
                        ),
                        Container(
                          height: Get.height * 0.075,
                          width: Get.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 0.5,
                                  color: Colors.grey,
                                  offset: Offset(0, 0),
                                  spreadRadius: 0.2)
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5,right: 10),
                            child: SimpleDropDown(
                              list: [
                                "Cleaner",
                                "Painter",
                                "Mechanic",
                                "Gardener",
                              ],
                              text: "Commercial",
                              icon: Icon(Icons.arrow_drop_down, size: 25, color: Color(0xFF9C9C9C)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.1,
                        ),
                        CustomBlueButton(
                          height: Get.height * 0.08,
                          width: Get.width,
                          text: "Continue",
                          fontSize: 14,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return RentDetail2(
                                  rent: widget.price,
                                );
                              }),
                            );
                          },

                        ),
                        SizedBox(
                          height: Get.height * 0.015,
                        ),



                      ],
                    ),
                  ),
                ))






          ],
        ),
      ),
    );
  }
}
