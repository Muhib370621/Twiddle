import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:twiddle_refactored/src/core/utils/app_colors.dart';

import '../../../core/utils/app_assets.dart';
import 'myContainer.dart';
import 'myTextField.dart';

class Appbar extends StatelessWidget {
  VoidCallback? onDrawerTap;

  Appbar({Key? key, this.onDrawerTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final search = TextEditingController();
    return Container(
      color: AppColors.kLightGrey,
    );
  }
}
