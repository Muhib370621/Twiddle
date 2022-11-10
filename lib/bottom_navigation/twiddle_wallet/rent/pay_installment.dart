import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:state_agent/bottom_navigation/twiddle_wallet/more_vert/pay_with.dart';

import '../../../constants/constants.dart';

enum PaymentType{
  full, half, custom
}

class PayInstallment extends StatefulWidget {
  PayInstallment({Key? key}) : super(key: key);

  @override
  State<PayInstallment> createState() => _PayInstallmentState();
}

class _PayInstallmentState extends State<PayInstallment> {
  final paymentController = TextEditingController();

  PaymentType type = PaymentType.full;
  String payment = 'Full Payment';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: BackButtonText(
            text: 'PAY YOUR INSTALMENT'
        ),
      ),
      backgroundColor: white,
      body: SafeArea(

          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Height(size: 20,),
                PoppinsText(text: 'Monthly Instalment', color: maincolor, size: 16,),

                Height(),
                TextIcon(text1: 'Full Payment', text2: 'Ghc '),

                Height(size: 20,),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PoppinsText(text: 'Total', color: maincolor, size: 14, fontWeight: FontWeight.w500),
                    PoppinsText(text: 'Ghc ', color: maincolor, size: 14, fontWeight: FontWeight.w500),
                  ],
                ),

                Height(size: 20,),
                MyDivider(),

                Height(size: 20,),
                PoppinsText(text: 'How Much Are You Paying?', color: maincolor, size: 16,),

                Height(),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Row(
                        children: [

                          Radio(
                              activeColor: maincolor,
                              value: PaymentType.full,
                              groupValue: type,
                              onChanged: (PaymentType? val){
                                setState((){
                                  type = val!;
                                  payment = 'Full Payment';
                                });
                              }
                          ),

                          PoppinsText(text: 'Full Payment', size: 14, fontWeight: FontWeight.w500,)

                        ]
                    ),
                    PoppinsText(text: 'Ghc ', size: 14, fontWeight: FontWeight.w500)
                  ],
                ),

                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                        children: [

                          Radio(
                              activeColor: maincolor,
                              value: PaymentType.half,
                              groupValue: type,
                              onChanged: (PaymentType? val){
                                setState((){
                                  type = val!;
                                  payment = 'Half Payment';
                                });
                              }
                          ),

                          PoppinsText(text: 'Half Payment', size: 14, fontWeight: FontWeight.w500,)

                        ]
                    ),
                    PoppinsText(text: 'Ghc ', size: 14, fontWeight: FontWeight.w500)
                  ],
                ),

                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                        children: [

                          Radio(
                              activeColor: maincolor,
                              value: PaymentType.custom,
                              groupValue: type,
                              onChanged: (PaymentType? val){
                                setState((){
                                  type = val!;
                                  payment = 'Custom Payment';
                                });
                              }
                          ),

                          PoppinsText(text: 'Custom Payment', size: 14, fontWeight: FontWeight.w500,)

                        ]
                    ),
                    MyTextField(
                      radius: 10,
                      width: 140, height: 40,
                      borderColor: maincolor.withOpacity(0.4),
                      controller: paymentController,
                      icon: PoppinsText(text: 'Ghc |',),
                      hint: '',
                    )
                  ],
                ),

                Height(size: 30),
                PoppinsText(text: 'Note: Kindly make full instalment payments to avoid penalties and eviction from the property.', color: hinttext, fontWeight: FontWeight.w500),

                Expanded(child: Container()),

                Button(
                  onTap: ()=> Get.to(()=> PayWith()),
                  text: 'Proceed To Payment'
                ),
                Height(size: 20,)


              ],
            ),
          )
      ),
    );
  }
}
