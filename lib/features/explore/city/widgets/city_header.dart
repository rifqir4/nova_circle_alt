import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nova_circle_alt/core/utils/app_botsheet.dart';
import 'package:nova_circle_alt/shared/resources/app_svgs.dart';
import 'package:spring/spring.dart';

import '../../../../core/themes/themes.dart';
import '../../../../shared/resources/app_images.dart';
import '../../../../shared/widgets/widgets.dart';

class CityHeader extends StatelessWidget {
  const CityHeader({super.key, this.isIntro = false});

  final bool isIntro;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        return Stack(
          children: [
            Container(
              height: constraint.maxHeight,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AppImages.intro2), fit: BoxFit.cover),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: constraint.maxHeight * 0.45,
                width: constraint.maxWidth,
                padding: EdgeInsets.symmetric(
                  horizontal: AppDimension.paddingScreen,
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.black.withOpacity(0.3), Colors.transparent],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),

                    //Title
                    Text(
                      "Barcelona",
                      style: AppTextStyles.areaInktrap
                          .copyWith(fontSize: 40.sp, color: AppColors.white),
                    ),
                    SpaceV(value: 16.h),

                    //User List
                    Row(
                      children: [
                        ...List.generate(
                          4,
                          (index) => Container(
                            margin: EdgeInsets.only(right: 6.w),
                            width: 40.w,
                            height: 40.w,
                            decoration: BoxDecoration(
                              color: AppColors.blueSky,
                              borderRadius: BorderRadius.circular(13.w),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 63.w,
                          height: 20.w,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(6.w),
                            child: Material(
                              color: AppColors.blueSky.withOpacity(0.75),
                              child: InkWell(
                                onTap: () {
                                  AppBotsheet.followInCity();
                                },
                                child: Center(
                                  child: Text(
                                    "+7 more",
                                    style: AppTextStyles.body4
                                        .copyWith(color: AppColors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    //Scroll
                    if (isIntro) ...[
                      SpaceV(value: 36.h),
                      Center(
                        child: Column(
                          children: [
                            Text(
                              "Scroll for more",
                              style: AppTextStyles.body3
                                  .copyWith(color: AppColors.white),
                            ),
                            const SpaceV(value: 5),
                            Spring.slide(
                              cutomTweenOffset: Tween(
                                  begin: const Offset(0, -5),
                                  end: const Offset(0, 0)),
                              slideType: SlideType.slide_in_top,
                              animDuration: const Duration(seconds: 1),
                              curve: Curves.linear,
                              springController:
                                  SpringController(initialAnim: Motion.loop),
                              child: SvgPicture.asset(
                                AppSvgs.icChevDown,
                                width: 14.w,
                                colorFilter: const ColorFilter.mode(
                                  AppColors.white,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SpaceV(value: 35.h),
                    ],

                    if (!isIntro) SpaceV(value: 30.h),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
