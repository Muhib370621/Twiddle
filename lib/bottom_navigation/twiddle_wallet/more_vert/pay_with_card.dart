import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../constants/constants.dart';
import 'confirm_payment.dart';

class PayCard extends StatelessWidget {
  PayCard({Key? key}) : super(key: key);

  final cardNo = TextEditingController();
  final name = TextEditingController();
  final expireDate = TextEditingController();
  final cvv = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
          backgroundColor: transparent,
          automaticallyImplyLeading: false,
          elevation: 0,
          title: BackButtonText(text: 'TOP-UP TWIDDLE WALLET')
      ),
      body: SafeArea(
          child: Container(
            width: Get.width, height: Get.height,
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Height(size: 30),
                
                PoppinsText(text: 'Card Details', size: 18, fontWeight: FontWeight.w400),

                Height(size: 15),
                PoppinsText(text: 'Card Number', size: 14),

                Height(),
                MyTextField(
                  hint: '0000 0000 0000 0000',
                  color: shadowcolor,
                  controller: cardNo,
                  mySuffixIcon: MyContainer(
                    width: 30,
                    child: Image.asset('assets/tw/card.png'),
                  ),
                  keyboardType: TextInputType.number,
                ),

                Height(size: 15),
                PoppinsText(text: 'Card holder Name', size: 14),

                Height(),
                MyTextField(
                  hint: 'Jon Doe',
                  controller: name,
                  color: shadowcolor,
                ),

                Row(
                  children: [

                    Expanded(
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Height(size: 15),
                          PoppinsText(text: 'Expire Date', size: 14),

                          Height(),
                          MyTextField(
                            hint: '00/00',
                            controller: expireDate,
                            color: shadowcolor,
                          ),
                        ],
                      ),
                    ),

                    Width(size: 10),
                    Expanded(
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Height(size: 15),
                          PoppinsText(text: 'CVV', size: 14),

                          Height(),
                          MyTextField(
                            hint: '000',
                            controller: cvv,
                            color: shadowcolor,
                            keyboardType: TextInputType.number,
                          ),
                        ],
                      ),
                    )

                  ],
                ),
                
                Expanded(child: Container()),
                
                Button(
                  onTap: (){
                    if(cardNo.text.isNotEmpty && name.text.isNotEmpty &&
                        expireDate.text.isNotEmpty && cvv.text.isNotEmpty)
                    {
                      Get.to(()=> ConfirmPayment());
                    }
                    else{
                      //Get.to(()=> ConfirmPayment());
                      Fluttertoast.showToast(msg: 'Enter all fields');
                    }
                  },
                  text: 'Continue'
                ),
                Height(size: 20)


              ],
            ),
          )
      ),
    );
  }
}
