import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:twiddle_refactored/src/presentation/components/RealEstateDashboard/rentProperty.dart';

import '../../components/topWithblueBackButton.dart';

class RecentlyViewed extends StatelessWidget {
  RecentlyViewed({Key? key}) : super(key: key);
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
                text: 'RECENTLY VIEWED',
              ),
            ],
          ),
          SizedBox(
            height: 4.h,
          ),
          Expanded(
            child: RentProperty(),
          )
        ],
      ),
    );
  }
}
