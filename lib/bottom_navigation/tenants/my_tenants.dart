import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:state_agent/constants/constants.dart';

import 'tenants.dart';

class TenantsList extends StatelessWidget {
  const TenantsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: Get.width, height: Get.height,
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [


                Height(size: 20),

                BackButtonText(text: 'MY TENANTS', fontWeight: FontWeight.w500, size: 16,),



                Height(size: 20),
                Expanded(
                    child: Tenants()
                ),



              ],
            ),
          ),
        ),
      ),
    );
  }
}

