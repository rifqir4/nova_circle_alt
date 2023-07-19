import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nova_circle_alt/core/router/router.dart';
import 'package:nova_circle_alt/shared/resources/app_svgs.dart';

import '../../../../core/themes/themes.dart';
import '../../../../shared/resources/app_images.dart';
import '../../../../shared/widgets/widgets.dart';

class UserProfileHeader extends StatelessWidget {
  const UserProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 380.h,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: AppColors.blueSky,
            image: DecorationImage(
                image: AssetImage(AppImages.intro1), fit: BoxFit.cover),
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 152.h,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.45),
                    Colors.transparent,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 215.h,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.45),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: Column(
            children: [
              const SpaceV(value: kToolbarHeight),
              Padding(
                padding: EdgeInsets.only(top: 16.w, bottom: 16.w, right: 16.w),
                child: Material(
                  color: Colors.transparent,
                  child: Row(
                    children: [
                      const Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          AppSvgs.icLove,
                          width: 20.w,
                          colorFilter: const ColorFilter.mode(
                              AppColors.white, BlendMode.srcIn),
                        ),
                        splashRadius: 20.w,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          AppSvgs.icComment,
                          width: 20.w,
                          colorFilter: const ColorFilter.mode(
                              AppColors.white, BlendMode.srcIn),
                        ),
                        splashRadius: 20.w,
                      ),
                      IconButton(
                        onPressed: () => AppNav.push(
                          AppRoutes.profileSettingsScreen,
                        ),
                        icon: SvgPicture.asset(
                          AppSvgs.icSetting,
                          width: 20.w,
                          colorFilter: const ColorFilter.mode(
                              AppColors.white, BlendMode.srcIn),
                        ),
                        splashRadius: 20.w,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          AppSvgs.icShare,
                          width: 20.w,
                          colorFilter: const ColorFilter.mode(
                              AppColors.white, BlendMode.srcIn),
                        ),
                        splashRadius: 20.w,
                      ),
                    ],
                  ),
                ),
              ),
              SpaceV(value: 14.h),

              //Picture
              Column(
                children: [
                  Container(
                    width: 128.w,
                    height: 128.w,
                    decoration: BoxDecoration(
                      color: AppColors.blueSky,
                      borderRadius: BorderRadius.circular(44.w),
                      border: Border.all(
                        color: AppColors.greyLightest,
                        width: 2.w,
                      ),
                    ),
                  ),
                  SpaceV(value: 5.h),
                  Text(
                    "Lusiana Silalahi",
                    style: AppTextStyles.body1Bold
                        .copyWith(fontSize: 20.sp, color: AppColors.white),
                  ),
                  SpaceV(value: 5.h),
                  Text(
                    "@lisa",
                    style: AppTextStyles.body2.copyWith(color: AppColors.white),
                  ),
                ],
              ),
              const Spacer(),

              //Follow
              Row(
                children: [
                  const Spacer(),
                  Text(
                    "5.5K followers",
                    style: AppTextStyles.body2.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 8.w),
                    width: 4.w,
                    height: 4.w,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.white,
                    ),
                  ),
                  Text(
                    "12 following",
                    style: AppTextStyles.body2.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
              SpaceV(value: 16.h),
            ],
          ),
        ),
      ],
    );
  }
}
