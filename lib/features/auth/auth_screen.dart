import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/themes/themes.dart';
import '../../shared/resources/app_svgs.dart';
import '../../shared/widgets/widgets.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blueSky,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.w),
        child: Column(
          children: [
            const Spacer(),
            Center(child: SvgPicture.asset(AppSvgs.novaCircle, width: 125.w)),
            const Spacer(),
            ButtonSignIn(
                text: "Continue with Apple",
                icon: AppSvgs.appleLogo,
                onPressed: () {}),
            SpaceV(value: 10.h),
            ButtonSignIn(
                text: "Continue with Google",
                icon: AppSvgs.googleLogo,
                onPressed: () {}),
            SpaceV(value: 30.h),
          ],
        ),
      ),
    );
  }
}
