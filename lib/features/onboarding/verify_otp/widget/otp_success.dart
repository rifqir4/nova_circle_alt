import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nova_circle_alt/core/router/app_routes.dart';
import 'package:nova_circle_alt/core/themes/app_dimension.dart';
import 'package:nova_circle_alt/core/themes/app_text_styles.dart';
import 'package:nova_circle_alt/shared/resources/app_svgs.dart';
import 'package:nova_circle_alt/shared/widgets/button/button.dart';
import 'package:nova_circle_alt/shared/widgets/space.dart';

class OtpSuccess extends StatelessWidget {
  const OtpSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppDimension.paddingScreen),
      child: Column(
        children: [
          const Spacer(flex: 3),
          SvgPicture.asset(AppSvgs.checkmarkCircle, width: 120.w),
          SpaceV(value: 34.h),
          Text("Your phone number\nwas successfully verified.",
              textAlign: TextAlign.center,
              style: AppTextStyles.body1Bold.copyWith(
                fontSize: 18.sp,
              )),
          SpaceV(value: 12.h),
          Text("Tap the button to continue.",
              textAlign: TextAlign.center, style: AppTextStyles.body2),
          const Spacer(flex: 4),
          Button(
              title: "Continue",
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.contactPermission);
              }),
          SpaceV(value: 30.h),
        ],
      ),
    );
  }
}
