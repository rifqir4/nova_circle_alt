import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova_circle_alt/core/themes/app_colors.dart';
import 'package:nova_circle_alt/core/themes/app_dimension.dart';
import 'package:nova_circle_alt/core/themes/app_text_styles.dart';
import 'package:nova_circle_alt/core/utils/app_global.dart';

import '../../../shared/widgets/widgets.dart';

class AddNewListScreen extends StatelessWidget {
  const AddNewListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleText: "My List",
        leading: ButtonBack(
          onPressed: () {
            mainNavigatorKey.currentState?.pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: AppDimension.paddingScreen,
            vertical: 20.h,
          ),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(8.w),
          ),
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 327.w / 172.w,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.greyLightest,
                    borderRadius: BorderRadius.circular(8.w),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.add,
                          color: AppColors.greyDarker,
                        ),
                        Text(
                          "Add cover image",
                          style: AppTextStyles.body4
                              .copyWith(color: AppColors.greyDarker),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SpaceV(),
              SpaceV(value: 20.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "List title",
                    style: AppTextStyles.body3.copyWith(
                      color: AppColors.greyDarkest,
                    ),
                  ),
                  SpaceV(value: 8.w),
                  const InputText(
                    hintText: "My newest list",
                  ),
                ],
              ),
              SpaceV(value: 20.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "List description (optional)",
                    style: AppTextStyles.body3.copyWith(
                      color: AppColors.greyDarkest,
                    ),
                  ),
                  SpaceV(value: 8.w),
                  const InputText(
                    hintText: "Lorem Ipsum",
                  ),
                ],
              ),
              SpaceV(value: 20.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Public selection",
                    style: AppTextStyles.body3.copyWith(
                      color: AppColors.greyDarkest,
                    ),
                  ),
                  SpaceV(value: 8.w),
                  InputDropdown(
                    value: "Public",
                    items: [
                      InputDropdownData(name: "My Circle", value: "My Circle"),
                      InputDropdownData(name: "Public", value: "Public"),
                      InputDropdownData(name: "Private", value: "Private"),
                    ],
                    onChanged: (value) {},
                  ),
                ],
              ),
              SpaceV(value: 40.h),
              Button(title: "Save", onPressed: () {}),
              ButtonText(
                  title: "Cancel",
                  textStyle: AppTextStyles.body2Bold,
                  onPressed: () {}),
              SpaceV(value: 40.h),
            ],
          ),
        ),
      ),
    );
  }
}
