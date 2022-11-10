import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_agent/constants/constants.dart';

import '../../../../Utilities/comp_screen.dart';
import '../../home_screen/rentDetail3.dart';
import '../../service_screen/paymentSuccess.dart';



class PayInstallment extends StatefulWidget {
  const PayInstallment({Key? key}) : super(key: key);

  @override
  State<PayInstallment> createState() => _PayInstallmentState();
}

class _PayInstallmentState extends State<PayInstallment> {
  int _value = 0;
  String _selectedGender = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: Get.height * 0.06),
            Row(
              children: [
                RoundBackButton(),
                SizedBox(width: 10),
                Text(
                  'PAY YOUR INSTALMENT',
                  style: TextStyle(
                    fontFamily: "PoppinsBold",
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            SizedBox(height: Get.height * 0.03),
            Text('Monthly Instakment', style: kBlueHeadingStyle.copyWith(fontSize: 16)),
            SizedBox(height: Get.height * 0.014),
            priceField('Full Payment', 'Ghc 154.5'),
            SizedBox(height: Get.height * 0.02),
            SizedBox(height: Get.height * 0.014),
            Row(
              children: [
                Text(
                  'Total',
                  style: kGreySmallText.copyWith(
                    fontSize: 14,
                    color: maincolor,
                    fontFamily: "PoppinsSemiBold",
                  ),
                ),
                Spacer(),
                Text(
                  'Ghc 154.5',
                  style: TextStyle(
                    fontSize: 14,
                    color: maincolor,
                    fontFamily: "PoppinsSemiBold",
                  ),
                ),
              ],
            ),
            SizedBox(height: Get.height * 0.02),
            Divider(color: Color(0xFFC9C9C9),thickness: 1),
            SizedBox(height: Get.height * 0.02),
            Text('How Much Are You Paying?', style: kBlueHeadingStyle.copyWith(fontSize: 16)),
            SizedBox(height: Get.height * 0.014),
            Row(
              children: [
                Radio<String>(
                  value: '',
                  groupValue: _selectedGender,
                  onChanged: (value) {
                    setState(() {
                      _selectedGender = value!;
                    });
                  },

                ),
                Text(
                  'Full Payment',
                  style: TextStyle(
                    color: Color(
                      0xFF2E3034,
                    ),
                    fontFamily: "PoppinsMedium",
                    fontSize: 14,
                  ),
                ),
                Spacer(),
                Text(
                  'Ghc 154.5',
                  style: TextStyle(
                    color: Color(
                      0xFF2E3034,
                    ),
                    fontFamily: "PoppinsMedium",
                    fontSize: 14,
                  ),
                )
              ],
            ),
            Row(
              children: [
                Radio(
                  value: 2,
                  groupValue: _value,
                  onChanged: (value) {},
                ),
                Text(
                  'Half Payment',
                  style: TextStyle(
                    color: Color(
                      0xFF2E3034,
                    ),
                    fontFamily: "PoppinsMedium",
                    fontSize: 14,
                  ),
                ),
                Spacer(),
                Text(
                  'Ghc 77.25',
                  style: TextStyle(
                    color: Color(
                      0xFF2E3034,
                    ),
                    fontFamily: "PoppinsMedium",
                    fontSize: 14,
                  ),
                )
              ],
            ),
            Row(
              children: [
                Radio(
                  value: 3,
                  groupValue: _value,
                  onChanged: (value) {},
                ),
                Text(
                  'Custom',
                  style: TextStyle(
                    color: Color(
                      0xFF2E3034,
                    ),
                    fontFamily: "PoppinsMedium",
                    fontSize: 14,
                  ),
                ),
                Spacer(),
                Container(
                  width: Get.width * 0.32,
                  height: Get.height * 0.044,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: maincolor,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: Get.width * 0.025,
                      ),
                      Text(
                        'Ghc |',
                        style: kGreySmallText.copyWith(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: Get.height * 0.03),

            Text("Note: Kindly make full instalment payments to avoid\n penalties and eviction from the property.",style: TextStyle(color: Color(0xff9C9C9C))),
            Spacer(),
            CustomBlueButton(
              height: Get.height * 0.08,
              width: Get.width,
              text: "Proceed To Payment",
              onPressed: () {
                Get.to(()=>PaymentSuccess());
              },
              fontSize: 14,
            ),
            SizedBox(height: Get.height * 0.03),









          ],
        ),
      ),
    );
  }
}
