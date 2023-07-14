import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nova_circle_alt/core/router/app_routes.dart';
import 'package:nova_circle_alt/shared/resources/app_svgs.dart';

import '../../core/themes/themes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final offsetAnimationDuration = 600;

  double offset = -90;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      //Start animation
      await Future.delayed(const Duration(milliseconds: 400))
          .then((_) => setState(() => offset = -200));

      //After 1 second go to home
      await Future.delayed(const Duration(milliseconds: 1000)).then((_) {
        Navigator.pushNamedAndRemoveUntil(
            context, AppRoutes.home, (route) => false);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blueSky,
      body: Center(
        child: SizedBox(
          width: double.infinity,
          height: 200.h,
          child: Stack(
            children: [
              Center(child: SvgPicture.asset(AppSvgs.novaN, height: 200.h)),
              AnimatedPositioned(
                  duration: Duration(milliseconds: offsetAnimationDuration),
                  top: 0,
                  left: offset,
                  child: SvgPicture.asset(AppSvgs.novaOval, height: 200.h)),
              AnimatedPositioned(
                  duration: Duration(milliseconds: offsetAnimationDuration),
                  top: 0,
                  right: offset,
                  child: SvgPicture.asset(AppSvgs.novaOval, height: 200.h)),
            ],
          ),
        ),
      ),
    );
  }
}
