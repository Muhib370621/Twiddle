import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_agent/Screens/bottom_navi/home_screen/rentDetail3.dart';
import 'package:state_agent/constants/constants.dart';

import '../../../Utilities/comp_screen.dart';

class RentDetail2 extends StatefulWidget {
  int? rent;
  RentDetail2({Key? key, this.rent}) : super(key: key);

  @override
  State<RentDetail2> createState() => _RentDetail2State();
}

class _RentDetail2State extends State<RentDetail2> {

  var total_payment, mediation_charges, three_months, three_years;
  @override
  void initState() {
    getPayment(widget.rent);
    super.initState();
  }

  getPayment(var rent){
    setState(() {
      mediation_charges = (rent/100)*4;
      total_payment = mediation_charges + rent;
      three_months = rent * 3;
      three_years = 3 * (rent * 12);
    });
  }

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
              SizedBox(height: Get.height * 0.06),
              Row(
                children: [
                  RoundBackButton(),
                  SizedBox(width: 10),
                  Text(
                    'RENT RATE DETAILS AND BREAKDOWN',
                    style: TextStyle(
                      fontFamily: "PoppinsBold",
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              SizedBox(height: Get.height * 0.03),
              Text('Rent Payment Details', style: kBlueHeadingStyle.copyWith(fontSize: 16)),
              smallHeight(),
              priceField('Rent Rate Per Month', 'Ghc ${widget.rent}'),
              bigHeight(),
              priceField('3 Years (36 Months)', "Ghc $three_years"),
              bigHeight(),
              divider(),
              smallHeight(),
              Text('Service Fees/Charges', style: kBlueHeadingStyle.copyWith(fontSize: 16)),
              smallHeight(),
              priceField('Mediation Fee (4%)', 'Ghc $mediation_charges'),
              bigHeight(),
              priceField('3% Interest Per Month', 'Ghc 148.5'),
              bigHeight(),
              priceField('First Three (3) Months Deposit', 'Ghc $three_months'),
              bigHeight(),
              divider(),
              smallHeight(),
              Text('Repayment Details', style: kBlueHeadingStyle.copyWith(fontSize: 16)),
              smallHeight(),
              Row(
                children: [
                  Text(
                    'Instalment Frequency',
                    style: kGreySmallText.copyWith(fontSize: 14),
                  ),
                  Spacer(),
                  Text(
                    'Monthly',
                    style: TextStyle(
                      fontFamily: "PoppinsMedium",
                      fontSize: 14,
                      color: Color(0xFF1492E6),
                    ),
                  ),
                  SizedBox(
                    width: Get.width * 0.022,
                  ),
                  Icon(
                    Icons.info_outline,
                    color: Color(0xFF1492E6),
                    size: 20,
                  )
                ],
              ),
              bigHeight(),
              priceField('Monthly Instalment', 'Ghc 154.5'),
              bigHeight(),
              priceField('No. Of Instalments', '36'),
              bigHeight(),
              divider(),
              smallHeight(),
              Row(
                children: [
                  Text(
                    'Actual Rent',
                    style: kGreySmallText.copyWith(
                      fontSize: 14,
                      color: Color(0xFF2E3034),
                    ),
                  ),
                  Spacer(),
                  Text(
                    'Ghc 4,950',
                    style: TextStyle(
                      fontFamily: "PoppinsMedium",
                      fontSize: 14,
                      color: Color(0xFF2E3034),
                    ),
                  ),
                  SizedBox(
                    width: Get.width * 0.022,
                  ),
                  Icon(
                    Icons.info_outline,
                    color: Color(0xFF1492E6),
                    size: 20,
                  )
                ],
              ),
              bigHeight(),
              Row(
                children: [
                  Text(
                    '36 Months Interest',
                    style: kGreySmallText.copyWith(
                      fontSize: 14,
                      color: Color(0xFF2E3034),
                    ),
                  ),
                  Spacer(),
                  Text(
                    'Ghc 5,346',
                    style: TextStyle(
                      fontFamily: "PoppinsMedium",
                      fontSize: 14,
                      color: Color(0xFF2E3034),
                    ),
                  ),
                  SizedBox(
                    width: Get.width * 0.022,
                  ),
                  Icon(
                    Icons.info_outline,
                    color: Color(0xFF1492E6),
                    size: 20,
                  )
                ],
              ),
              bigHeight(),
              Row(
                children: [
                  Text(
                    'Total Rent Payment',
                    style: kGreySmallText.copyWith(
                        fontSize: 14, color: Color(0xFF0336FF)),
                  ),
                  Spacer(),
                  Text(
                    'Ghc 10,296',
                    style: TextStyle(
                      fontFamily: "PoppinsMedium",
                      fontSize: 14,
                      color: Color(0xFF1492E6),
                    ),
                  ),
                  SizedBox(
                    width: Get.width * 0.022,
                  ),
                  Icon(
                    Icons.info_outline,
                    color: Color(0xFF1492E6),
                    size: 20,
                  )
                ],
              ),
              SizedBox(
                height: Get.height * 0.05,
              ),
              CustomBlueButton(
                height: Get.height * 0.08,
                width: Get.width,
                text: "Continue",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return RentDetail3();
                    }),
                  );
                },
                fontSize: 14,
              ),
              SizedBox(
                height: Get.height * 0.06,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget priceField(
    String text,
    String price,
  ) {
    return Row(
      children: [
        Text(
          text,
          style: kGreySmallText.copyWith(fontSize: 14),
        ),
        Spacer(),
        Text(
          price,
          style: TextStyle(
            fontFamily: "PoppinsMedium",
            fontSize: 14,
            color: Color(0xFF2E3034),
          ),
        ),
        SizedBox(
          width: Get.width * 0.022,
        ),
        Icon(
          Icons.info_outline,
          color: Color(0xFF1492E6),
          size: 20,
        ),
      ],
    );
  }
}

Widget divider() {
  return Container(
    height: 0.2,
    width: Get.width,
    color: Color(0xFF707070),
  );
}

Widget bigHeight() {
  return SizedBox(
    height: Get.height * 0.02,
  );
}

Widget smallHeight() {
  return SizedBox(
    height: Get.height * 0.014,
  );
}
