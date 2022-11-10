import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/constants.dart';
import '../../bottom_navigation.dart';

class ConfirmPayment extends StatefulWidget {
  ConfirmPayment({Key? key}) : super(key: key);

  @override
  State<ConfirmPayment> createState() => _ConfirmPaymentState();
}

class _ConfirmPaymentState extends State<ConfirmPayment> {
  final amount = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var price;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: transparent,
          automaticallyImplyLeading: false,
          elevation: 0,
          title: BackButtonText(text: 'TOP-UP TWIDDLE WALLET')
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Height(size: 40),
              MyTextField(


                height: 70,
                color: shadowcolor,
                icon: MyContainer(
                  width: 60,
                  child: Row(
                    children: [
                      PoppinsText(
                        text: 'GHC',
                        size: 14,
                        fontWeight: FontWeight.bold,
                      ),
                      Width(size: 10,),
                      Container(
                        color: maincolor,
                        height: 40,
                        width: 1,
                      )

                    ],
                  ),
                ),
                hint: '5000',
                size: 30,
                controller: amount,
                fontWeight: FontWeight.bold,
                keyboardType: TextInputType.number,

              ),

              Height(),
              PoppinsText(text: 'Min. 3000GHC', color: redtext,),

              Expanded(child: Container()),

              Row(
                children: [

                  Expanded(
                      child: Button(
                        onTap: (){

                          Get.back();
                          //Get.offAll(()=> TopUpWallet());
                        },
                        color: maincolor,
                          buttonColor: shadowcolor,
                          text: 'Cancel'
                      )
                  ),

                  Width(size: 15),
                  Expanded(
                      child: Continue(
                        amount: amount.text,
                      )
                  ),

                ],
              ),

              Height(size: 20)

            ],
          ),
        ),
      ),
    );
  }
}

class Continue extends StatelessWidget {
  final amount;
  Continue({Key? key, this.amount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Button(
      onTap: (){

        showDialog(
            context: context,
            builder: (context) => Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.r),
              ),

              child: MyContainer(
                // padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                horizontalPadding: 20, verticalPadding: 20,
                child: ListView(
                  shrinkWrap: true,
                  children: [

                    Height(size: 25),
                    Container(
                      height: 100,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/tw/topup.png')
                          )
                      ),
                    ),

                    Height(size: 25),

                    Center(
                      child: Text(
                        'Hurrah!',
                        style: GoogleFonts.montserrat(
                            fontSize: 14.sp,
                            color: bluetext,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                    Height(size: 8),

                    Center(
                      child: amount != null? Text(
                        '${amount}GHC Added In Your Twiddle Wallet',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                            fontSize: 16.sp,
                            color: active,
                            fontWeight: FontWeight.bold
                        ),
                      ) : Text(
                        'GHC Added In Your Twiddle Wallet',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                            fontSize: 16.sp,
                            color: active,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),

                    Height(size: 25),

                    Button(
                        onTap: ()=> Get.offAll(()=> BottomNav()),
                        text: 'Done'
                    ),
                    Height()

                  ],),
              ),

            ));

        // if(amount > 2999){
        //   showDialog(
        //       context: context,
        //       builder: (context) => Dialog(
        //         shape: RoundedRectangleBorder(
        //           borderRadius: BorderRadius.circular(30.r),
        //         ),
        //
        //         child: MyContainer(
        //           // padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        //           horizontalPadding: 20, verticalPadding: 20,
        //           child: ListView(
        //             shrinkWrap: true,
        //             children: [
        //
        //               Height(size: 25),
        //               Container(
        //                 height: 100,
        //                 decoration: BoxDecoration(
        //                     image: DecorationImage(
        //                         image: AssetImage('assets/tw/topup.png')
        //                     )
        //                 ),
        //               ),
        //
        //               Height(size: 25),
        //
        //               Center(
        //                 child: Text(
        //                   'Hurrah!',
        //                   style: GoogleFonts.montserrat(
        //                       fontSize: 14.sp,
        //                       color: bluetext,
        //                       fontWeight: FontWeight.w500
        //                   ),
        //                 ),
        //               ),
        //               Height(size: 8),
        //
        //               Center(
        //                 child: amount != null? Text(
        //                   '${amount}GHC Added In Your Twiddle Wallet',
        //                   textAlign: TextAlign.center,
        //                   style: GoogleFonts.montserrat(
        //                       fontSize: 16.sp,
        //                       color: active,
        //                       fontWeight: FontWeight.bold
        //                   ),
        //                 ) : Text(
        //                   'GHC Added In Your Twiddle Wallet',
        //                   textAlign: TextAlign.center,
        //                   style: GoogleFonts.montserrat(
        //                       fontSize: 16.sp,
        //                       color: active,
        //                       fontWeight: FontWeight.bold
        //                   ),
        //                 ),
        //               ),
        //
        //               Height(size: 25),
        //
        //               Button(
        //                   onTap: ()=> Get.back(),
        //                   text: 'Done'
        //               ),
        //               Height()
        //             ],),
        //         ),
        //       ));
        // }
        // else {
        //   Fluttertoast.showToast(msg: 'Minimum amount would be 3000');
        // }

      },
        text: 'Continue'
    );
  }
}
