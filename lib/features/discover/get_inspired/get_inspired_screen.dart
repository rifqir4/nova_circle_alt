import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nova_circle_alt/core/router/app_nav.dart';
import 'package:nova_circle_alt/core/router/app_routes.dart';
import 'package:nova_circle_alt/core/themes/app_colors.dart';
import 'package:nova_circle_alt/core/themes/app_dimension.dart';
import 'package:nova_circle_alt/core/themes/app_text_styles.dart';
import 'package:nova_circle_alt/shared/resources/app_svgs.dart';
import 'package:nova_circle_alt/shared/widgets/button/button.dart';
import 'package:nova_circle_alt/shared/widgets/button/button_back.dart';
import 'package:nova_circle_alt/shared/widgets/custom_appbar.dart';
import 'package:nova_circle_alt/shared/widgets/space.dart';

class GetInspiredScreen extends StatefulWidget {
  const GetInspiredScreen({super.key});

  @override
  State<GetInspiredScreen> createState() => _GetInspiredScreenState();
}

class _GetInspiredScreenState extends State<GetInspiredScreen> {
  final pageController = PageController();

  bool showBackButton = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leading: showBackButton
            ? ButtonBack(
                onPressed: () {
                  pageController.previousPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.fastOutSlowIn);
                },
              )
            : const SizedBox.shrink(),
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: (index) => setState(() {
          showBackButton = index != 0;
        }),
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppDimension.paddingScreen,
            ),
            child: Column(
              children: [
                SvgPicture.asset(AppSvgs.illustrationPlaneWindow),
                SpaceV(value: 24.w),
                Text(
                  "How adventurous are you feeling?",
                  style: AppTextStyles.body1Bold.copyWith(
                    fontSize: 18.sp,
                    color: AppColors.greyDarkest,
                  ),
                ),
                const Spacer(),
                Button(
                    title: "Continue",
                    onPressed: () => pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.fastOutSlowIn)),
                SpaceV(value: 24.h),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppDimension.paddingScreen,
            ),
            child: Column(
              children: [
                SvgPicture.asset(AppSvgs.illustrationPlaneWindow),
                SpaceV(value: 24.w),
                Text(
                  "What are you looking for?",
                  style: AppTextStyles.body1Bold.copyWith(
                    fontSize: 18.sp,
                    color: AppColors.greyDarkest,
                  ),
                ),
                const Spacer(),
                Button(
                    title: "Continue",
                    onPressed: () => pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.fastOutSlowIn)),
                SpaceV(value: 24.h),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppDimension.paddingScreen,
            ),
            child: Column(
              children: [
                SvgPicture.asset(AppSvgs.illustrationSpotList),
                SpaceV(value: 24.w),
                Text(
                  "How far are you willing to travel?",
                  style: AppTextStyles.body1Bold.copyWith(
                    fontSize: 18.sp,
                    color: AppColors.greyDarkest,
                  ),
                ),
                const Spacer(),
                Button(
                    title: "Show the recommendation",
                    onPressed: () => AppNav.push(AppRoutes.previewScreen)),
                SpaceV(value: 24.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
