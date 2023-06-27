import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nova_circle_alt/core/router/app_routes.dart';
import 'package:nova_circle_alt/core/themes/themes.dart';
import 'package:nova_circle_alt/shared/resources/app_svgs.dart';

import '../../../shared/widgets/widgets.dart';

class ContactPermissionScreen extends StatelessWidget {
  const ContactPermissionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppDimension.paddingScreen),
        child: Column(
          children: [
            const Spacer(flex: 5),
            SvgPicture.asset(AppSvgs.illustrationContactSync, width: 110.w),
            const SpaceV(),
            Text("Sync Contacts to find your circle",
                style: AppTextStyles.subtitleBold),
            const SpaceV(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Text(
                  "In order to help you easily connect with your circle who are already using Nova Circle, we will need to access your contact list.",
                  textAlign: TextAlign.center,
                  style: AppTextStyles.body2),
            ),
            const Spacer(flex: 3),
            Button(title: "Enable", onPressed: () {}),
            SpaceV(value: 5.h),
            ButtonText(
                title: "Skip for now",
                textStyle:
                    AppTextStyles.body2Bold.copyWith(color: AppColors.blueSky),
                onPressed: () {
                  Navigator.of(context).pushNamed(AppRoutes.contactSync);
                }),
            SpaceV(value: 30.h)
          ],
        ),
      ),
    );
  }
}
