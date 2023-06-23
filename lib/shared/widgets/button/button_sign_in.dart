import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/themes/themes.dart';

class ButtonSignIn extends StatelessWidget {
  const ButtonSignIn(
      {super.key,
      required this.text,
      required this.icon,
      required this.onPressed});

  final String text;
  final String icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
            elevation: 0,
            backgroundColor: AppColors.white,
            foregroundColor: AppColors.greyDarkest,
            padding: const EdgeInsets.symmetric(vertical: 12),
            textStyle: AppTextStyles.body2Bold,
            side: const BorderSide(color: AppColors.white),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(1000),
            )),
        onPressed: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(icon),
            SizedBox(width: 5.w),
            Text(text, style: AppTextStyles.body2Bold),
          ],
        ),
      ),
    );
  }
}
