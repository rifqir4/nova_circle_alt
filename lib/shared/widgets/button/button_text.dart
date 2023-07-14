import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova_circle_alt/core/themes/app_colors.dart';
import 'package:nova_circle_alt/core/themes/app_text_styles.dart';

class ButtonText extends StatelessWidget {
  const ButtonText(
      {super.key,
      required this.title,
      this.textStyle,
      required this.onPressed,
      this.paddingVertical});

  final String title;
  final TextStyle? textStyle;
  final VoidCallback onPressed;
  final double? paddingVertical;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        style: TextButton.styleFrom(
            elevation: 0,
            foregroundColor: AppColors.blueSky,
            padding: EdgeInsets.symmetric(vertical: paddingVertical ?? 12.w),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(1000),
                side: BorderSide.none)),
        onPressed: onPressed,
        child: Text(title, style: textStyle ?? AppTextStyles.body1Bold),
      ),
    );
  }
}
