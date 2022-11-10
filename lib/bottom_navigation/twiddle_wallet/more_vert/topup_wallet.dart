import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_agent/constants/constants.dart';

import 'pay_with_card.dart';

class TopUpWallet extends StatelessWidget {
  const TopUpWallet({Key? key}) : super(key: key);

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
            child: Column(
              children: [

                Height(size: 20),

                GestureDetector(
                  onTap: (){
                    Get.to(()=> PayCard());
                  },
                  child: MyContainer(
                    horizontalMargin: 15,
                    horizontalPadding: 10,
                    verticalPadding: 10,
                    radius: 20, color: white,
                    shadowColor: maincolor.withOpacity(0.15),
                    child: Row(
                      children: [

                        Picture(
                          size: 60,
                          asset: 'assets/tw/wallet.png',
                        ),

                        Width(size: 10),

                        PoppinsText(text: 'Top-Up Wallet')


                      ],
                    ),
                  ),
                )

              ],
            ),
          )
      ),
    );
  }
}
