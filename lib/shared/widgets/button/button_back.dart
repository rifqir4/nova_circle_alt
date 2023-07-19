import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nova_circle_alt/core/themes/app_colors.dart';
import 'package:nova_circle_alt/shared/resources/app_svgs.dart';

class ButtonBack extends StatelessWidget {
  const ButtonBack({
    Key? key,
    this.backgroundColor,
    this.foregroundColor,
    this.onPressed,
  }) : super(key: key);

  final Color? backgroundColor;
  final Color? foregroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final bgColor = backgroundColor ?? Colors.transparent;
    final fgColor = foregroundColor ?? AppColors.greyDarkest;

    return Container(
      padding: EdgeInsets.all(5.w),
      color: Colors.transparent,
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.transparent,
        ),
        child: Material(
          color: bgColor,
          child: InkWell(
            onTap: onPressed ?? () {},
            child: Padding(
              padding: EdgeInsets.all(8.w),
              child: SvgPicture.asset(
                AppSvgs.icArrowLeft,
                colorFilter: ColorFilter.mode(fgColor, BlendMode.srcIn),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
