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
    return Container(
      height: 85.h,
      decoration: BoxDecoration(color: AppColors.white, boxShadow: [
        BoxShadow(blurRadius: 12, color: AppColors.grey.withOpacity(0.5))
      ]),
      child: Column(
        children: [
          const Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => onChange.call(HomePages.feed),
                  child: _buildIcon(
                      name: "Feed",
                      icon: AppSvgs.icHome,
                      isSelected: selected == HomePages.feed),
                ),
                GestureDetector(
                  onTap: () => onChange.call(HomePages.discover),
                  child: _buildIcon(
                      name: "Discover",
                      icon: AppSvgs.icDiscover,
                      isSelected: selected == HomePages.discover),
                ),
                _buildAddBtn(),
                GestureDetector(
                  onTap: () => onChange.call(HomePages.lists),
                  child: _buildIcon(
                      name: "Lists",
                      icon: AppSvgs.icLists,
                      isSelected: selected == HomePages.lists),
                ),
                GestureDetector(
                  onTap: () => onChange.call(HomePages.you),
                  child: _buildIcon(
                      name: "you",
                      icon: AppSvgs.icYou,
                      isSelected: selected == HomePages.you),
                ),
              ],
            ),
          ),
          SpaceV(value: 40.h),
        ],
      ),
    );
  }

  Widget _buildIcon(
      {required String name, required String icon, bool isSelected = false}) {
    //Changes variabel

    final color = isSelected ? AppColors.greyDarker : AppColors.grey;
    final fontWeight = isSelected ? FontWeight.bold : FontWeight.w400;

    return Container(
      width: 42.sp,
      height: 42.sp,
      color: Colors.transparent,
      child: Column(
        children: [
          SizedBox(
            width: 26.sp,
            height: 26.sp,
            child: SvgPicture.asset(icon,
                width: 26.sp,
                colorFilter: ColorFilter.mode(color, BlendMode.srcIn)),
          ),
          const Spacer(),
          Text(
            name,
            style: AppTextStyles.primary.copyWith(
                fontSize: 10.sp, color: color, fontWeight: fontWeight),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  Widget _buildAddBtn() {
    return Container(
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
