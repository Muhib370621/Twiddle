import 'package:flutter/material.dart';
import 'package:twiddle_refactored/src/core/utils/app_colors.dart';

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
