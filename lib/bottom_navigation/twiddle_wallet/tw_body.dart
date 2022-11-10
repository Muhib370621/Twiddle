import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/constants.dart';
import 'invest/dashboard_investment.dart';
import 'more_vert/topup_wallet.dart';
import 'rent/rent_dashboard.dart';

class TwHeader extends StatelessWidget {
  final amount;
  TwHeader({Key? key, this.amount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyContainer(
      horizontalPadding: 15, color: maincolor,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Height(),
          PoppinsText(text: 'Total Available Amount', size: 14, color: white),
          Height(size: 5),
          Text('Ghc $amount',
            style: GoogleFonts.quicksand(
              fontSize: 32.sp,
              color: white,
              fontWeight: FontWeight.bold
            ),
          ),
          Height(size: 15),

          Row(
            children: [
              Expanded(
                  child: Iconbutton(
                    padding: 5, size: 12,
                    myIconsSize: 20, height: 45,
                    MyIcon: SvgPicture.asset('assets/walletic.svg'),
                    buttonColor: white, color: maincolor,
                    text: 'Withdraw Money',
                  )
              ),
              Width(size: 10,),
              Expanded(
                  child: Iconbutton(
                    onTap: () {
                      Get.to(()=> TopUpWallet());
                    },
                    padding: 5, size: 12,
                    myIconsSize: 20, height: 45,
                    MyIcon: SvgPicture.asset('assets/drawer/invest.svg', color: maincolor,),
                    buttonColor: white, color: maincolor,
                    text: 'Top-Up Balance',
                  )
              ),
            ],
          ),
          Height(size: 15,),
          Row(
            children: [
              Expanded(
                  child: Iconbutton(
                    onTap: () {
                      Get.to(()=> DashboardInvest());
                    },
                    padding: 5, size: 12,
                    myIconsSize: 20, height: 45,
                    MyIcon: SvgPicture.asset('assets/tw/invest.svg'),
                    buttonColor: white, color: maincolor,
                    text: 'Invest Dashboard',
                  )
              ),
              Width(size: 10,),
              Expanded(
                  child: Iconbutton(
                    onTap: (){
                      Get.to(()=> RentDashboard());
                    },
                    padding: 5, size: 12,
                    myIconsSize: 20, height: 45,
                    MyIcon: SvgPicture.asset('assets/tw/rent.svg'),
                    buttonColor: white, color: maincolor,
                    text: 'Rent Dashboard',
                  )
              ),
            ],
          ),
          Height(size: 20,),

        ],
      ),
    );
  }
}


