import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova_circle_alt/core/utils/app_botsheet.dart';

import '../../../core/themes/themes.dart';
import '../widgets.dart';

class BotsheetFollowInCity extends StatelessWidget {
  const BotsheetFollowInCity({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Text
        Padding(
          padding: EdgeInsets.fromLTRB(32.w, 16.h, 32.w, 32.h),
          child: Column(
            children: [
              Text(
                "People you follow in Barcelona",
                textAlign: TextAlign.center,
                style: AppTextStyles.subtitleBold.copyWith(
                  color: AppColors.greyDarkest,
                ),
              ),
              SpaceV(value: 12.h),
              Text(
                "A list of users you follow who created a recommendation or have visited a spot in Barcelona",
                textAlign: TextAlign.center,
                style: AppTextStyles.body2.copyWith(
                  color: AppColors.greyDarkest,
                ),
              ),
            ],
          ),
        ),

        //List People

        GridView.builder(
          primary: false,
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio: 56.w / 86.w,
            mainAxisSpacing: 20.w,
            crossAxisSpacing: 32.w,
          ),
          itemCount: 8,
          itemBuilder: (context, index) {
            return Column(
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18.w),
                        color: AppColors.blueSky),
                  ),
                ),
                const Spacer(),
                Text(
                  "Omar Bergson",
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.body3.copyWith(
                    color: AppColors.greyDarker,
                    fontSize: 11.sp,
                  ),
                ),
              ],
            );
          },
        ),
        SpaceV(value: 32.h),
        Button(
          title: "Close",
          onPressed: () => AppBotsheet.close(),
        ),
      ],
    );
  }
}
