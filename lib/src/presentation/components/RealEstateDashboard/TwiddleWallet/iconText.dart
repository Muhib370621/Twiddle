import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/utils/app_colors.dart';

class IconText extends StatelessWidget {
  IconData icon; String text; double size; double iconSize;
  FontWeight fontWeight; Color color; Color iconColor;
  IconText({Key? key,
    required this.icon, required this.text, this.iconColor = AppColors.welcomeTwiddle,
    this.fontWeight = FontWeight.normal, this.size = 10, this.color = AppColors.welcomeTwiddle, this.iconSize = 15
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor, size: iconSize),
        SizedBox(width: 2.w,),
        Text(text, style: TextStyle(fontSize: size, color: color, fontWeight: fontWeight))
      ],
    );
  }
}