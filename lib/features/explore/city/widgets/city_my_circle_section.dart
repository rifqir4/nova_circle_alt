import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova_circle_alt/shared/widgets/item/recommend_item.dart';

import '../../../../core/themes/themes.dart';
import '../../../../shared/widgets/widgets.dart';

class CityMyCircleSection extends StatelessWidget {
  const CityMyCircleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppDimension.paddingScreen),
      child: Column(
        children: [
          _buildHeader(),
          GridView.builder(
            shrinkWrap: true,
            primary: false,
            padding: EdgeInsets.zero,
            itemCount: 2,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: AppDimension.recommendedItemRatio,
                crossAxisSpacing: 20.w,
                mainAxisSpacing: 20.w),
            itemBuilder: (context, index) {
              return const RecommendItem();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.only(top: 32.h, bottom: 12.h),
      child: Row(
        children: [
          //Title
          Expanded(
            child: Text(
              "My Circle",
              style: AppTextStyles.subtitle,
            ),
          ),

          //button
          SizedBox(
            height: 20.w,
            width: 50.w,
            child: ButtonText(
              title: "See all",
              textStyle:
                  AppTextStyles.body2.copyWith(color: AppColors.greyDarkest),
              paddingVertical: 0,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
