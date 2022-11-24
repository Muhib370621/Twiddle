import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:twiddle_refactored/src/core/error/noDataWidget.dart';
import 'package:twiddle_refactored/src/core/utils/app_assets.dart';
import 'package:twiddle_refactored/src/core/utils/app_colors.dart';

import '../../components/topWithblueBackButton.dart';

class DrawerNotifications extends StatelessWidget {
  const DrawerNotifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TopWithBackButton(text: 'NOTIFICATIONS',),
            ],
          ),
          SizedBox(
            height: 28.h,
          ),
          const NoDataWidget(),
        ],
      ),
    );
  }
}
