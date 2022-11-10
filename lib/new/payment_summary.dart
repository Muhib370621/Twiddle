import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../Screens/bottom_navi/home_screen/rentDetail.dart';
import '../bottom_navigation/dashboard/invest/pay_now.dart';
import '../constants/constants.dart';

class PropertySummary extends StatefulWidget {
  String? type; int? price;
  PropertySummary({Key? key, this.type, this.price}) : super(key: key);

  @override
  State<PropertySummary> createState() => _PropertySummaryState();
}

class _PropertySummaryState extends State<PropertySummary> {

  var total_payment, mediation_charges;
  @override
  void initState() {
    getPayment(widget.price!);
    super.initState();
  }

  getPayment(var price){
    setState(() {
      mediation_charges = (price/100)*4;
      total_payment = mediation_charges + price;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(widget.type == 'Rent' || widget.type == 'Short Stay'){
      return RentDetail(
         price: widget.price,
      );
    }
    else if(widget.type == 'Sale'){
      return Scaffold(
        body: Container(
          width: Get.width, height: Get.height,
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Height(size: 40,),
              BackButtonText(text: 'Summary'),
              Height(size: 20,),
              PoppinsText(text: 'Property Payment Details', size: 16, color: maincolor),
              Height(size: 12,),
              TextIcon(text1: 'Property Price', text2: 'GHC ${widget.price}'),
              Height(size: 20),
              MyDivider(),
              Height(size: 20),
              PoppinsText(text: 'Service Charges', size: 16, color: maincolor),
              Height(size: 12,),
              TextIcon(text1: 'Mediation Fee (4%)', text2: '${mediation_charges}'),
              Height(size: 20),
              MyDivider(),
              Height(size: 20),
              TextIcon(
                text1: 'Total Payment', text2: '${total_payment}',
                color1: maincolor, color2: maincolor,
              ),

              Expanded(child: Container()),
              Button(
                text: 'Continue',
                onTap: (){
                  Get.to(()=> InvestScreen(
                    payment: total_payment,
                  ));
                },
              ),

              Height(size: 30)

            ],
          ),
        ),
      );
    }
    return Scaffold();
  }
}