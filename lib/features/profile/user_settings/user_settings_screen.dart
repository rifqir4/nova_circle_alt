import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nova_circle_alt/core/router/app_nav.dart';
import 'package:nova_circle_alt/core/router/app_routes.dart';
import 'package:nova_circle_alt/core/themes/themes.dart';
import 'package:nova_circle_alt/shared/resources/app_svgs.dart';
import 'package:nova_circle_alt/shared/widgets/button/button_back.dart';
import 'package:nova_circle_alt/shared/widgets/custom_appbar.dart';
import 'package:nova_circle_alt/shared/widgets/space.dart';

class UserSettingsScreen extends StatelessWidget {
  const UserSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        leading: ButtonBack(
          foregroundColor: AppColors.greyDarkest,
          onPressed: () => AppNav.back(),
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: 364.h,
                decoration: BoxDecoration(
                  color: AppColors.blueSkyLighter,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16.w),
                    bottomRight: Radius.circular(16.w),
                  ),
                ),
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(height: 80.h, width: double.infinity),
              Container(
                width: 56.w,
                height: 56.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18.w),
                  color: AppColors.blueSky,
                ),
              ),
              SpaceV(value: 12.h),
              Text(
                "Johnny Edlind",
                style: AppTextStyles.body1.copyWith(
                  color: AppColors.greyDarkest,
                ),
              ),
              SpaceV(value: 4.h),
              Text(
                "@johnny",
                style: AppTextStyles.body2.copyWith(
                  color: AppColors.greyDarkest,
                ),
              ),

              //First Section
              SpaceV(value: 16.h),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 24.w),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(12.w),
                ),
                child: Column(
                  children: [
                    _buildItem(
                      icon: AppSvgs.icUser,
                      title: "Edit Profile",
                      onPressed: () => AppNav.push(AppRoutes.profileEditScreen),
                    ),
                    _buildItem(
                      icon: AppSvgs.icSetting,
                      title: "Application Setting",
                    ),
                  ],
                ),
              ),

              //Second Section
              SpaceV(value: 16.h),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 24.w),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(12.w),
                ),
                child: Column(
                  children: [
                    _buildItem(
                      icon: AppSvgs.icMessage,
                      title: "Support Center",
                    ),
                    _buildItem(
                      icon: AppSvgs.icUserOctagon,
                      title: "Terms and conditions",
                    ),
                    _buildItem(
                      icon: AppSvgs.icShield,
                      title: "Privacy and policy",
                    ),
                  ],
                ),
              ),

              //Third Section
              SpaceV(value: 16.h),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 24.w),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(12.w),
                ),
                child: Column(
                  children: [
                    _buildItem(
                      icon: AppSvgs.icLogout,
                      title: "Sign Out",
                    ),
                    _buildItem(
                      icon: AppSvgs.icTrash,
                      title: "Delete Account",
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildItem(
      {required String icon, required String title, VoidCallback? onPressed}) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(16.w),
        color: Colors.transparent,
        child: Row(
          children: [
            Container(
              width: 32.w,
              height: 32.w,
              decoration: BoxDecoration(
                color: AppColors.greyLightest,
                borderRadius: BorderRadius.circular(10.w),
              ),
              child: Center(
                child: SvgPicture.asset(
                  icon,
                  width: 20.w,
                  colorFilter: const ColorFilter.mode(
                      AppColors.blueSky, BlendMode.srcIn),
                ),
              ),
            ),
            SpaceH(value: 12.w),
            Expanded(
              child: Text(
                title,
                style:
                    AppTextStyles.body2.copyWith(color: AppColors.greyDarker),
              ),
            ),
            SvgPicture.asset(
              AppSvgs.icChevRight,
              width: 20.w,
              colorFilter:
                  const ColorFilter.mode(AppColors.blueSky, BlendMode.srcIn),
            ),
          ],
        ),
      ),
    );
  }
}
