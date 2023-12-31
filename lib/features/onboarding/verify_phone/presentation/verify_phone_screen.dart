import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/router/app_routes.dart';
import '../../../../core/themes/themes.dart';
import '../../../../shared/widgets/widgets.dart';

class VerifyPhoneScreen extends StatelessWidget {
  const VerifyPhoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: UnfocusWrap(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppDimension.paddingScreen),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SpaceV(value: 20.h),
              Text("We need to verify your phone number",
                  style: AppTextStyles.body1Bold.copyWith(
                    color: AppColors.greyDarkest,
                  )),
              SpaceV(value: 12.h),
              Text(
                  "Please provide the phone number to which we could send the verification code.",
                  style: AppTextStyles.body2),
              const Spacer(flex: 3),
              InputPhone(
                onChanged: (text) {},
              ),
              const Spacer(flex: 5),
              Button(
                  title: "Send",
                  onPressed: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                    Navigator.pushNamed(context, AppRoutes.verifyOtp);
                  }),
              SpaceV(value: 30.h),
            ],
          ),
        ),
      )),
    );
  }
}
