import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nova_circle_alt/core/themes/themes.dart';
import 'package:nova_circle_alt/shared/resources/app_svgs.dart';
import 'package:nova_circle_alt/shared/widgets/widgets.dart';

enum HomePages { feed, discover, lists, you }

class BottomNavbar extends StatelessWidget {
  const BottomNavbar(
      {super.key, required this.selected, required this.onChange});

  final HomePages selected;
  final Function(HomePages) onChange;

  @override
  Widget build(BuildContext context) {
    final botnavHeight = Platform.isAndroid ? 70.h : 85.h;

    return Container(
      height: botnavHeight,
      decoration: BoxDecoration(color: AppColors.white, boxShadow: [
        BoxShadow(blurRadius: 12, color: AppColors.grey.withOpacity(0.5))
      ]),
      child: Column(
        children: [
          SpaceV(value: 12.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () => onChange.call(HomePages.feed),
                  child: _buildIcon(
                      name: "Feed",
                      icon: AppSvgs.icHomeOutlined,
                      iconSelected: AppSvgs.icHome,
                      isSelected: selected == HomePages.feed),
                ),
                GestureDetector(
                  onTap: () => onChange.call(HomePages.discover),
                  child: _buildIcon(
                      name: "Discover",
                      icon: AppSvgs.icDiscoverOutlined,
                      iconSelected: AppSvgs.icDiscover,
                      isSelected: selected == HomePages.discover),
                ),
                _buildAddBtn(),
                GestureDetector(
                  onTap: () => onChange.call(HomePages.lists),
                  child: _buildIcon(
                      name: "Lists",
                      icon: AppSvgs.icListsOutlined,
                      iconSelected: AppSvgs.icLists,
                      isSelected: selected == HomePages.lists),
                ),
                GestureDetector(
                  onTap: () => onChange.call(HomePages.you),
                  child: _buildIcon(
                      name: "you",
                      icon: AppSvgs.icYouOutlined,
                      iconSelected: AppSvgs.icYou,
                      isSelected: selected == HomePages.you),
                ),
              ],
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  Widget _buildIcon(
      {required String name,
      required String icon,
      required String iconSelected,
      bool isSelected = false}) {
    //Changes variabel
    final iconWidget = isSelected ? iconSelected : icon;

    return Container(
      width: 50.sp,
      height: 42.sp,
      color: Colors.transparent,
      child: Column(
        children: [
          SizedBox(
            width: 26.sp,
            height: 26.sp,
            child: SvgPicture.asset(iconWidget,
                width: 26.sp,
                colorFilter:
                    const ColorFilter.mode(AppColors.grey, BlendMode.srcIn)),
          ),
          const Spacer(),
          Text(
            name,
            style: AppTextStyles.body4.copyWith(color: AppColors.grey),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  Widget _buildAddBtn() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12.w),
      width: 42.sp,
      height: 42.sp,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14.w),
        color: AppColors.blueSky,
      ),
      child: Center(
        child: Icon(Icons.add, color: AppColors.white, size: 24.sp),
      ),
    );
  }
}
