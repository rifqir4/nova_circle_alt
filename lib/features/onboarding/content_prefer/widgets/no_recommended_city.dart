import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nova_circle_alt/core/themes/themes.dart';
import 'package:nova_circle_alt/shared/resources/app_svgs.dart';
import 'package:nova_circle_alt/shared/widgets/widgets.dart';

class NoRecomendedCity extends StatelessWidget {
  const NoRecomendedCity({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          const SpaceV(),
          Text("No results found",
              style:
                  AppTextStyles.body3.copyWith(color: AppColors.greyDarkest)),
          SpaceV(value: 8.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 80.w),
            child: Text(
                "No one has recommended this city yet. Explore the app and be the first one to add it!",
                textAlign: TextAlign.center,
                style: AppTextStyles.body4),
          ),
          SpaceV(value: 30.h),
          Padding(
            padding: EdgeInsets.only(left: 30.w),
            child:
                SvgPicture.asset(AppSvgs.illustrationSearchEmpty, width: 130.w),
          ),
        ],
      ),
    );
  }
}
