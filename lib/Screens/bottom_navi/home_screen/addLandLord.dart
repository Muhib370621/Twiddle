import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:state_agent/constants/constants.dart';

import '../../../Utilities/comp_screen.dart';
import '../../../constants/dropdowns.dart';



class AddLandLord extends StatefulWidget {
  const AddLandLord({Key? key}) : super(key: key);

  @override
  State<AddLandLord> createState() => _AddLandLordState();
}

class _AddLandLordState extends State<AddLandLord> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: Get.height * 0.06,
              ),
              Row(
                children: [
                  RoundBackButton(),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'PAYMENT OF INITIAL RENT',
                    style: TextStyle(
                      fontFamily: "PoppinsBold",
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: Get.height * 0.022,
              ),
              labeledTextField('LANDLORD FULL NAME', 'Margaret Novakowska'),
              SizedBox(
                height: Get.height * 0.022,
              ),
              labeledTextField('MOBILE', '+233 30 366 9257'),
              SizedBox(
                height: Get.height * 0.022,
              ),
              labeledTextField('PHONE 2', '+233 30 366 9257'),
              SizedBox(
                height: Get.height * 0.022,
              ),
              Text(
                'BANK DETAILS OF LANDLORD',
                style: TextStyle(
                  color: Color(0xFF0336FF),
                  fontFamily: "PoppinsSemiBold",
                  fontSize: 12,
                ),
              ),
              SizedBox(
                height: Get.height * 0.012,
              ),
              labeledTextField('NAME OF BANK', 'Access Bank'),
              SizedBox(
                height: Get.height * 0.022,
              ),
              labeledTextField('BANK BRANCH', 'Accra Central'),
              SizedBox(
                height: Get.height * 0.022,
              ),
              labeledTextField('ACCOUNT NUMBER', '0402351118982'),
              SizedBox(
                height: Get.height * 0.022,
              ),
              labeledTextField('MOBILE MONEY NO.', '0275698712'),
              SizedBox(
                height: Get.height * 0.022,
              ),
              Text(
                'SELECT OPERATOR',
                style: kLabelTextStyle,
              ),
              SizedBox(
                height: Get.height * 0.012,
              ),
              Container(
                height: Get.height * 0.06,
                width: Get.width,
                padding: const EdgeInsets.only(left: 0, bottom: 3),
                decoration: BoxDecoration(
                  border: Border.all(color: grey, width: 1),

                  shape: BoxShape.rectangle,
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                  // boxShadow:
                ),
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
              SizedBox(
                height: Get.height * 0.03,
              ),
              CustomBlueButton(
                height: Get.height * 0.075,
                width: Get.width,
                text: 'Make Payment',
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          30,
                        ),
                      ),
                      title: Container(
                        padding: EdgeInsets.only(top: Get.height * 0.04),
                        child: SvgPicture.asset('assets/check.svg'),
                      ),
                      elevation: 20,
                      content: Padding(
                        padding: EdgeInsets.only(
                          top: 10,
                          left: Get.width * 0.155,
                        ),
                        child: Text(
                          'Landlord Added \n    Successfully',
                          style: kLargeTextStyle.copyWith(
                              fontFamily: "PoppinsSemiBold", fontSize: 15),
                        ),
                      ),
                      actions: [
                        SizedBox(
                          height: Get.height * 0.02,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, bottom: 20),
                          child: CustomBlueButton(
                            height: Get.height * 0.055,
                            width: Get.width * 0.6,
                            text: 'Done',
                            onPressed: () {
                              return Navigator.pop(context);
                            },
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.02,
                        ),
                      ],
                    ),
                  );
                },
                fontSize: 14,
              ),
              SizedBox(
                height: Get.height * 0.03,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget labeledTextField(
  String text,
  String hintText,
) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        text,
        style: kLabelTextStyle,
      ),
      SizedBox(
        height: Get.height * 0.012,
      ),
      Center(
        child: Container(
          height: Get.height * 0.06,
          width: Get.width,
          padding: const EdgeInsets.only(left: 22, bottom: 3),
          decoration: BoxDecoration(
            border: Border.all(color: grey, width: 1),

            shape: BoxShape.rectangle,
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
            // boxShadow:
          ),
          child: TextField(
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontFamily: "PoppinsMedium",
              fontSize: 12,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: TextStyle(
                color: Color(0xFF2E3034),
                fontFamily: "PoppinsMedium",
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
          ),
        ),
      )
    ],
  );
}

Future dialogBox(context) {
  return Future.delayed(
    const Duration(seconds: 0),
    () => showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            30,
          ),
        ),
        title: Container(
            padding: EdgeInsets.only(top: 45),
            child: SvgPicture.asset('assets/check.svg')),
        elevation: 20,
        insetPadding: EdgeInsets.all(0),
        content: Padding(
          padding: EdgeInsets.only(top: 10, left: Get.width * 0.11),
          child: Text(
            'Confirm Interest in Property?',
            style: kLargeTextStyle.copyWith(
                fontFamily: "PoppinsSemiBold", fontSize: 15),
          ),
        ),
        actions: [
          SizedBox(
            width: Get.width * 0.03,
          ),
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              margin: EdgeInsets.only(top: 40, bottom: 20),
              width: 135,
              height: 45,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.elliptical(45, 40),
                ),
                border: Border.all(color: maincolor, width: 2),
              ),
              child: Center(
                child: Text(
                  'Cancel',
                  style: TextStyle(
                    color: maincolor,
                    fontSize: 14,
                    fontFamily: "PoppinsSemiBold",
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: Get.width * 0.015,
          ),
          InkWell(
            child: Container(
              margin: EdgeInsets.only(top: 40, bottom: 20),
              width: 135,
              height: 45,
              decoration: BoxDecoration(
                color: maincolor,
                borderRadius: BorderRadius.all(
                  Radius.elliptical(45, 40),
                ),
              ),
              child: Center(
                child: Text(
                  'Yes',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: "PoppinsSemiBold",
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: Get.width * 0.03,
          )
        ],
      ),
    ),
  );
}
