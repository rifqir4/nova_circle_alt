import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/themes/themes.dart';

class ButtonFollow extends StatelessWidget {
  const ButtonFollow({super.key, this.isFollow = false});

  final bool isFollow;

  @override
  Widget build(BuildContext context) {
    final width = isFollow ? 65.w : 60.w;
    final text = isFollow ? "Following" : "Follow";
    final textColor = isFollow ? AppColors.white : AppColors.greyDarkest;
    final backgroundColor =
        isFollow ? AppColors.blueSkyLight : AppColors.blueSkyLightest;

    return SizedBox(
      width: width,
      height: 22.w,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
            elevation: 0,
            backgroundColor: backgroundColor,
            foregroundColor: textColor,
            side: BorderSide.none,
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.w),
                side: BorderSide.none)),
        child: Text(
          text,
          style: AppTextStyles.body4.copyWith(color: textColor),
        ),
        onPressed: () {},
      ),
    );
  }
}
