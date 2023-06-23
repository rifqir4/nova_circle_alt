import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/themes/themes.dart';
import '../resources/app_svgs.dart';
import '../widgets/widgets.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          SvgPicture.asset(AppSvgs.illustrationNoConnectivity,
              width: AppDimension.illustrationWidth),
          SpaceV(value: 16.h),
          Text("You're offline", style: AppTextStyles.body2Bold),
          SpaceV(value: 16.h),
          Text("Please connect to the internet and try again",
              style: AppTextStyles.body2),
          SpaceV(value: 14.h),
          SizedBox(
              width: 180.w,
              child: ButtonText(
                  title: "Retry",
                  textStyle: AppTextStyles.body2Bold.copyWith(
                    color: AppColors.blueSky,
                  ),
                  onPressed: () {})),
        ]),
      ),
    );
  }
}
