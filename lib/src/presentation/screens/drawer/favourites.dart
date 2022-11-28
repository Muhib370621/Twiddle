import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:twiddle_refactored/src/presentation/components/RealEstateDashboard/rentProperty.dart';

import '../../../controller/Real State Controllers/mainScreenController.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';
import '../../components/topWithblueBackButton.dart';

class Favourites extends StatelessWidget {
   Favourites({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TopWithBackButton(
                text: 'FAVOURITES',
              ),
            ],
          ),
          SizedBox(
            height: 4.h,
          ),
          Expanded(child: RentProperty())
        ],
      ),
    );
  }
}
