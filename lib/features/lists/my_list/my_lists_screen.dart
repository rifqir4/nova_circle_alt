import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nova_circle_alt/core/router/app_nav.dart';
import 'package:nova_circle_alt/core/router/app_routes.dart';
import 'package:nova_circle_alt/core/themes/themes.dart';
import 'package:nova_circle_alt/core/utils/app_global.dart';
import 'package:nova_circle_alt/shared/resources/app_svgs.dart';
import 'package:nova_circle_alt/shared/widgets/button/button_text.dart';
import 'package:nova_circle_alt/shared/widgets/custom_appbar.dart';
import 'package:nova_circle_alt/shared/widgets/space.dart';

class MyListsScreen extends StatelessWidget {
  const MyListsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleText: "My Lists",
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: SpaceV(value: 12.h)),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: AppDimension.paddingScreen,
              ),
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(8.w),
              ),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      AppNav.push(AppRoutes.wishListScreen);
                    },
                    child: _buildItem(
                        title: "Wishlist", subtitle: "My Circle | 13 Spots"),
                  ),
                  SpaceV(value: 8.h),
                  GestureDetector(
                    onTap: () {
                      AppNav.push(AppRoutes.visitedListScreen);
                    },
                    child: _buildItem(
                        title: "Visited", subtitle: "My Circle | 10 Spots"),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(child: SpaceV(value: 24.h)),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: AppDimension.paddingScreen,
              ),
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(8.w),
              ),
              child: Column(
                children: [
                  _buildItem(
                      title: "Summer trip", subtitle: "10 recommendations"),
                  SpaceV(value: 8.h),
                  _buildItem(title: "Birthday", subtitle: "5 recommendations"),
                  SpaceV(value: 8.h),
                  ButtonText(
                    title: "Create new list",
                    textStyle: AppTextStyles.body3
                        .copyWith(color: AppColors.greyDarker),
                    onPressed: () {
                      mainNavigatorKey.currentState
                          ?.pushNamed(AppRoutes.addNewList);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItem({required String title, required String subtitle}) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: AppColors.greyLightest,
        borderRadius: BorderRadius.circular(10.w),
      ),
      child: Row(
        children: [
          Container(
            width: 40.w,
            height: 40.w,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(13.w),
            ),
            child: Center(
              child: SizedBox(
                height: 24.w,
                width: 24.w,
                child: SvgPicture.asset(
                  AppSvgs.icDocument,
                  colorFilter:
                      const ColorFilter.mode(AppColors.sunset, BlendMode.srcIn),
                ),
              ),
            ),
          ),
          SpaceH(value: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.body2
                      .copyWith(color: AppColors.greyDarkest),
                ),
                SpaceV(value: 4.w),
                Text(
                  subtitle,
                  style:
                      AppTextStyles.body3.copyWith(color: AppColors.greyDarker),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
