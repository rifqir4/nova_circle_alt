import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova_circle_alt/core/themes/app_colors.dart';
import 'package:nova_circle_alt/core/themes/app_dimension.dart';
import 'package:nova_circle_alt/core/themes/app_text_styles.dart';
import 'package:nova_circle_alt/core/utils/app_global.dart';
import 'package:nova_circle_alt/shared/widgets/button/button.dart';
import 'package:nova_circle_alt/shared/widgets/button/button_back.dart';
import 'package:nova_circle_alt/shared/widgets/button/button_text.dart';
import 'package:nova_circle_alt/shared/widgets/custom_appbar.dart';
import 'package:nova_circle_alt/shared/widgets/space.dart';

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
              Button(title: "Save", onPressed: () {}),
              ButtonText(
                  title: "Cancel",
                  textStyle: AppTextStyles.body2Bold,
                  onPressed: () {})
            ],
          ),
        ),
      ),
    );
  }
}
