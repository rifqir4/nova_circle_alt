import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova_circle_alt/shared/widgets/button/button.dart';
import 'package:nova_circle_alt/shared/widgets/button/button_back.dart';
import 'package:nova_circle_alt/shared/widgets/input/input_text.dart';
import 'package:nova_circle_alt/shared/widgets/space.dart';

import '../../../core/router/router.dart';
import '../../../core/themes/themes.dart';

class UserEditScreen extends StatelessWidget {
  const UserEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      extendBodyBehindAppBar: true,
      // appBar: CustomAppBar(
      //   leading: ButtonBack(
      //     foregroundColor: AppColors.greyDarkest,
      //     onPressed: () => AppNav.back(),
      //   ),
      // ),

      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 0,
            backgroundColor: AppColors.white,
            leading: ButtonBack(
              foregroundColor: AppColors.greyDarkest,
              onPressed: () => AppNav.back(),
            ),
            collapsedHeight: 210.h,
            expandedHeight: 210.h,
            flexibleSpace: Container(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.w),
              decoration: BoxDecoration(
                color: AppColors.blueSkyLighter,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16.w),
                  bottomRight: Radius.circular(16.w),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  Container(
                    width: 50.w,
                    height: 50.w,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.white,
                    ),
                  ),
                  SpaceV(value: 12.h),
                  Text(
                    "Edit an account",
                    style: AppTextStyles.body1Bold.copyWith(
                      color: AppColors.greyDarkest,
                      fontSize: 18.sp,
                    ),
                  ),
                  SpaceV(value: 8.h),
                  Text(
                    "Make changes on an account and continue discovering new destinations",
                    style: AppTextStyles.body3
                        .copyWith(color: AppColors.greyDarkest),
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(24.w),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "First name",
                        style: AppTextStyles.body3.copyWith(
                          color: AppColors.greyDarkest,
                        ),
                      ),
                      SpaceV(value: 8.w),
                      const InputText(),
                    ],
                  ),
                  //
                  SpaceV(value: 20.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Last name",
                        style: AppTextStyles.body3.copyWith(
                          color: AppColors.greyDarkest,
                        ),
                      ),
                      SpaceV(value: 8.w),
                      const InputText(),
                    ],
                  ),

                  SpaceV(value: 20.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Username",
                        style: AppTextStyles.body3.copyWith(
                          color: AppColors.greyDarkest,
                        ),
                      ),
                      SpaceV(value: 8.w),
                      const InputText(),
                    ],
                  ),

                  SpaceV(value: 20.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Bio",
                        style: AppTextStyles.body3.copyWith(
                          color: AppColors.greyDarkest,
                        ),
                      ),
                      SpaceV(value: 8.w),
                      const InputText(
                        hintText: "Short Bio",
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 50.h),
              child: Button(
                title: "Update",
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
