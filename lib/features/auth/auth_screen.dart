import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nova_circle_alt/core/router/app_routes.dart';
import 'package:nova_circle_alt/features/auth/widget/video_background.dart';

import '../../core/themes/themes.dart';
import '../../shared/resources/app_svgs.dart';
import '../../shared/widgets/widgets.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.blueSky,
      body: Stack(
        children: [
          const Positioned.fill(child: VideoSplashView()),
          Positioned.fill(
            child: ColoredBox(
              color: Colors.black.withOpacity(0.3),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.w),
            child: Column(
              children: [
                const Spacer(),
                Center(
                    child: SvgPicture.asset(AppSvgs.novaCircle, width: 125.w)),
                const Spacer(),
                ButtonSignIn(
                    text: "Continue with Apple",
                    icon: AppSvgs.appleLogo,
                    onPressed: () {
                      Navigator.of(context).pushNamed(AppRoutes.verifyPhone);
                    }),
                SpaceV(value: 10.h),
                ButtonSignIn(
                    text: "Continue with Google",
                    icon: AppSvgs.googleLogo,
                    onPressed: () {}),
                SpaceV(value: 30.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
