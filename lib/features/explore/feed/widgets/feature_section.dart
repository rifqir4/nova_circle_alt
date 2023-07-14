import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova_circle_alt/shared/widgets/item/recommend_item.dart';

import '../../../../core/themes/themes.dart';
import '../../../../shared/widgets/widgets.dart';

class FeatureSection extends StatefulWidget {
  const FeatureSection({super.key});

  @override
  State<FeatureSection> createState() => _FeatureSectionState();
}

class _FeatureSectionState extends State<FeatureSection> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppDimension.paddingScreen),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          Builder(builder: (context) {
            if (selectedIndex == 0) {
              return _buildLists();
            }

            return _buildRecommend();
          })
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 40.h, bottom: 12.h),
          child: Text(
            "Feature",
            style: AppTextStyles.subtitle,
          ),
        ),
        ButtonTab(
          list: [
            ButtonTabData(id: "lists", title: "Lists"),
            ButtonTabData(id: "recommendations", title: "Recommendations"),
          ],
          onChange: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
        ),
        SpaceV(value: 20.h),
      ],
    );
  }

  Widget _buildLists() {
    return GridView.builder(
      shrinkWrap: true,
      primary: false,
      itemCount: 4,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: AppDimension.feedItemRatio,
          crossAxisSpacing: 20.w,
          mainAxisSpacing: 20.w),
      itemBuilder: (context, index) {
        return const FeedItem();
      },
    );
  }

  Widget _buildRecommend() {
    return GridView.builder(
      shrinkWrap: true,
      primary: false,
      itemCount: 4,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: AppDimension.recommendedItemRatio,
          crossAxisSpacing: 20.w,
          mainAxisSpacing: 20.w),
      itemBuilder: (context, index) {
        return const RecommendItem();
      },
    );
  }
}
