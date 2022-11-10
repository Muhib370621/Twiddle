import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/constants.dart';
import '../transaction/transaction.dart';
import 'pay_installment.dart';

class RentDashboard extends StatelessWidget {
  const RentDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: maincolor,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: BackButtonText(
            buttonColor: white,
            iconColor: maincolor,
            color: white, fontWeight: FontWeight.normal,  
            text: 'Renter\'s Instalment Dashboard'
        ),
      ),
      body: SafeArea(

          child: Container(
            child: Column(
              children: [

                MyContainer(
                  color: maincolor,
                  horizontalPadding: 15,
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Height(size: 20,),
                      PoppinsText(text: 'Total Rent Amount:', color: white),
                      Height(),
                      PoppinsText(text: 'GHC ', color: white, fontWeight: FontWeight.w500, size: 18),
                      Height(size: 15),

                      MyContainer(
                        horizontalPadding: 15,
                        verticalPadding: 15,
                        radius: 20, color: white,
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [

                            Column(
                              children: [
                                PoppinsText(text: 'Rent Paid'),
                                PoppinsText(text: 'GHC ', size: 16, fontWeight: FontWeight.w500, color: maincolor,),
                              ],
                            ),

                            MyContainer(color: black, height: 40, width: 1),

                            Column(
                              children: [
                                PoppinsText(text: 'Rent Remaining'),
                                PoppinsText(text: '-GHC ', size: 16, fontWeight: FontWeight.w500, color: maincolor,),
                              ],
                            )

                          ],
                        ),
                      ),

                      Height(size: 20),
                    ],
                  ),
                ),

                MyContainer(
                  horizontalPadding: 15,
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Height(size: 25,),

                      Button(
                        onTap: (){
                          Get.to(()=> PayInstallment());
                        },
                          text: 'Pay your Rent'
                      ),
                      Height(size: 20,),
                      PoppinsText(text: 'Rent Payments', size: 16,),

                      Height(size: 15,),
                      
                      Transactions(
                        type: 'Rent Paid Successfully',
                        amount: 150,
                        date: '08-Aug-2022',
                      )

                    ],
                  ),
                )


              ],
            ),
          )
      ),
    );
  }
}