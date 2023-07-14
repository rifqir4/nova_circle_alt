import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/themes/themes.dart';
import '../../../../core/utils/app_global.dart';
import '../../../../shared/widgets/widgets.dart';
import '../../../home/widgets/explore_navigator.dart';

class MyCircleSection extends StatelessWidget {
  const MyCircleSection({super.key});

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
            itemCount: 2,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: AppDimension.feedItemRatio,
                crossAxisSpacing: 20.w,
                mainAxisSpacing: 20.w),
            itemBuilder: (context, index) {
              return const FeedItem();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.only(top: 40.h, bottom: 12.h),
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
              onPressed: () {
                exploreNavigatorKey.currentState!
                    .pushNamed(ExploreRoute.circleListScreen);
              },
            ),
          ),
        ],
      ),
    );
  }
}
