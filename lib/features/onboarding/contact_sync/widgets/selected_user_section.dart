import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova_circle_alt/features/onboarding/contact_sync/widgets/button_follow.dart';

import '../../../../core/themes/themes.dart';
import '../../../../shared/widgets/widgets.dart';

class SelectedUserSection extends StatelessWidget {
  const SelectedUserSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Discover our selected users",
          style: AppTextStyles.body1Bold.copyWith(color: AppColors.greyDarkest),
        ),
        SpaceV(value: 12.h),
        Container(
          padding: EdgeInsets.symmetric(vertical: 16.h),
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(8.sp)),
          child: Row(
            children: List.generate(4, (index) {
              return Expanded(child: _Item(index: index));
            }),
          ),
        ),
      ],
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.5.w),
      child: Column(
        children: [
          _buildPicture(),
          Padding(
            padding: EdgeInsets.only(top: 0.w, bottom: 8.w),
            child: Text(
              "Johnny Edlind",
              textAlign: TextAlign.center,
              style: AppTextStyles.body4.copyWith(
                color: AppColors.greyDarker,
                height: 1.1,
                fontSize: 11.sp,
              ),
            ),
          ),
          ButtonFollow(isFollow: index == 2),
        ],
      ),
    );
  }

  Widget _buildPicture() {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.all(6.w),
          child: AspectRatio(
            aspectRatio: 1,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: AppColors.blueSky,
                  borderRadius: BorderRadius.circular(18.w)),
            ),
          ),
        ),
        Positioned(
            top: 2.w,
            right: 2.w,
            child: Container(
              width: 16.w,
              height: 16.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: AppColors.sunsetLight,
              ),
              child: Center(
                  child: Icon(Icons.done, size: 14.w, color: AppColors.white)),
            ))
      ],
    );
  }
}
